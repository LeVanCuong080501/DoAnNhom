using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_Gio_Hang : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["cus_username"] != null)
            {
                loadData();
            }
            else
            {
                alert.alert_Warning(Page, "Bạn phải đăng nhập để xem giỏ hàng !", "");
                Response.Redirect("/dang-nhap");
            }
        }

    }
    protected void loadData()
    {
        
        var check_kh = (from kh in db.tbCustomers
                        where kh.cus_username == Request.Cookies["cus_username"].Value
                        select kh);
        
        var check_gh = (from gh in db.tbOrders
                        join hh in db.tbProducts on gh.product_id equals hh.product_id
                        join lh in db.tbProductCates on hh.productcate_id equals lh.productcate_id
                        where gh.cus_id == check_kh.FirstOrDefault().cus_id
                        && gh.order_hidden == true
                        orderby gh.order_id descending
                        select new
                        {
                            gh.order_id,
                            gh.cus_id,
                            gh.product_id,
                            gh.order_product,
                            hh.product_image,
                            hh.product_title,
                            gh.order_amount,
                            lh.productcate_title,
                            gh.order_address,
                            gh.order_date,
                            gh.order_datereceive,
                            gh.order_thanhtien,
                            hh.product_price,
                           // thanhtien = hh.product_price * gh.order_amount,
                            tinhtrang =gh.order_active == false ? "Đặt hàng" : "Đã đặt hàng",
                            style =gh.order_active == false ?"": "background: #cd1313;pointer-events: none;"
                        });
       // txtText.Value = string.Join(",", check_gh.Select(x => x.order_id));
        rpGiohang.DataSource = check_gh;
        rpGiohang.DataBind();
       

    }
    protected void imgSanPham_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton id = (ImageButton)sender;
        int idsp = Convert.ToInt32(id.CommandArgument);
        var getProduct = (from pro in db.tbProducts
                          where pro.product_id == idsp
                          select pro).FirstOrDefault();
        Response.Redirect("/" + getProduct.link_seo);
    }

    protected void btnSanPham_Click(object sender, EventArgs e)
    {
        LinkButton id = (LinkButton)sender;
        int idsp = Convert.ToInt32(id.CommandArgument);
        var getProduct = (from pro in db.tbProducts
                          where pro.product_id == idsp
                          select pro).FirstOrDefault();
        Response.Redirect("/" + getProduct.link_seo);

    }

    protected void btnXoa_Click(object sender, EventArgs e)
    {
        int idgh = Convert.ToInt32(txtID.Value);
        tbOrder update = (from o in db.tbOrders
                          where o.order_id == idgh
                          select o).FirstOrDefault();
        if (update != null)
        {
            update.order_hidden = false;
          //  db.tbOrders.DeleteOnSubmit(delete);
            db.SubmitChanges();
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert", "swal('Xoá thành công!','','success').then(function(){window.location.reload();})", true);
        }
    }

    protected void btnDatHang_Click(object sender, EventArgs e)
    {
        //  alert.alert_Success(Page, "a", "");
        int idgh = Convert.ToInt32(txtIDOrder.Value);
        int thanhtien = Convert.ToInt32(txtthanhtien.Value);
        var check_kh = (from kh in db.tbCustomers
                        where kh.cus_username == Request.Cookies["cus_username"].Value
                        select kh).FirstOrDefault();

        tbOrder update = (from sp in db.tbOrders
                          where sp.cus_id == check_kh.cus_id
                          && sp.order_id == idgh
                          select sp).FirstOrDefault();
        if (update != null)
        {
            update.order_active = true;
            update.order_date = DateTime.Today;
            update.order_datereceive = DateTime.Today.AddDays(5);
            update.order_amount =Convert.ToInt32( txtSL.Value);
            update.order_thanhtien = txtthanhtien.Value;
            update.order_submit = false;
            db.SubmitChanges();
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert", "swal('Đặt hàng thành công!','','success').then(function(){window.location.reload();})", true);
        }
    }
}