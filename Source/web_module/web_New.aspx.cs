using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_web_New : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {


        var getdata = from n in db.tbNews
                            orderby n.news_id descending
                            select n;
        int item = 5;
        Decimal totalpage = Math.Ceiling(decimal.Divide((Decimal)getdata.Count(), (Decimal)item));
        if (Request.Params["Page"] != null)
        {
            rpNew.DataSource = getdata.Skip(item * (Convert.ToInt32(Request.Params["page"]) - 1)).Take(item).ToList();
            global_pagging.CurrentPage = Convert.ToInt32(Request.Params["page"]);
        }
        else
        {
            rpNew.DataSource = getdata.Take(item).ToList();
            global_pagging.CurrentPage = 1;
        }
        rpNew.DataBind();
        global_pagging.MaxPage = Convert.ToInt32(totalpage);
        if (getdata.Count() > 0)
        {
            global_pagging.pagingUrl = "/tin-tuc";
        }
    }
}