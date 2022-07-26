using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_js_web_NewsCate : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public string title;
    protected void Page_Load(object sender, EventArgs e)
    {
        loaddata();
    }

    private void loaddata()
    {
        int _id = Convert.ToInt32(RouteData.Values["id"]);
        string name="";
        var getdata = (from tb in db.tbNews select tb);
        if (_id != 0)
        {
            name = (from c in db.tbNewsCates where c.newscate_id == _id select c).SingleOrDefault().newscate_title;
            getdata = (from tb in db.tbNews where tb.newscate_id == _id orderby tb.news_createdate descending select tb);
        }
        int item = 5;
        Decimal totalpage = Math.Ceiling(decimal.Divide((Decimal)getdata.Count(), (Decimal)item));
        if (Request.Params["Page"] != null)
        {
            rpnewscate.DataSource = getdata.Skip(item * (Convert.ToInt32(Request.Params["page"]) - 1)).Take(item).ToList();
            linqPaging.CurrentPage = Convert.ToInt32(Request.Params["page"]);
        }
        else
        {
            rpnewscate.DataSource = getdata.Take(item).ToList();
            linqPaging.CurrentPage = 1;
        }
        rpnewscate.DataBind();
        linqPaging.MaxPage = Convert.ToInt32(totalpage);
        if (getdata.Count() > 0)
        {
            linqPaging.pagingUrl = "/tin-tuc/" + cls_ToAscii.ToAscii(name).ToLower() + "-" + _id;
        }

        rptintuclienqua.DataSource = getdata.Skip(2).Take(5);
        rptintuclienqua.DataBind();
        rpmenucate.DataSource = from tb in db.tbNewsCates
                                select new { 
                                 tb.newscate_id,
                                 tb.newscate_title,
                                 SoLuong = (from n in db.tbNews where n.newscate_id == tb.newscate_id select n).Count() 
                                // SoLuong = (from n in db.tbNews where n.newscate_id == tb.newscate_id select n).Count() > 0 ? "0" : (from n in db.tbNews where n.newscate_id == tb.newscate_id select n).Count().ToString()
                                };
        rpmenucate.DataBind();

    }
}