using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_usercontrol_Default_Block_Product : System.Web.UI.UserControl
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        var listcate = from pc in db.tbProductCates
                       where pc.productcate_parent != 0
                       && pc.productcate_show == true
                       orderby  pc.productcate_position ascending 
                       select new
                       {
                           pc.productcate_id,
                           pc.productcate_title,
                           pc.meta_image,
                           pc.link_seo,
                       };
        rpProductCate.DataSource = listcate;
        rpProductCate.DataBind();
    }

    protected void rpProductCate_ItemDataBound(object sender, RepeaterItemEventArgs e)

    {
        Repeater rpProduct = e.Item.FindControl("rpProduct") as Repeater;
        int productcate_id = int.Parse(DataBinder.Eval(e.Item.DataItem, "productcate_id").ToString());
        var product = (from pr in db.tbProducts
                       where pr.productcate_id == productcate_id
                       //&& pr.product_show == true
                       orderby pr.product_position descending
                       select new
                       {
                           pr.productcate_id,
                           pr.product_id,
                           pr.product_title,
                           pr.product_content,
                           pr.product_image,
                           pr.link_seo,
                           price = pr.product_price == 0 ? "Liên Hệ" : String.Format("{0:0,0 ₫}", pr.product_price),
                           pr.product_price_new,
                       }).Take(10);
        rpProduct.DataSource = product;
        rpProduct.DataBind();
    }
}