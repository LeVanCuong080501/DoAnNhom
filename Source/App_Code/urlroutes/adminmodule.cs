using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for adminmodule
/// </summary>
public class adminmodule
{
	public adminmodule()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public List<string> UrlRoutes()
    {
        List<string> list = new List<string>();
        // Module Account manager
      
        //Module SEO
        list.Add("moduleseo|admin-seo|~/admin_page/module_function/module_SEO.aspx");
        //Module Language
        list.Add("modulelanguage|admin-language|~/admin_page/module_function/module_Language.aspx");
        //Module Home Intro
        list.Add("moduleintro|admin-introduce|~/admin_page/module_function/module_Introduce.aspx");
        //Module Home Contact
        list.Add("modulecontact|admin-lien-he|~/admin_page/module_function/module_Contact.aspx");
        list.Add("modulecontactcustomer|admin-khach-hang|~/admin_page/module_function/module_Customer.aspx");
        //Module Home Slide
        list.Add("moduleslide|admin-slide|~/admin_page/module_function/module_Slide.aspx");
        // THông Báo ĐK liên hệ
        list.Add("modulethongbao|admin-thong-bao|~/admin_page/module_function/module_Customer.aspx");
        //Module News
        list.Add("modulenews|admin-new|~/admin_page/module_function/module_New.aspx");
        //Module Product
        list.Add("modulproductgroup|admin-product-group|~/admin_page/module_function/module_ProductGroup.aspx");
        list.Add("moduleproductcate|admin-product-cate|~/admin_page/module_function/module_ProductCate.aspx");
        list.Add("moduleproduct|admin-product|~/admin_page/module_function/module_Product.aspx");
        list.Add("moduleproductorder|admin-product-order|~/admin_page/module_function/module_Order.aspx");
        return list;
       
    }
}