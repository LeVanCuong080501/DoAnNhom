using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_HomeSlide : System.Web.UI.Page
{

    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    private int _id;
    protected void Page_Load(object sender, EventArgs e)
    {

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
        var getData = from tb in db.tbSlides
                      select tb;
        grvList.DataSource = getData;
        grvList.DataBind();

    }
    private void setNULL()
    {
        txttensanpham.Text = "";

    }
    protected void btnThem_Click(object sender, EventArgs e)
    {
        Session["_id"] = 0;
        setNULL();
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupControl.Show();showImg('');", true);
    }
    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "slide_id" }));
        Session["_id"] = _id;
        var getData = (from tb in db.tbSlides
                       where tb.slide_id == _id
                       select tb).Single();
        txttensanpham.Text = getData.slide_link;
        string image = getData.slide_image;
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show(); showImg('" + image + "');", true);
    }
    public void delete(string sFileName)
    {
        if (sFileName != String.Empty)
        {
            if (File.Exists(sFileName))
             
                File.Delete(sFileName);
        }
    }
    protected void btnXoa_Click(object sender, EventArgs e)
    {
        cls_HomeSlide cls;
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "slide_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                cls = new cls_HomeSlide();
                if (cls.Linq_Xoa(Convert.ToInt32(item)))
                {
                    tbSlide checkImage = (from i in db.tbSlides where i.slide_id == Convert.ToInt32(item) select i).SingleOrDefault();
                    string pathToFiles = Server.MapPath(checkImage.slide_image);
                    delete(pathToFiles);
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
        if (txttensanpham.Text != "")
            return true;
        else return false;
    }


    protected void btnLuu_Click(object sender, EventArgs e)
    {
        cls_UploadImage uploadImg = new cls_UploadImage();
        HttpFileCollection fileCollection = Request.Files;
        string fileName = uploadImg.uploadSingle(fileCollection);
        cls_HomeSlide cls = new cls_HomeSlide();
        if (checknull() == false)
            alert.alert_Warning(Page, "Hảy nhập đầy đủ thông tin!", "");
        else
        {
            if (Session["_id"].ToString() == "0")
            {
                if (cls.Linq_Them(txttensanpham.Text, fileName))
                    alert.alert_Success(Page, "Thêm thành công", "");
                else alert.alert_Error(Page, "Thêm thất bại", "");
            }
            else
            {
                if (cls.Linq_Sua(Convert.ToInt32(Session["_id"].ToString()), txttensanpham.Text, fileName))
                    alert.alert_Success(Page, "Cập nhật thành công", "");
                else alert.alert_Error(Page, "Cập nhật thất bại", "");
            }
        }
    }
}