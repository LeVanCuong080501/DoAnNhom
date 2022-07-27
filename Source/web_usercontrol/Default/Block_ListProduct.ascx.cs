using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_usercontrol_Default_Block_ListProduct : System.Web.UI.UserControl
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        DanhMucSpCate.DataSource = from dm in db.tbProductCates
                                   where dm.productcate_parent == 0 && dm.productcate_show == true
                                   select new {
                                       dm.productcate_id,
                                       dm.productcate_title,
                                       dm.link_seo,
                                       dm.produtcate_icon,
                                       kt = (from cate1 in db.tbProductCates where cate1.productcate_parent == dm.productcate_id select cate1).Count() > 0 ? "fa fa-angle-right" : "style='display:none'",
                                   };
        DanhMucSpCate.DataBind();

    }

    protected void DanhMucSpCate_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Repeater rpDanhMucSp = e.Item.FindControl("rpDanhMucSp") as Repeater;
        int productcate_id = int.Parse(DataBinder.Eval(e.Item.DataItem, "productcate_id").ToString());


        var product = from pr in db.tbProductCates
                   where productcate_id == pr.productcate_parent
                   select pr;
        rpDanhMucSp.DataSource = product;
        rpDanhMucSp.DataBind();
    }
}