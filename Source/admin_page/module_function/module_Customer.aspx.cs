using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_Customer : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    private int _id;
    protected void Page_Load(object sender, EventArgs e)
    {
        // Kiểm trả session login nếu khác null thì vào form xử lý
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
        // nếu session = null thì trả về trang login
        else
        {
            Response.Redirect("/admin-login");
        }
    }
    private void loadData()
    {
        // load data đổ vào var danh sách
        var getData = from nc in db.tbCustomers
                      orderby nc.cus_active, nc.cus_date descending
                      select new {
                          nc.cus_id,
                          nc.cus_name,
                          nc.cus_email,
                          nc.cus_phone,
                          nc.cus_content,
                          nc.cus_date,
                          cus_active = nc.cus_active==true? "Đã Xem":"Chưa Xem"
                      };
        // đẩy dữ liệu vào gridivew
        grvList.DataSource = getData;
        grvList.DataBind();
    }
    private void setNULL()
    {
        txtHoten.Text = "";
        txtemail.Text = "";
        txtNoidung.Value = "";
        txtPhone.Text = "";
    }
    protected void btnThem_Click(object sender, EventArgs e)
    {
        // Khi nhấn nút thêm thì mật định session id = 0 để thêm mới
        Session["_id"] = 0;
        // gọi hàm setNull để trả toàn bộ các control về rỗng
        setNULL();
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupControl.Show();", true);
    }
    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        // get value từ việc click vào gridview
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "cus_id" }));
        // đẩy id vào session
        Session["_id"] = _id;
        var getData = (from nc in db.tbCustomers
                       where nc.cus_id == _id
                       select nc).Single();
        txtHoten.Text = getData.cus_name;
        txtemail.Text = getData.cus_email;
        txtPhone.Text = getData.cus_phone;
        txtNoidung.Value = getData.cus_content;
        txtDay.Text = getData.cus_date+"";
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show();", true);
        getData.cus_active = true;
        db.SubmitChanges();
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "function(){grvList.Refresh();}", true);

    }
    protected void btnXoa_Click(object sender, EventArgs e)
    {

        //cls_LienHe cls;
        //List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "lienhe_id" });
        //if (selectedKey.Count > 0)
        //{
        //    foreach (var item in selectedKey)
        //    {
        //        cls = new cls_LienHe();
        //        if (cls.Linq_Xoa(Convert.ToInt32(item)))
        //            alert.alert_Success(Page, "Xóa thành công", "");
        //        else
        //            alert.alert_Error(Page, "Xóa thất bại", "");
        //    }
        //}
        //else
        //    alert.alert_Warning(Page, "Bạn chưa chọn dữ liệu", "");
    }

    public bool checknull()
    {
        if (txtemail.Text != "")
            return true;
        else return false;
    }


    //protected void btnLuu_Click(object sender, EventArgs e)
    //{
    //    cls_Customer cls = new cls_Customer();
    //    if (checknull() == false)
    //        alert.alert_Warning(Page, "Nhập đầy đủ thông tin!", "");
    //    else
    //    {
    //        if (Session["_id"].ToString() == "0")
    //        {
    //            if (cls.Linq_Them(txtHoten.Text, txtemail.Text, txtPhone.Text, txtNoidung.Value,Convert.ToDateTime(txtDay.Text)))
    //            {
    //                alert.alert_Success(Page, "Thêm thành công", "");
    //                loadData();
    //            }
    //            else alert.alert_Error(Page, "Thêm thất bại", "");
    //        }
    //        else
    //        {
    //            if (cls.Linq_Sua(Convert.ToInt32(Session["_id"].ToString()), txtHoten.Text, txtemail.Text, txtPhone.Text, txtNoidung.Value, Convert.ToDateTime(txtDay.Text)))
    //            {
    //                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert", "swal('Cập nhật thành công','','success').then(function(){grvList.Refresh();})", true);
    //                loadData();
    //                popupControl.ShowOnPageLoad = false;
    //            }
    //            else alert.alert_Error(Page, "Cập nhật thất bại", "");
    //        }
    //    }
        
    //}
}