using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_usercontrol_Default_Block_News : System.Web.UI.UserControl
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        rpNews.DataSource = from n in db.tbNews
                            where n.hidden == true
                            orderby n.news_id descending
                            select n;
        rpNews.DataBind();
    }
}