using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_web_ProductDetail : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public string title, titleCate, titleCateLink, titleCateLink1, idCate, summary, content, price, image, link, phone;
    cls_Alert alert = new cls_Alert();
    protected void Page_Load(object sender, EventArgs e)
    {

        var routerid = RouteData.Values["id"];

        var getProduct = (from pro in db.tbProducts
                          where pro.product_id == Convert.ToInt32(RouteData.Values["id"])
                          select new
                          {
                              pro.product_id,
                              pro.productcate_id,
                              pro.product_title,
                              pro.link_seo,
                              pro.product_summary,
                              pro.product_content,
                              pro.product_image,
                              price = pro.product_price == 0 ? "Liên Hệ" : pro.product_price.ToString(),

                          }).FirstOrDefault();

        title = getProduct.product_title;
        image = getProduct.product_image;
        price = getProduct.price;

        var getCate = (from cate in db.tbProductCates
                       where cate.productcate_id == getProduct.productcate_id
                       select cate).FirstOrDefault();
        titleCate = getCate.productcate_title;
        link = getCate.link_seo;
        //get dat hang
        txtnameProduct.Value = getProduct.product_title;

        //txtslProduct.Value = quantity.Value;
        var getSpLienQuan = (from sp in db.tbProducts
                             where sp.productcate_id == getCate.productcate_id
                             orderby sp.product_id descending
                             select new
                             {
                                 sp.product_id,
                                 sp.product_title,
                                 sp.product_image,
                                 sp.link_seo,
                                 price = sp.product_price == 0 ? "Liên Hệ" : String.Format("{0:0,0 ₫}", sp.product_price),
                             }).Take(1000);

        rpProduct.DataSource = getSpLienQuan;
        rpProduct.DataBind();
        //Popup Liên Hệ
        var getphone = from ph in db.tbContacts
                       select ph;
        phone = getphone.Single().contact_hotline;

        var getSLban = (from or in db.tbOrders
                       where or.product_id == Convert.ToInt32(RouteData.Values["id"])
                       && or.order_active == true select or.order_amount) ;
        txtSoLuongBan.Value = getSLban.Sum().ToString();
    }
    public bool checknull()
    {
        if (txtnameProduct.Value != ""  && txt_Content.Value != "" && txt_Address.Value !=null)
            return true;
        else return false;
    }
    protected void btn_send_ServerClick(object sender, EventArgs e)
    {
        var id_sanpham = RouteData.Values["id"];
        var checksp = from sp in db.tbProducts
                      where sp.product_id == Convert.ToInt32(id_sanpham)
                      select sp;
        if (Request.Cookies["cus_username"] != null)
        {
            if (checknull() == false)
            {
                alert.alert_Error(Page, "Vui lòng nhập đầy đủ thông tin!!", "");
            }
            else
            {
                var checkkh = (from kh in db.tbCustomers
                               where kh.cus_username == Request.Cookies["cus_username"].Value
                               select kh).FirstOrDefault();
                tbOrder insert = new tbOrder();
                // insert.order_custumer = txt_Name.Value;
                insert.order_product = txtnameProduct.Value;
                //insert.order_amount = Convert.ToInt32(txt_SoLuong_Popup.Value);
                insert.order_content = txt_Content.Value;
                // insert.order_address = txt_Email.Value;
                // insert.order_phone = txt_Phone.Value;
                //insert.order_date = DateTime.Now;
                insert.order_phone = checkkh.cus_phone;
                insert.order_active = false;
                insert.cus_id = checkkh.cus_id;
                insert.product_id =Convert.ToInt32(id_sanpham);
                insert.order_address = txt_Address.Value;
                insert.order_custumer = checkkh.cus_name;
                insert.order_thanhtien = checksp.FirstOrDefault().product_price.ToString();
                insert.order_amount = 1;
                insert.order_hidden = true;
                db.tbOrders.InsertOnSubmit(insert);
                db.SubmitChanges();
                alert.alert_Success(Page, "Thêm Thành Công ^^", "");
            }
        }
        else
        {
            alert.alert_Warning(Page, "Bạn phải đăng nhập để thêm vào giỏ hàng!", "");
        }
        
    }
}