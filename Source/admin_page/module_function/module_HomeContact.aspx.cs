using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_HomeContact : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    private int _id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminLogined"] != null)
        {
            admin_User logedMember = Session["AdminLogined"] as admin_User;
            //if (logedMember.groupuser_id == 3)
            //    Response.Redirect("/user-home");
            if (!IsPostBack)
            {
                Session["_id"] = 0;
            }
            loadData();

        }
        else
        {
            Response.Redirect("/admin-login");
        }
    }
    private void loadData()
    {
        var getData = from tb in db.tbHomeContacts
                      select new
                      {
                          tb.contact_id,
                          tb.contact_address,
                          tb.contact_email,
                          tb.contact_hotline,
                          tb.contact_phone,
                      };
        grvList.DataSource = getData;
        grvList.DataBind();
    }

    protected void btnChiTiet_Click(object sender, EventArgs e)
    {

        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "contact_id" }));
        Session["_id"] = _id;
        var getData = (from tb in db.tbHomeContacts
                       where tb.contact_id == _id
                       select tb).Single();
        txtName.Text = getData.contact_hotline;
        txtDiaChi.Text = getData.contact_address;
        txtEmail.Text = getData.contact_email;
        txtPhone.Text = getData.contact_phone;
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show();", true);
    }
    protected void btnXoa_Click(object sender, EventArgs e)
    {
        cls_Contact cls;
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "contact_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                cls = new cls_Contact();
                if (cls.Linq_Xoa(Convert.ToInt32(item)))
                    alert.alert_Success(Page, "Xóa thành công", "");
                else
                    alert.alert_Error(Page, "Xóa thất bại", "");
            }
        }
        else
            alert.alert_Warning(Page, "Bạn chưa chọn dữ liệu", "");
    }


    protected void btnLuu_Click(object sender, EventArgs e)
    {
        cls_HomeContact cls = new cls_HomeContact();
        if (cls.Linq_Them(Convert.ToInt32(Session["_id"].ToString()),txtName.Text,txtPhone.Text,txtDiaChi.Text, txtEmail.Text))
            alert.alert_Success(Page, "Đã cập nhật", "");
        else alert.alert_Error(Page, "Thất bại", "");
    }
}