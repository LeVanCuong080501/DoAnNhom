using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_web_ProductGroup : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public string title, title2, id;
    protected void Page_Load(object sender, EventArgs e)
    {
        // lấy tên sản phẩm sau khi chọn
        var getproductCate = (from cate in db.tbProductCates
                              where cate.productcate_id == Convert.ToInt16(RouteData.Values["id"])
                              select cate).FirstOrDefault();
        title = getproductCate.productcate_title;

        //lấy 
        var productcate = from pc in db.tbProductCates
                          where pc.productcate_parent == Convert.ToInt16(RouteData.Values["id"])
                          select new {
                              pc.productcate_id,
                              pc.productcate_content,
                              pc.productcate_parent,
                              pc.productcate_title,
                              pc.productcate_position,
                              pc.link_seo
        };
        rpProductCate.DataSource = productcate;
        rpProductCate.DataBind();
        var category = from cg in db.tbProductCates
                       where cg.productcate_parent == 0
                       orderby cg.productcate_id ascending
                       select new
                       {
                           cg.link_seo,
                           cg.productcate_title,
                           cg.productcate_id,
                           kt = (from cate1 in db.tbProductCates where cate1.productcate_parent == cg.productcate_id select cate1).Count() > 0 ? "fa fa-angle-down" : "style='display:none'"
                       };
        rpCategory.DataSource = category;
        rpCategory.DataBind();
    }

    protected void rpProductCate_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Repeater rpProduct = e.Item.FindControl("rpProduct") as Repeater;
        int productcate_id = int.Parse(DataBinder.Eval(e.Item.DataItem, "productcate_id").ToString());

        //lấy loại sản phẩm == productcate để show sản phẩm của loại đó
        rpProduct.DataSource = (from gr in db.tbProducts
                               where gr.product_chungloai == productcate_id.ToString() || gr.productcate_id == productcate_id
                               && gr.product_show == true
                               orderby gr.product_id descending
                               select new {
                                   gr.product_id,
                                   gr.product_title,
                                   gr.product_image,
                                   gr.link_seo,
                                   price = gr.product_price == 0 ? "Liên Hệ" : String.Format("{0:0,0 ₫}", gr.product_price),
                               }).Take(8000);
        rpProduct.DataBind();
    }

    protected void rpCategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Repeater rpGory = e.Item.FindControl("rpGory") as Repeater;
        int productcate_id = int.Parse(DataBinder.Eval(e.Item.DataItem, "productcate_id").ToString());

        rpGory.DataSource = from gr in db.tbProductCates
                            where gr.productcate_parent == productcate_id
                            orderby gr.productcate_id
                            select gr;
        rpGory.DataBind();
    }
}