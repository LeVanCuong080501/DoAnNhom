using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebMasterPage : System.Web.UI.MasterPage
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    var abc = txt_KeySearch.Value;
        //}

        //Session["KeyWord"] = txt_KeySearch.Value;
        //txt_KeySearch.Value = Session["KeyWord"].ToString();
        if (!IsPostBack)
        {
            if (Request.Cookies["cus_username"] != null)
            {
                li_Login.Visible = false;

                var check_user = (from kh in db.tbCustomers
                                  where kh.cus_username == Request.Cookies["cus_username"].Value
                                  select kh);
                txtUser.Value = check_user.FirstOrDefault().cus_name;
                txtUser.Visible = true;
            }
            else
            {
                li_Login.Visible = true;
                txtUser.Visible = false;
            }
        }
        rpMenu.DataSource = from mn in db.tbProductCates
                            where mn.productcate_parent == 0 && mn.productcate_show == true
                            select new
                            {
                                mn.productcate_id,
                                mn.productcate_title,
                                mn.link_seo,
                                kt = (from mn1 in db.tbProductCates where mn1.productcate_parent == mn.productcate_id select mn1).Count() > 0 ? "fa fa-angle-right" : "style='display:none'",
                            };
        rpMenu.DataBind();
        //rpNews.DataSource = from n in db.tbNewCates select n;
        //rpNews.DataBind();
        rpContact.DataSource = from ct in db.tbContacts
                               select ct;
        rpContact.DataBind();

        //rpMenuResponsive.DataSource= from mr in db.tbProductCates
        //                             where mr.productcate_parent == 0 && mr.productcate_show == true
        //                             select new
        //                             {
        //                                 mr.productcate_id,
        //                                 mr.productcate_title,
        //                                 mr.link_seo,
        //                                 mr.produtcate_icon,
        //                                 Product_menu = (from cate1 in db.tbProductCates where cate1.productcate_parent == mr.productcate_id select cate1).Count() > 0 ? "fa fa-angle-right" : "style='display:none'",
        //                             };
        //rpMenuResponsive.DataBind();
        //rpMenuResponsive_Cate.DataSource = from mrc in db.tbProductCates
        //                                   where mrc.productcate_parent == Convert.ToInt32(RouteData.Values["id"])
        //                                   select mrc;
        //rpMenuResponsive_Cate.DataBind();

    }

    protected void rpMenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Repeater rpMenuProduct = e.Item.FindControl("rpMenuProduct") as Repeater;
        int productcate_id = int.Parse(DataBinder.Eval(e.Item.DataItem, "productcate_id").ToString());

        var menu = from pr in db.tbProductCates
                   where productcate_id == pr.productcate_parent
                   select pr;
        rpMenuProduct.DataSource = menu;
        rpMenuProduct.DataBind();
    }
    //Kiểm tra email
    private bool isEmail(string txtEmail)
    {
        Regex re = new Regex(@"^(?("")(""[^""]+?""@)|(([0-9a-z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-z])@))" +
        @"(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-z][-\w]*[0-9a-z]*\.)+[a-z0-9]{2,17}))$",
                      RegexOptions.IgnoreCase);
        return re.IsMatch(txtEmail);
    }

    protected void btnDangKy_ServerClick(object sender, EventArgs e)
    {
        if (isEmail(contact_email.Value) != true)
        {
            alert.alert_Error(Page, "Vui lòng kiểm tra lại email của bạn", "");
        }
        else
        {
            tbDangKyEmail ins = new tbDangKyEmail();
            ins.dke_email = contact_email.Value;
            ins.dke_tinhtrang = "Chưa xem";
            db.tbDangKyEmails.InsertOnSubmit(ins);
            db.SubmitChanges();
            alert.alert_Success(Page, "Đăng ký thành công", "");
        }
    }

    protected void btn_Logout_ServerClick(object sender, EventArgs e)
    {
        Response.Cookies["cus_username"].Expires = DateTime.Now.AddDays(-1);
        li_Login.Visible = true;
        txtUser.Visible = false;
        Response.Redirect("/trang-chu");
    }
}
