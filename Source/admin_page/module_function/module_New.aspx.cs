using DevExpress.Web.ASPxHtmlEditor;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_New : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    private int _id;
    public string image;
    protected void Page_Load(object sender, EventArgs e)
    {
        edtnoidung.Toolbars.Add(HtmlEditorToolbar.CreateStandardToolbar1());
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
        // load data đổ vào var danh sách
        var getData = from nc in db.tbNews
                      orderby nc.news_id
                      orderby nc.news_id descending
                      select new
                      {
                          nc.news_id,
                          nc.news_title,
                          nc.news_summary,
                          nc.news_image,
                          nc.news_datetime,
                          active = nc.active == true ? "Đã hiển thị" : "Chưa hiển thị"
                      };
        // đẩy dữ liệu vào gridivew
        grvList.DataSource = getData;
        grvList.DataBind();
    }
    private void setNULL()
    {
        txttitle.Text = "";
        txtsummary.Text = "";
        edtnoidung.Html = "";
        SEO_KEYWORD.Text = "";
        SEO_TITLE.Text = "";
        SEO_LINK.Text = "";
        SEO_DEP.Value = "";
        SEO_IMAGE.Text = "";
    }
    protected void btnThem_Click(object sender, EventArgs e)
    {
        if (Session["AdminLogined"] != null)
        {
            Session["_id"] = null;
            setNULL();
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupControl.Show();", true);
        }
    }

    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        // get value từ việc click vào gridview
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "news_id" }));
        // đẩy id vào session
        Session["_id"] = _id;
        var getData = (from nc in db.tbNews
                       where nc.news_id == _id
                       select nc).Single();
        txttitle.Text = getData.news_title;
        txtsummary.Text = getData.news_summary;
        edtnoidung.Html = getData.news_content;
        SEO_KEYWORD.Text = getData.meta_keywords;
        SEO_TITLE.Text = getData.meta_tittle;
        SEO_LINK.Text = getData.link_seo;
        SEO_DEP.Value = getData.meta_description;
        SEO_IMAGE.Text = getData.meta_image;
        image = getData.news_image;
        if (getData.news_image == null || getData.news_image == "")
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show(); showImg1_1('" + "admin_images/Preview-icon.png" + "');", true);
        else
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show(); showImg1_1('" + getData.news_image + "');", true);
    }

    protected void btnXoa_Click(object sender, EventArgs e)
    {
        cls_New cls;
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "news_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                cls = new cls_New();

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
        if (txttitle.Text != "" && edtnoidung.Html != "" && txtsummary.Text!="")
            return true;
        else return false;
    }
    protected void btnLuu_Click(object sender, EventArgs e)
    {
        cls_New cls = new cls_New();
        String folderUser = Server.MapPath("~/uploadimages/anhtintuc/");
        if (!Directory.Exists(folderUser))
        {
            Directory.CreateDirectory(folderUser);
        }
        if (Page.IsValid && FileUpload1.HasFile)
        {
            string filename = Path.GetRandomFileName() + Path.GetExtension(FileUpload1.FileName);
            string fileName_save = Path.Combine(Server.MapPath("~/uploadimages/anhtintuc"), filename);
            FileUpload1.SaveAs(fileName_save);
            image = "/uploadimages/anhtintuc/" + filename;
        }
        if (checknull() == false)
            alert.alert_Warning(Page, "Hãy nhập đầy đủ thông tin!", "");
        else
        {
            string KEYWORD = "", TitleSeo = "", Link = "", Dep = "", ImageSeo = "";
            {
                if (SEO_KEYWORD.Text != "")
                {
                    KEYWORD = SEO_KEYWORD.Text;
                }
                if (SEO_TITLE.Text != "")
                {
                    TitleSeo = SEO_TITLE.Text;
                }
                if (SEO_LINK.Text != "")
                {
                    Link = SEO_LINK.Text;
                }
                if (SEO_DEP.Value != "")
                {
                    Dep = SEO_DEP.Value;
                }
                if (SEO_IMAGE.Text != "")
                {
                    ImageSeo = SEO_IMAGE.Text;
                }
            }
            if (Session["_id"] == null)
            {
                if (cls.Linq_Them(txttitle.Text, txtsummary.Text, image, edtnoidung.Html, KEYWORD, TitleSeo, Link, Dep, ImageSeo))
                {
                    alert.alert_Success(Page, "Thêm thành công", "");
                    popupControl.ShowOnPageLoad = false;
                    loadData();
                }
                else alert.alert_Error(Page, "Thêm thất bại", "");
            }
            else
            {

                if (cls.Linq_Sua(Convert.ToInt32(Session["_id"].ToString()), txttitle.Text, txtsummary.Text, image, edtnoidung.Html, KEYWORD, TitleSeo, Link, Dep, ImageSeo))
                {
                    //alert.alert_Success(Page, "Cập nhật thành công", "");
                    ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert", "swal('Cập nhật thành công','','success').then(function(){grvList.Refresh();})", true);
                    popupControl.ShowOnPageLoad = false;
                    loadData();
                }
                else alert.alert_Error(Page, "Cập nhật thất bại", "");
            }
        }
    }
    protected void btnHienThi_Click(object sender, EventArgs e)
    {
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "news_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                var getsp = (from sp in db.tbNews where sp.news_id == Convert.ToInt32(item) select sp).SingleOrDefault();
                if (getsp.active == true)
                {
                    alert.alert_Success(Page, "Tin đang được hiển thị!", "");
                }
                else
                {

                    if (getsp != null)
                    {
                        getsp.active = true;
                        getsp.news_datetime = DateTime.Now;
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
    }

    protected void btnAn_Click(object sender, EventArgs e)
    {
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "news_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                var getsp = (from sp in db.tbNews where sp.news_id == Convert.ToInt32(item) select sp).SingleOrDefault();
                if (getsp.active == false)
                {
                    alert.alert_Success(Page, "Tin đang được ẩn!", "");
                }
                else
                {

                    if (getsp != null)
                    {
                        getsp.active = false;
                        getsp.news_datetime = DateTime.Now;
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
}