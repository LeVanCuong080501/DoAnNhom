using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_web_Contact : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        var getcontact = from ct in db.tbContacts
                         select ct;
        //Đổ dữ liệu COntact
        rpContact.DataSource = from ct in db.tbContacts
                               select ct;
        rpContact.DataBind();
    }
    public bool checknull()
    {
        if (txtemail.Value != "" || txtname.Value != "" || txtphone.Value != "" || txtcontent.Value != "")
            return true;
        else return false;
    }
    protected void btnSave_ServerClick(object sender, EventArgs e)
    {
        if (checknull() == false)
        {
            alert.alert_Error(Page, "Vui lòng nhập đầy đủ thông tin!!", "");
        }
        else
        {
            tbCustomer ins = new tbCustomer();
            ins.cus_name = txtname.Value;
            ins.cus_email = txtemail.Value;
            ins.cus_phone = txtphone.Value;
            ins.cus_content = txtcontent.Value;
            ins.cus_date = DateTime.Now;
            ins.cus_active = false;
            db.tbCustomers.InsertOnSubmit(ins);
            db.SubmitChanges();
            alert.alert_Success(Page,"Gửi Thành Công ^^","");
        }
    }
}