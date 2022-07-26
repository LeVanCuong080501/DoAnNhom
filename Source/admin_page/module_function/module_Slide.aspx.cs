using DevExpress.Web.ASPxHtmlEditor;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_Slide : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    private int _id;
    public string image;
    protected void Page_Load(object sender, EventArgs e)
    {
        // edttieude1.Toolbars.Add(HtmlEditorToolbar.CreateStandardToolbar1());
        // edttieude2.Toolbars.Add(HtmlEditorToolbar.CreateStandardToolbar1());
        if (Session["AdminLogined"] != null)
        {
            admin_User logedMember = Session["AdminLogined"] as admin_User;
            //if (logedMember.groupuser_id == 3)
            //    Response.Redirect("/user-home");
            if (!IsPostBack)
            {
                Session["_id"] = 0;

            }
            loadData();
        }
        else
        {
            Response.Redirect("/admin-login");
        }
    }
    private void loadData()
    {
        var getData = from nc in db.tbSlides
                      orderby nc.slide_id descending
                      select new
                      {
                          nc.slide_id,
                          nc.slide_link,
                          nc.slide_date,
                          nc.slide_image,
                          hidden = nc.hidden == true ? "Hiển thị" : "Không hiển thị"
                      };
        // đẩy dữ liệu vào gridivew
        grvList.DataSource = getData;
        grvList.DataBind();
    }
    private void setNULL()
    {
        txtLink.Text = "";
        edttieude.Html = "";

    }
    protected void btnThem_Click(object sender, EventArgs e)
    {
        Session["_id"] = 0;
        setNULL();
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupControl.Show();showImg('');", true);
    }
    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        // get value từ việc click vào gridview
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "slide_id" }));
        // đẩy id vào session
        Session["_id"] = _id;
        var getData = (from nc in db.tbSlides
                       where nc.slide_id == _id
                       select nc).Single();
        edttieude.Html = getData.slide_title;
        txtLink.Text = getData.slide_link;
        if (getData.slide_image == null || getData.slide_image == "")
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show(); showImg1_1('" + "admin_images/Preview-icon.png" + "');", true);
        else
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show(); showImg1_1('" + getData.slide_image + "');", true);
    }
    protected void btnXoa_Click(object sender, EventArgs e)
    {
        cls_Slide cls;
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "slide_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                cls = new cls_Slide();
                tbSlide checkImage = (from i in db.tbSlides where i.slide_id == Convert.ToInt32(item) select i).SingleOrDefault();
                if (cls.Linq_Xoa(Convert.ToInt32(item)))
                {
                    alert.alert_Success(Page, "Xóa thành công", "");
                }
                else
                    alert.alert_Error(Page, "Xóa thất bại", "");
            }
        }
        else
            alert.alert_Warning(Page, "Bạn chưa chọn dữ liệu", "");
    }

    public bool checknull()
    {
        if (edttieude.Html != "" && txtLink.Text !="")
            return true;
        else return false;
    }

    protected void btnLuu_Click(object sender, EventArgs e)
    {
        cls_Slide cls = new cls_Slide();
        String folderUser = Server.MapPath("~/uploadimages/anhslide/");
        if (!Directory.Exists(folderUser))
        {
            Directory.CreateDirectory(folderUser);
        }
        //HttpFileCollection hfc = Request.Files;
        if (Page.IsValid && FileUpload1.HasFile)
        {
            string filename = Path.GetRandomFileName() + Path.GetExtension(FileUpload1.FileName);
            string fileName_save = Path.Combine(Server.MapPath("~/uploadimages/anhslide"), filename);
            FileUpload1.SaveAs(fileName_save);
            image = "/uploadimages/anhslide/" + filename;
        }
        if (checknull() == false)
            alert.alert_Warning(Page, "Hãy nhập đầy đủ thông tin!", "");
        else
        {
            if (Session["_id"].ToString() == "0")
            {
                if (cls.Linq_Them(image, txtLink.Text, edttieude.Html))
                {
                    alert.alert_Success(Page, "Thêm thành công", "");
                    loadData();
                }
                else alert.alert_Error(Page, "Thêm thất bại", "");
            }
            else
            {

                if (cls.Linq_Sua(Convert.ToInt32(Session["_id"].ToString()), image, txtLink.Text, edttieude.Html))
                {
                    ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert", "swal('Cập nhật thành công','','success').then(function(){grvList.Refresh();})", true);
                    popupControl.ShowOnPageLoad = false;
                    loadData();
                }
                else alert.alert_Error(Page, "Cập nhật thất bại", "");
            }
        }
    }
    public void delete(string sFileName)
    {
        if (sFileName != String.Empty)
        {
            if (File.Exists(sFileName))

                File.Delete(sFileName);
        }
    }


    protected void btnShow_Click(object sender, EventArgs e)
    {
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "slide_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                var getdata = (from intr in db.tbSlides where intr.slide_id == Convert.ToInt32(item) select intr).SingleOrDefault();
                if (getdata != null)
                {
                    getdata.hidden = true;
                    getdata.slide_date = DateTime.Now;
                    db.SubmitChanges();
                    alert.alert_Success(Page, "Hiển thị thành công!", "");
                }
                else
                {
                    alert.alert_Error(Page, "Hiển thị thất bại!", "");
                }
            }
        }
    }

    protected void btnShowhiden_Click(object sender, EventArgs e)
    {
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "slide_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                var getdata = (from intr in db.tbSlides where intr.slide_id == Convert.ToInt32(item) select intr).SingleOrDefault();
                if (getdata != null)
                {
                    getdata.hidden = false;
                    getdata.slide_date = DateTime.Now;
                    db.SubmitChanges();
                    alert.alert_Success(Page, "Ẩn thành công!", "");
                }
                else
                {
                    alert.alert_Error(Page, "Ẩn thất bại!", "");
                }
            }
        }
    }
}