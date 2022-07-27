using DevExpress.Web.ASPxHtmlEditor;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_ProductGroup : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    private int _id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminLogined"] != null)
        {
            edtnoidung.Toolbars.Add(HtmlEditorToolbar.CreateStandardToolbar1());
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
        var getData = from tb in db.tbProductCates
                      where tb.productcate_parent == 0
                      orderby tb.productcate_position
                      select tb;
        grvList.DataSource = getData;
        grvList.DataBind();
    }
    private void setNULL()
    {
        txtloaisanpham.Text = "";
        txtvitri.Text = "";
        edtnoidung.Html = "";
        SEO_KEYWORD.Text = "";
        SEO_TITLE.Text = "";
        SEO_LINK.Text = "";
        SEO_DEP.Text = "";
        SEO_IMAGE.Text = "";
    }
    protected void btnThem_Click(object sender, EventArgs e)
    {

        Session["_id"] = 0;
        setNULL();
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupControl.Show();", true);
    }
    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "productcate_id" }));
        Session["_id"] = _id;
        var getData = (from tb in db.tbProductCates
                       where tb.productcate_id == _id
                       select new
                       {
                           tb.productgroup_id,
                           tb.productcate_title,
                           tb.productcate_position,
                           tb.meta_keywords,
                           tb.meta_title,
                           tb.link_seo,
                           tb.meta_description,
                           tb.meta_image,
                           tb.productcate_content,
                           tb.productcate_show
                           //parent = (from p in db.tbProductGroups where p.productgroup_id == tb.productgroup_parent select p).Single().productgroup_title
                       }).Single();
        //ddlParent.Text = getData.parent;
        txtloaisanpham.Text = getData.productcate_title;
        txtvitri.Text = getData.productcate_position + "";
        ddltinhtrang.Text = getData.productcate_show == true ? "Hiển thị" : "Không hiển thị";
        SEO_KEYWORD.Text = getData.meta_keywords;
        SEO_TITLE.Text = getData.meta_title;
        SEO_LINK.Text = getData.link_seo;
        SEO_DEP.Text = getData.meta_description;
        SEO_IMAGE.Text = getData.meta_image;
        edtnoidung.Html = getData.productcate_content;
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show();", true);
    }
    protected void btnXoa_Click(object sender, EventArgs e)
    {
        cls_ProductGroup cls;
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "productcate_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                cls = new cls_ProductGroup();
                if (cls.productgroup_Xoa(Convert.ToInt32(item)))
                    alert.alert_Success(Page, "Xóa thành công", "");
                else
                    alert.alert_Error(Page, "Xóa thất bại", "");
            }
        }
        else
            alert.alert_Warning(Page, "Bạn chưa chọn dữ liệu", "");
    }
    public bool checknull()
    {
        if (txtloaisanpham.Text != "" || txtvitri.Text != "")
            return true;
        else return false;
    }
    protected void btnLuu_Click(object sender, EventArgs e)
    {
        cls_ProductGroup cls = new cls_ProductGroup();
        bool tinhtrang = ddltinhtrang.Text == "Hiển thị" ? true : false;
        if (checknull() == false)
            alert.alert_Warning(Page, "Hãy nhập đầy đủ thông tin!", "");
        else
        {
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
                if (cls.productgroup_Them(int.Parse(txtvitri.Text), txtloaisanpham.Text, tinhtrang, edtnoidung.Html, KEYWORD, TitleSeo, Link, Dep, image123))
                    alert.alert_Success(Page, "Thêm thành công", "");
                else alert.alert_Error(Page, "Thêm thất bại", "");
            }
            else
            {
                if (cls.productgroup_Sua(Convert.ToInt32(Session["_id"].ToString()), int.Parse(txtvitri.Text), txtloaisanpham.Text, tinhtrang, edtnoidung.Html, KEYWORD, TitleSeo, Link, Dep, image123))
                    alert.alert_Success(Page, "Cập nhật thành công", "");
                else alert.alert_Error(Page, "Cập nhật thất bại", "");
            }
        }
    }
}