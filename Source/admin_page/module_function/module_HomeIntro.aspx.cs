//using DevExpress.Web.ASPxHtmlEditor;
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//public partial class admin_page_module_function_module_HomeIntro : System.Web.UI.Page
//{
//    dbcsdlDataContext db = new dbcsdlDataContext();
//    cls_Alert alert = new cls_Alert();
//    private int _id;
//    protected void Page_Load(object sender, EventArgs e)
//    {
//        edtnoidung.Toolbars.Add(HtmlEditorToolbar.CreateStandardToolbar1());
//        if (Session["AdminLogined"] != null)
//        {
//            admin_User logedMember = Session["AdminLogined"] as admin_User;
//            //if (logedMember.groupuser_id == 3)
//            //    Response.Redirect("/user-home");
//            if (!IsPostBack)
//            {
//                Session["_id"] = 0;
//            }
//            loadData();
//        }
//        else
//        {
//            Response.Redirect("/admin-login");
//        }
//    }
//    private void loadData()
//    {
//        var getData = from tb in db.tbHomeIntros
//                      select tb;
//        grvList.DataSource = getData;
//        grvList.DataBind();
       
//    }
//    private void setNULL()
//    {
//        txttensanpham.Text = "";
//        edtnoidung.Html = "";
//        SEO_KEYWORD.Text = "";
//        SEO_TITLE.Text = "";
//        SEO_LINK.Text = "";
//        SEO_DEP.Text = "";
//        SEO_IMAGE.Text = "";
       
//    }
//    protected void btnThem_Click(object sender, EventArgs e)
//    {
//        Session["_id"] = 0;
//        setNULL();
//        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupControl.Show();showImg('');", true);
//    }
//    protected void btnChiTiet_Click(object sender, EventArgs e)
//    {
//        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "intro_id" }));
//        Session["_id"] = _id;
//        var getData = (from tb in db.tbHomeIntros
//                       where tb.intro_id == _id
//                       select tb).Single();
//        txttensanpham.Text = getData.intro_title;
//        edtnoidung.Html = getData.intro_content;
//        SEO_KEYWORD.Text = getData.meta_keywords;
//        SEO_TITLE.Text = getData.meta_title;
//        SEO_LINK.Text = getData.link_seo;
//        SEO_DEP.Text = getData.meta_description;
//        SEO_IMAGE.Text = getData.meta_image;
//        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show();", true);
//    }
//    protected void btnXoa_Click(object sender, EventArgs e)
//    {

//        cls_HomeIntro cls;
//        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "intro_id" });
//        if (selectedKey.Count > 0)
//        {
//            foreach (var item in selectedKey)
//            {
//                cls = new cls_HomeIntro();
//                if (cls.Linq_Xoa(Convert.ToInt32(item)))
//                    alert.alert_Success(Page, "Xóa thành công", "");
//                else
//                    alert.alert_Error(Page, "Xóa thất bại", "");
//            }
//        }
//        else
//            alert.alert_Warning(Page, "Bạn chưa chọn dữ liệu", "");
//    }

//    public bool checknull()
//    {
//        if (txttensanpham.Text != "" || edtnoidung.Html != "")
//            return true;
//        else return false;
//    }


//    protected void btnLuu_Click(object sender, EventArgs e)
//    {
//        cls_HomeIntro cls = new cls_HomeIntro();
//        if (checknull() == false)
//            alert.alert_Warning(Page, "Nhập đầy đủ thông tin!", "");
//        else
//        {
//            string KEYWORD = "", TitleSeo = "", Link = "", Dep = "", ImageSeo = "";
//            {
//                if (SEO_KEYWORD.Text != "")
//                {
//                    KEYWORD = SEO_KEYWORD.Text;
//                }
//                if (SEO_TITLE.Text != "")
//                {
//                    TitleSeo = SEO_TITLE.Text;
//                }
//                if (SEO_LINK.Text != "")
//                {
//                    Link = SEO_LINK.Text;
//                }
//                if (SEO_DEP.Text != "")
//                {
//                    Dep = SEO_DEP.Text;
//                }
//                if (SEO_IMAGE.Text != "")
//                {
//                    ImageSeo = SEO_IMAGE.Text;
//                }
//            }
//            if (Session["_id"].ToString() == "0")
//            {
//                if (cls.Linq_Them(txttensanpham.Text, edtnoidung.Html))
//                    alert.alert_Success(Page, "Thêm thành công", "");
//                else alert.alert_Error(Page, "Thêm thất bại", "");
//            }
//            else
//            {
//                if (cls.Linq_Sua(Convert.ToInt32(Session["_id"].ToString()), txttensanpham.Text, edtnoidung.Html, KEYWORD, TitleSeo, Link, Dep, ImageSeo))
//                    alert.alert_Success(Page, "Cập nhật thành công", "");
//                else alert.alert_Error(Page, "Cập nhật thất bại", "");
//            }
//        }
//    }
//}