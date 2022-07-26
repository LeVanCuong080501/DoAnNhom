using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for webui
/// </summary>
public class webui
{
	public webui()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public List<string> UrlRoutes()
    {
        List<string> list = new List<string>();
        list.Add("webTrangChu|trang-chu|~/Default.aspx");
        //Login-Signup
        list.Add("webdangnhap|dang-nhap|~/web_module/Login_Custormer.aspx");
        //Gio_Hang
          list.Add("webgiohang|gio-hang|~/web_module/web_Gio_Hang.aspx");

        // Introduce
        list.Add("webgioithieu|gioi-thieu|~/web_module/web_About.aspx");
        // Liên hệ
        list.Add("weblienhe|lien-he|~/web_module/web_Contact.aspx");
       
        // tin tức
        list.Add("webtintuc|tin-tuc|~/web_module/web_New.aspx");
        list.Add("webtintucchitiet|tin-tuc/{name}-{id}|~/web_module/web_NewDetails.aspx");

        // Sản Phẩm
        list.Add("websampham|{name}-{id}|~/web_module/web_ProductGroup.aspx");//Trang loại SP
        list.Add("websamphamdetail|san-pham/{name}-{id}|~/web_module/web_ProductDetail.aspx");
        list.Add("websamphamsub|{namegroup}/{name}-{id}|~/web_module/web_Product.aspx");//Trang nhóm SP


        // Search
        list.Add("websearch|search|~/web_module/web_Search.aspx");
        //About
        list.Add("webabout|about|~/web_module/web_About.aspx");
        return list;

    }
}