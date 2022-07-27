using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_usercontrol_Default_Block_Slide : System.Web.UI.UserControl
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        rpSlide.DataSource = from sl in db.tbSlides
                             where sl.hidden == true
                             select sl;
        rpSlide.DataBind();
    }
}