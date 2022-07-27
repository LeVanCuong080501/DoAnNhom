using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_Login_Custormer : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert aler = new cls_Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    if (Request.Cookies["UserName"] != null)
        //    {
        //        txtUsername.Value = Request.Cookies["UserName"].Value;
        //    }
        //}
        var getcontact = from ct in db.tbContacts
                         select ct;
        //Đổ dữ liệu COntact
        rpContact.DataSource = from ct in db.tbContacts
                               select ct;
        rpContact.DataBind();
    }

    protected void btnLogin_ServerClick(object sender, EventArgs e)
    {
        
        cls_security md5 = new cls_security();
        string passmd5 = md5.HashCode(txtPassword.Value);
        string userName = txtUsername.Value.Trim();
        var viewUserName = from tb in db.tbCustomers
                           where tb.cus_username == userName.ToLower()
                           && tb.cus_password == passmd5
                           select tb;

      
        if (viewUserName.Count() > 0)
        {
           // admin_User list = viewUserName.Single();
            HttpCookie ck = new HttpCookie("cus_username");
            string s = ck.Value;
            ck.Value = userName;
            ck.Expires = DateTime.Now.AddDays(365);
            Response.Cookies.Add(ck);
            Response.Redirect("/trang-chu");
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "AlertBox", "swal('Sai tên đăng nhập / mật khẩu!', '','warning')", true);

        }
    }
    public bool checknull()
    {
        if (txt_Username.Value != "" && txt_PassWord.Value != "" && txt_RPassword.Value != ""
            && txt_Phone.Value!= null && txt_SName.Value!=null &&txt_FName.Value!=null)
        {
            return true;
        }
        else return false;
    }
    private void setNULL()
    {
        txt_Username.Value = null;
        txt_PassWord.Value = null;
        txt_RPassword.Value = null;
        txt_Phone.Value = null;
        txt_SName.Value = null;
        txt_FName.Value = null;
    }
    protected void btnSignup_ServerClick(object sender, EventArgs e)
    {
        var check_kh = (from kh in db.tbCustomers
                        where kh.cus_username == txt_Username.Value
                        select kh
                        );
        if (checknull() == false)
        {
            aler.alert_Warning(Page, "Hãy nhập đầy đủ thông tin!", "");
        }
        else if (check_kh.Count() >0)
        {
            aler.alert_Error(Page, "Tài khoản đã tồn tại", "");

        }
        else if( txt_PassWord.Value != txt_RPassword.Value)
        {
            aler.alert_Warning(Page, "Nhập lại mật khẩu không đúng !", "");

        }
        else
        {
            cls_security md5 = new cls_security();
            string passmd5 = md5.HashCode(txt_PassWord.Value);
            tbCustomer insert = new tbCustomer();
            insert.cus_username = txt_Username.Value;
            insert.cus_password = passmd5;
            insert.cus_phone = txt_Phone.Value;
            insert.cus_name = txt_FName.Value +" "+ txt_SName.Value;
            insert.cus_date = DateTime.Today;
            //insert.cus_DoB=
            db.tbCustomers.InsertOnSubmit(insert);
            try
            {
                db.SubmitChanges();
                aler.alert_Success(Page, "Đăng ký thành công !", "");
                setNULL();
            }
            catch (Exception ex)
            {
                aler.alert_Error(Page, "Đăng ký không thành công !", "");

            }
        }
    }
}