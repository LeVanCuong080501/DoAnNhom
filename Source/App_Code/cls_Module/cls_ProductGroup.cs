using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for cls_ProductGroup
/// </summary>
public class cls_ProductGroup
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public cls_ProductGroup()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public bool productgroup_Them(int productgroup_position, string productgroup_title, bool productgroup_show, string content, string SEO_KEYWORD, string SEO_TITLE, string SEO_LINK, string SEO_DEP, string SEO_IMAGE)
    {

        tbProductCate insert = new tbProductCate();
        insert.productcate_position = productgroup_position;
        insert.productcate_title = productgroup_title;
        insert.productcate_show = true;
        insert.productcate_parent = 0;
        insert.productcate_content = content;
        if (SEO_KEYWORD != "")
        {
            insert.meta_keywords = SEO_KEYWORD;
        }
        else
        {
            insert.meta_keywords = productgroup_title + ", " + cls_ToAscii.ToAscii(productgroup_title.ToLower());
        }
        if (SEO_TITLE != "")
        {
            insert.meta_title = SEO_TITLE;
        }
        else
        {
            insert.meta_title = productgroup_title + " | " + cls_ToAscii.ToAscii(productgroup_title.ToLower());
        }

        if (SEO_DEP != "")
        {
            insert.meta_description = SEO_DEP;
        }
        else
        {
            insert.meta_description = productgroup_title + " | " + cls_ToAscii.ToAscii(productgroup_title.ToLower());
        }
        insert.meta_image = SEO_IMAGE;
        db.tbProductCates.InsertOnSubmit(insert);
        db.SubmitChanges();
        if (SEO_LINK != "")
        {
            insert.link_seo = SEO_LINK;
        }
        else
        {
            insert.link_seo = cls_ToAscii.ToAscii(productgroup_title.ToLower()) + "-" + insert.productcate_id;
        }
        try
        {
            db.SubmitChanges();
            return true;
        }
        catch
        {
            return false;
        }
    }
    public bool productgroup_Sua(int productgroup_id, int productgroup_position, string productgroup_title, bool productgroup_show, string content, string SEO_KEYWORD, string SEO_TITLE, string SEO_LINK, string SEO_DEP, string SEO_IMAGE)
    {
        tbProductCate update = db.tbProductCates.Where(x => x.productcate_id == productgroup_id).FirstOrDefault();
        update.productcate_position = productgroup_position;
        update.productcate_title = productgroup_title;
        update.productcate_show = productgroup_show;
        update.productcate_content = content;
        if (SEO_KEYWORD != "")
        {
            update.meta_keywords = SEO_KEYWORD;
        }
        else
        {
            update.meta_keywords = productgroup_title + ", " + cls_ToAscii.ToAscii(productgroup_title.ToLower());
        }
        if (SEO_TITLE != "")
        {
            update.meta_title = SEO_TITLE;
        }
        else
        {
            update.meta_title = productgroup_title + " | " + cls_ToAscii.ToAscii(productgroup_title.ToLower());
        }

        if (SEO_DEP != "")
        {
            update.meta_description = SEO_DEP;
        }
        else
        {
            update.meta_description = productgroup_title + " | " + cls_ToAscii.ToAscii(productgroup_title.ToLower());
        }
        update.meta_image = SEO_IMAGE;
        if (SEO_LINK != "")
        {
            update.link_seo = SEO_LINK;
        }
        else
        {
            update.link_seo = cls_ToAscii.ToAscii(productgroup_title.ToLower()) + "-" + update.productcate_id;
        }
        try
        {
            db.SubmitChanges();
            return true;
        }
        catch
        {
            return false;
        }
    }
    public bool productgroup_Xoa(int productgroup_id)
    {
        tbProductCate delete = db.tbProductCates.Where(x => x.productcate_id == productgroup_id).FirstOrDefault();
        db.tbProductCates.DeleteOnSubmit(delete);
        try
        {
            db.SubmitChanges();
            return true;
        }
        catch
        {
            return false;
        }
    }
}