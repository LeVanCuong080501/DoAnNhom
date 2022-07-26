using DevExpress.Web.ASPxHtmlEditor;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_Product : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    private int _id;
    string image, image1, image2, image3, image4;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminLogined"] != null)
        {
            edtnoidung.Toolbars.Add(HtmlEditorToolbar.CreateStandardToolbar1());
            if (!IsPostBack)
            {
                Session["_id"] = 0;
            }
            loadData();
            admin_User logedMember = Session["AdminLogined"] as admin_User;
            if (logedMember.groupuser_id == 4)
            {
                //  loadgrvLookup();
                // dvDaiLy.Visible = true;
            }
            else
            {
                // dvDaiLy.Visible = false;
            }
        }
    }

    private void loadData()
    {
        if (Session["AdminLogined"] != null)
        {
            admin_User logedMember = Session["AdminLogined"] as admin_User;
            var getData = from tb in db.tbProducts
                          join c in db.tbProductCates on tb.productcate_id equals c.productcate_id
                          orderby tb.product_position
                          select new
                          {
                              tb.product_id,
                              tb.product_title,
                              tb.product_summary,
                              tb.product_price,
                              tb.product_content,
                              tb.product_image,
                              c.productcate_title,
                             // tb.product_tieubieu,
                              tb.product_position

                          };
            grvList.DataSource = getData;
            grvList.DataBind();
            ddlNhomSanPham.DataSource = from tb in db.tbProductCates
                                        select tb;
            ddlNhomSanPham.DataBind();
        }
        else
        {
            Response.Redirect("/admin-login");
        }
    }
    private void setNULL()
    {
        txttensanpham.Text = "";
        txttomtat.Text = "";
        edtnoidung.Html = "";
        txtgia.Text = "";
        txtPosition.Text = "";
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
            Session["_id"] = 0;
            setNULL();
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupControl.Show(); showImg1(''); showImg2(''); showImg3(''); showImg4(''); showImg5('');", true);
        }
    }
    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        if (Session["AdminLogined"] != null)
        {
            admin_User logedMember = Session["AdminLogined"] as admin_User;

            _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "product_id" }));
            Session["_id"] = _id;
            var getData = (from tb in db.tbProducts
                           join c in db.tbProductCates on tb.productcate_id equals c.productcate_id
                           where tb.product_id == _id
                           select new
                           {
                               tb.product_id,
                               tb.product_title,
                               tb.product_summary,
                               tb.product_price,
                               tb.product_content,
                               tb.product_image,
                               c.productcate_title,
                               tb.product_show,
                               tb.productcate_id,
                               tb.meta_keywords,
                               tb.meta_title,
                               tb.link_seo,
                               tb.meta_description,
                               tb.meta_image,
                               //tb.product_image1,
                               //tb.product_image2,
                               //tb.product_image3,
                               //tb.product_image4,
                               tb.product_position
                           }).Single();
            // ddlloaisanpham.Text = getData.productcate_title;
            ddlNhomSanPham.Text = getData.productcate_title;
            txttensanpham.Text = getData.product_title;
            edtnoidung.Html = getData.product_content;
            txttomtat.Text = getData.product_summary;
            txtPosition.Text = getData.product_position + "";
            SEO_KEYWORD.Text = getData.meta_keywords;
            SEO_TITLE.Text = getData.meta_title;
            SEO_LINK.Text = getData.link_seo;
            SEO_DEP.Value = getData.meta_description;
            SEO_IMAGE.Value = getData.meta_image;
            if (getData.product_image == null)
                image = "/admin_images/up-img.png";
            else
                image = getData.product_image;
            //if (getData.product_image1 == null)
            //    image1 = "/admin_images/up-img.png";
            //else
            //    image1 = getData.product_image1;
            //if (getData.product_image2 == null)
            //    image2 = "/admin_images/up-img.png";
            //else
            //    image2 = getData.product_image2;
            //if (getData.product_image3 == null)
            //    image3 = "/admin_images/up-img.png";
            //else
            //    image3 = getData.product_image3;
            //if (getData.product_image4 == null)
            //    image4 = "/admin_images/up-img.png";
            //else
            //    image4 = getData.product_image4;
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show(); showImg1_1('" + image + "'); showImg2_1('" + image1 + "'); showImg3_1('" + image2 + "'); showImg4_1('" + image3 + "'); showImg5_1('" + image4 + "');", true);
        }
    }
    protected void btnXoa_Click(object sender, EventArgs e)
    {
        cls_Product cls;
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "product_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                cls = new cls_Product();
                tbProduct checkImage = (from i in db.tbProducts where i.product_id == Convert.ToInt32(item) select i).SingleOrDefault();
                string pathToFiles = Server.MapPath(checkImage.product_image);
                delete(pathToFiles);
                if (cls.Product_Xoa(Convert.ToInt32(item)))
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
        if (txttensanpham.Text != "" || txttomtat.Text != "" || edtnoidung.Html != "" || txtgia.Text != "")
            return true;
        else return false;
    }


    protected void btnLuu_Click(object sender, EventArgs e)
    {
        if (Session["AdminLogined"] != null)
        {
            if (Page.IsValid && FileUpload1.HasFile)
            {
                string filename = (FileUpload1.FileName);
                string fileName_save = Path.Combine(Server.MapPath("~/uploadimages"), filename);
                FileUpload1.SaveAs(fileName_save);
                image = "/uploadimages/" + filename;
            }
            //if (Page.IsValid && FileUpload2.HasFile)
            //{
            //    string filename = (FileUpload2.FileName);
            //    string fileName_save = Path.Combine(Server.MapPath("~/uploadimages"), filename);
            //    FileUpload2.SaveAs(fileName_save);
            //    image1 = "/uploadimages/" + filename;
            //}
            //if (Page.IsValid && FileUpload3.HasFile)
            //{
            //    string filename = (FileUpload3.FileName);
            //    string fileName_save = Path.Combine(Server.MapPath("~/uploadimages"), filename);
            //    FileUpload3.SaveAs(fileName_save);
            //    image2 = "/uploadimages/" + filename;
            //}
            //if (Page.IsValid && FileUpload4.HasFile)
            //{
            //    string filename = (FileUpload4.FileName);
            //    string fileName_save = Path.Combine(Server.MapPath("~/uploadimages"), filename);
            //    FileUpload4.SaveAs(fileName_save);
            //    image3 = "/uploadimages/" + filename;
            //}
            //if (Page.IsValid && FileUpload5.HasFile)
            //{
            //    string filename = (FileUpload5.FileName);
            //    string fileName_save = Path.Combine(Server.MapPath("~/uploadimages"), filename);
            //    FileUpload5.SaveAs(fileName_save);
            //    image4 = "/uploadimages/" + filename;
            //}
            admin_User logedMember = Session["AdminLogined"] as admin_User;

            cls_Product cls = new cls_Product();
            if (checknull() == false)
                alert.alert_Warning(Page, "Hãy nhập đầy đủ thông tin!", "");
            else
            {
                int gia = 0;
                if (txtgia.Text == "")
                {
                    gia = 0;
                }
                else
                {
                    gia = Convert.ToInt32(txtgia.Text);
                }
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
                if (Session["_id"].ToString() == "0")
                { 
                    int vitri= 1000;
                    if(txtPosition.Text!="")
                    {
                        vitri = Convert.ToInt32(txtPosition.Text);
                    }
                    if (cls.Product_Them(1, txttensanpham.Text, image, txttomtat.Text, edtnoidung.Html, gia, true, true, Convert.ToInt32(ddlNhomSanPham.Value.ToString()), KEYWORD, TitleSeo, Link, Dep, ImageSeo, vitri))
                    {
                        alert.alert_Success(Page, "Thêm thành công", "");
                        setNULL();
                    }
                    else alert.alert_Error(Page, "Thêm thất bại", "");
                }
                else
                {
                    int vitri = 1000;
                    if (txtPosition.Text != "")
                    {
                        vitri = Convert.ToInt32(txtPosition.Text);
                    }
                    if (cls.Product_Sua(Convert.ToInt32(Session["_id"].ToString()), txttensanpham.Text, image, image1, image2, image3, image4, txttomtat.Text, edtnoidung.Html, gia, Convert.ToInt32(ddlNhomSanPham.Value.ToString()), KEYWORD, TitleSeo, Link, Dep, ImageSeo, vitri))
                        alert.alert_Success(Page, "Cập nhật thành công", "");
                    else alert.alert_Error(Page, "Cập nhật thất bại", "");
                }
            }
        }
    }
    //protected void btnVip_Click(object sender, EventArgs e)
    //{
    //    cls_Product cls;
    //    List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "product_id" });
    //    if (selectedKey.Count > 0)
    //    {
    //        foreach (var item in selectedKey)
    //        {
    //            cls = new cls_Product();
    //            if (cls.Product_Vip(Convert.ToInt32(item)))
    //                alert.alert_Success(Page, "Đã thêm vào sản phẩm tiêu biểu", "");
    //            else
    //                alert.alert_Error(Page, "Thất bại", "");
    //        }
    //    }
    //    else
    //        alert.alert_Warning(Page, "Bạn chưa chọn dữ liệu", "");
    //}
    public void delete(string sFileName)
    {
        if (sFileName != String.Empty)
        {
            if (File.Exists(sFileName))

                File.Delete(sFileName);
        }
    }
}