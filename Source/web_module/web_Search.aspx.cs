using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_web_Search : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public string keyword;
    DataTable dtProduct;
    protected void Page_Load(object sender, EventArgs e)
    {

        DanhMucSpCate.DataSource = from dm in db.tbProductCates
                                   where dm.productcate_parent == 0 && dm.productcate_show == true
                                   select new
                                   {
                                       dm.productcate_id,
                                       dm.productcate_title,
                                       dm.link_seo,
                                       dm.produtcate_icon,
                                       kt = (from cate1 in db.tbProductCates where cate1.productcate_parent == dm.productcate_id select cate1).Count() > 0 ? "fa fa-angle-right" : "style='display:none'",
                                   };
        DanhMucSpCate.DataBind();
        rpColor.DataSource = from cl in db.tbColors
                             select new{
                                 cl.color_id,
                                 cl.color_name,
                                 check123 = ""
                             };
        rpColor.DataBind();
        loaddata();
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
    public void loaddata()
    {
        var listProduct = from pr in db.tbProducts
                          where pr.product_title.Contains(Request.Params["id"])
                          select new
                          {
                              pr.product_id,
                              pr.product_price,
                              pr.product_image,
                              pr.product_title,
                              pr.color_id,
                              pr.link_seo
                          };
        var listtong = listProduct;
        rpProduct.DataSource = listProduct;
        rpProduct.DataBind();
        if (txtMinPrice.Value != "")
        {
            if (Convert.ToInt32(txtMinPrice.Value) < Convert.ToInt32(txtMaxPrice.Value))
            {
                listProduct = listProduct.Where(x => x.product_price >= Convert.ToInt32(txtMinPrice.Value) && x.product_price <= Convert.ToInt32(txtMaxPrice.Value));
                listtong = listProduct;
                rpProduct.DataSource = listtong;
                rpProduct.DataBind();
                //Session["CheckGender"] = check_nam.Checked == true;
            }
        }

        // kieemr tra ten chat lieu
        if (txtDanhSachChecked.Value != "")
        {
            //get value ở txtDanhSachCheckedget
            string checkid = txtDanhSachChecked.Value;
            // cát chuổi trong txtDanhSachChecked
            string[] getcheckid = checkid.Split(',');
            foreach (string item in getcheckid)
            {
                var listtam = listtong.Where(x => x.color_id == Convert.ToInt32(item));
                //listProduct = listtam;
                foreach (var itempro in listtam)
                {
                    if (Convert.ToInt32(item) == Convert.ToInt32(itempro.color_id))
                    {
                        // add row những sản phẩm có checked
                        DataRow row = dtProduct.NewRow();
                        row["product_id"] = itempro.product_id;
                        row["product_price"] = itempro.product_price;
                        row["product_image"] = itempro.product_image;
                        row["product_title"] = itempro.product_title;
                        row["color_id"] = itempro.color_id;
                        dtProduct.Rows.Add(row);
                    }
                }
                Session["spSearch"] = dtProduct;
            }
            //listtong = dtProduct;
            rpColor.DataSource = dtProduct;
            rpColor.DataBind();
        }
    }



    protected void btnApply_All_ServerClick(object sender, EventArgs e)
    {
        loaddata();
    }

    protected void checked123()
    {
        // ----------------load checked---------------
        if (txtDanhSachChecked.Value == "")
        {
            var listProduct = from pr in db.tbColors
                              select new
                              {
                                  pr.color_id,
                                  pr.color_name,
                                  check123 = ""
                              };
            rpColor.DataSource = listProduct;
            rpColor.DataBind();
        }
        else
        {
            var listProduct = from pr in db.tbColors
                              select new
                              {
                                  pr.color_id,
                                  pr.color_name,
                                  check123 = ""
                              };

            var list2 = from u in listProduct.AsEnumerable()
                            //orderby u.amenities_vitri
                        select new
                        {
                            u.color_id,
                            u.color_name,
                            check123 = txtDanhSachChecked.Value.Contains(u.color_id.ToString()) ? "checked" : "",
                        };
            rpColor.DataSource = list2;
            rpColor.DataBind();

        }
    }
}