using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_Language : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    private int _id;
    public string listcb ="";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["_id"] = 0;
            Session["list"] = "";
        }
        LoadData();
    }
    //private void loadData()
    //{
    //    rplanguage.DataSource = from tb in db.tbLanguages select tb;
    //    rplanguage.DataBind();
    //}
    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        _id = Convert.ToInt32(temp.Text);
        Session["_id"] = _id;
        var getData = (from tb in db.tbLanguages
                       where tb.language_id == _id
                       select tb).Single();
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Data", "showData('" + getData.language_name + "')", true);
    }

    protected void btnThem_Click(object sender, EventArgs e)
    {
        Session["_id"] = 0;
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Data", "showData('','1')", true);
    }

    protected void btnXoa_Click(object sender, EventArgs e)
    {
        cls_Language xoaData;
        string listid = txtlistcheck.Text;
        string[] list;
        list = listid.Split(',');
        foreach (var item in list)
        {
            xoaData = new cls_Language();
            xoaData.Linq_Xoa(Page, int.Parse(item.ToString()));
        }
        LoadData();
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Data", "window.location.reload()", true);
    }

    protected void btnLuu_Click(object sender, EventArgs e)
    {
        if (txtLanguage.Text != "")
        {
            if (Session["_id"].ToString() == "0")
            {
                cls_Language insert = new cls_Language();
                insert.Linq_Them(Page, txtLanguage.Text);
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Data", "window.location.reload()", true);
            }
            else
            {
                cls_Language update = new cls_Language();
                update.Linq_Sua(Page, Convert.ToInt32(Session["_id"].ToString()), txtLanguage.Text);
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Data", "window.location.reload()", true);
            }
        }
        else
        {
            return;
        }
    }
    private void LoadData()
    {
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["admin_TemplateConnectionString"].ConnectionString;
        SqlDataAdapter da = new SqlDataAdapter("select * from tbLanguage", constr);
        DataTable dt = new DataTable();
        da.Fill(dt);
        PagedDataSource pgitems = new PagedDataSource();
        System.Data.DataView dv = new System.Data.DataView(dt);
        pgitems.DataSource = dv;
        pgitems.AllowPaging = true;
        pgitems.PageSize = 3;
        pgitems.CurrentPageIndex = PageNumber;
        if (pgitems.PageCount >= 1)
        {
            rptPages.Visible = true;
            System.Collections.ArrayList pages = new System.Collections.ArrayList();
            for (int i = 0; i < pgitems.PageCount; i++)
                pages.Add((i + 1).ToString());
            rptPages.DataSource = pages;
            rptPages.DataBind();
        }
        else
            rptPages.Visible = false;
        rplanguage.DataSource = pgitems;
        rplanguage.DataBind();
    }
    public int PageNumber
    {
        get
        {
            if (ViewState["PageNumber"] != null)
                return Convert.ToInt32(ViewState["PageNumber"]);
            else
                return 0;
        }
        set
        {
            ViewState["PageNumber"] = value;
        }
    }
    
    protected void rptPages_ItemCommand1(object source, RepeaterCommandEventArgs e)
    {
        PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
        LoadData();
        Session["list"] = Session["list"].ToString() + txtlistcheck.Text + ",";
        listcb = Session["list"].ToString();
    }
}