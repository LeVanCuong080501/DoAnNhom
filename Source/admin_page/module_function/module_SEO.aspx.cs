using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_SEO : System.Web.UI.Page
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
        var getData = from tb in db.tbSEOs
                      select new
                      {
                          tb.seo_id,
                          tb.page_name,
                          tb.seo_title,
                          tb.seo_description,
                          
                      };
        grvList.DataSource = getData;
        grvList.DataBind();
    }
    private void setNULL()
    {
        SEO_KEYWORD.Text = "";
        SEO_TITLE.Text = "";
        SEO_LINK.Text = "";
        SEO_DEP.Text = "";
        SEO_IMAGE.Text = "";
    }
    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "seo_id" }));
        Session["_id"] = _id;
        var getData = (from tb in db.tbSEOs
                       where tb.seo_id == _id
                       select new
                       {
                           tb.seo_id,
                           tb.seo_keyworld,
                           tb.seo_title,
                           tb.seo_description,
                           tb.seo_link,
                           tb.seo_image,
                           page_seo = tb.seo_id == 1 ? "Trang chủ" : "Trang liên hệ"
                       }).Single();
        SEO_KEYWORD.Text = getData.seo_keyworld.ToString();
        SEO_TITLE.Text = getData.seo_title.ToString();
        SEO_LINK.Text = getData.seo_link.ToString();
        SEO_DEP.Text = getData.seo_description.ToString();
        SEO_IMAGE.Text = getData.seo_image;

        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show();", true);
    }
    protected void btnLuu_Click(object sender, EventArgs e)
    {
        cls_SEO cls = new cls_SEO();
        string KEYWORD = "", TitleSeo = "", Link = "", Dep = "", image123 = "";

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
        if (SEO_DEP.Text != "")
        {
            Dep = SEO_DEP.Text;
        }
        if (SEO_IMAGE.Text != "")
        {
            image123 = SEO_IMAGE.Text;
        }
        if (Session["_id"].ToString() == "0")
        {
        }
        else
        {
            if (cls.Linq_Sua(Convert.ToInt32(Session["_id"].ToString()), KEYWORD, TitleSeo, Link, Dep, image123))
                alert.alert_Success(Page, "Cập nhật thành công", "");
            else alert.alert_Error(Page, "Cập nhật thất bại", "");
        }

    }
}