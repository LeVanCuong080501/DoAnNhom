using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_web_NewDetails : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public string titlenew, content,image;
    protected void Page_Load(object sender, EventArgs e)
    {
        var getnews = from n in db.tbNews
                      where n.news_id == Convert.ToInt32(RouteData.Values["id"])
                      select n;
        titlenew = getnews.Single().news_title;
        content = getnews.Single().news_content;
        image = getnews.Single().news_image;

        var newslienquan = (from ns in db.tbNews
                            orderby ns.news_id descending
                            select ns).Take(3);
        rpnews.DataSource = newslienquan;
        rpnews.DataBind();
    }
}