using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_access_admin_Login : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminLogined"] != null)
        {
            Response.Redirect("/Admin_Default.aspx");
        }
        if (!IsPostBack)
        {
            if (Request.Cookies["UserName"] != null)
            {
                txtUser.Value = Request.Cookies["UserName"].Value;
            }
        }
    }
    protected void btnLogin_ServerClick(object sender, EventArgs e)
    {
     //   cls_security md5 = new cls_security();
      //  string passmd5 = md5.HashCode(txtPassword.Value);
        //string userName = txtUser.Value.Trim();
        //var viewUserName = from tb in db.admin_Users
        //                   where tb.username_username == userName.ToLower() 
        //                   && tb.username_password == txtPassword.Value
        //                   && tb.username_active == true
        //                   select tb;
        var checkuser = from u in db.admin_Users
                        where u.username_username == txtUser.Value && u.username_password == txtPassword.Value
                        select u;

        if (checkuser.Count() > 0)
        {
            admin_User list = checkuser.Single();
            Session["AdminLogined"] = list;

            if (remember.Checked)
                Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(15);
            else
                Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["UserName"].Value = txtUser.Value.Trim();

             Response.Redirect("/admin-home");
            //Response.Redirect("ad_Default.aspx");
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "AlertBox", "swal('Sai tên đăng nhập / mật khẩu!', '','warning')", true);
        }
    }
}