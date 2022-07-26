using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_web_Product : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public string title, title2, idcate, titlecate, titlecatelink, link_seo;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        // lấy tên cate để khi chọn tên cate sẽ show đúng sản phẩm
        var check_idgroup = (from cate in db.tbProductCates
                             where cate.productcate_id == Convert.ToInt32(RouteData.Values["id"])
                             select new {
                                 cate.productcate_content,
                                 cate.productcate_id,
                                 cate.productcate_show,
                                 cate.link_seo,
                                 cate.productcate_parent,
                             }).FirstOrDefault();
      
        if (check_idgroup.productcate_parent != 0)
        {
            var get_title_group = (from par in db.tbProductCates where par.productcate_id == check_idgroup.productcate_parent select par).First();
            if (get_title_group != null)
            {
                titlecate = get_title_group.productcate_title;
                link_seo = get_title_group.link_seo;
            }
           
        }
        else
            {
                li_cate.Visible = false;
            }
        var getproductCate1 = (from cate1 in db.tbProductCates
                               where cate1.productcate_id == Convert.ToInt16(RouteData.Values["id"])
                               select new {
                                   cate1.productcate_id,
                                   cate1.productcate_title,
                                   hidden= cate1.productcate_parent == 0 ? "'display:none'" : "'display:none'"

                               }).FirstOrDefault();
        title = getproductCate1.productcate_title;
        var getCate = from cate in db.tbProductCates
                      where cate.productcate_id == Convert.ToInt16(RouteData.Values["id"])
                      select cate;
      
        // sản phẩm
        var getProduct = (from pro in db.tbProducts
                          where pro.productcate_id == Convert.ToInt32(RouteData.Values["id"])
                          select new
                          {
                              pro.product_id,
                              pro.productcate_id,
                              pro.product_title,
                              pro.product_summary,
                              pro.product_content,
                              pro.product_image,
                              link =pro.link_seo,
                              price = pro.product_price == 0 ? "Liên Hệ" : pro.product_price.ToString(),
                          });

        rpProduct.DataSource = getProduct;
        rpProduct.DataBind();
    }

    
}