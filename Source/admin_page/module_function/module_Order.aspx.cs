using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_Order : System.Web.UI.Page
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
        var getData = from nc in db.tbOrders
                      orderby nc.order_active, nc.order_date descending
                      select new {
                          nc.order_id,
                          nc.order_custumer,
                          nc.order_address,
                          nc.order_phone,
                          nc.order_content,
                          nc.order_date,
                          nc.order_amount,
                          nc.order_product,
                          order_active = nc.order_active==true? "Đã Xem":"Chưa Xem"
                      };
        // đẩy dữ liệu vào gridivew
        grvList.DataSource = getData;
        grvList.DataBind();
    }
   
    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        // get value từ việc click vào gridview
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "order_id" }));
        // đẩy id vào session
        Session["_id"] = _id;
        var getData = (from nc in db.tbOrders
                       where nc.order_id == _id
                       select nc).Single();
        txtHoten.Text = getData.order_custumer;
        txtaddress.Text = getData.order_address;
        txtPhone.Text = getData.order_phone;
        txtNoidung.Value = getData.order_content;
        txtDay.Text = getData.order_date+"";
        txtSoluong.Text = getData.order_amount+"";
        txtSanpham.Text = getData.order_product;
        getData.order_active = true;
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show();", true);
        db.SubmitChanges();
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "function(){grvList.Refresh();}", true);

    }
   
}