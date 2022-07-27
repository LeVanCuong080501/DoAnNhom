using DevExpress.Web.ASPxHtmlEditor;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_ProductImage : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    private int _id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminLogined"] != null)
        {
            if (!IsPostBack)
            {
                Session["_id"] = 0;
            }
            loadData();
        }
    }

    private void loadData()
    {
        if (Session["AdminLogined"] != null)
        {
                var getData = from tb in db.tbProducts
                              join pc in db.tbProductCates on tb.productcate_id equals pc.productcate_id
                              where pc.productcate_show==true
                              orderby tb.product_id descending
                              select new
                              {
                                  tb.product_id,
                                  tb.product_title,
                                  tb.product_image,
                                  pc.productcate_title,
                                  tb.productcate_id,
                              };
                grvList.DataSource = getData;
                grvList.DataBind();
        }
        else
        {
            Response.Redirect("/admin-login");
        }
    }
    protected void btnThem_Click(object sender, EventArgs e)
    {
        if (Session["AdminLogined"] != null)
        {
            Session["_id"] = 0;
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupControl.Show();showImg1('');", true);
        }
    }
    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        if (Session["AdminLogined"] != null)
        {
            _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "product_id" }));
            Session["_id"] = _id;
            var getData = (from tb in db.tbProducts
                           join gr in db.tbProductCates on tb.productcate_id equals gr.productcate_id
                           where tb.product_id == _id
                           select new
                           {
                               tb.product_id,
                               tb.product_title,
                               tb.product_image,
                               gr.productcate_title,
                               tb.productcate_id,
                           }).Single();
            txttensanpham.Text = getData.product_title;
            string image = getData.product_image;
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show(); showImg1('" + image + "');", true);
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
        if (txttensanpham.Text != "")
            return true;
        else return false;
    }


    protected void btnLuu_Click(object sender, EventArgs e)
    {
        if (Session["AdminLogined"] != null)
        {
            admin_User logedMember = Session["AdminLogined"] as admin_User;
            string image1 = "";
            if (Page.IsValid && FileUpload1.HasFile)
            {
                string filename = Path.GetRandomFileName() + Path.GetExtension(FileUpload1.FileName);
                string fileName_save = Path.Combine(Server.MapPath("~/uploadimages/products"), filename);
                FileUpload1.SaveAs(fileName_save);
                image1 =  filename;
            }
            cls_Product cls = new cls_Product();
            if (checknull() == false)
                alert.alert_Warning(Page, "Hãy nhập đầy đủ thông tin!", "");
            else
            {
                //int groupParent = Convert.ToInt32((from pr in db.tbProductGroups where pr.productgroup_id == Convert.ToInt32(ddlNhomSanPham.Value) select pr).SingleOrDefault().productgroup_parent);
                if (Session["_id"].ToString() == "0")
                {
                }
                else
                {
                    if (cls.Product_SuaImage(Convert.ToInt32(Session["_id"].ToString()), image1))
                        alert.alert_Success(Page, "Cập nhật thành công", "");
                    else alert.alert_Error(Page, "Cập nhật thất bại", "");
                }
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
    
}