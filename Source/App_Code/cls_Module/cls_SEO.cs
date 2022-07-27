using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for cls_SEO
/// </summary>
public class cls_SEO
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    public cls_SEO()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    //public bool Linq_Sua(int news_id, string seokeyword, string seotitle, string seolink, string seodes, string seoimage)
    //{
    //    tbSEO update = db.tbSEOs.Where(x => x.seo_id == news_id).FirstOrDefault();
    //    update.seo_keyworld = seokeyword;
    //    update.seo_title = seotitle;
    //    update.seo_description = seodes;
    //    update.seo_image = seoimage;
    //    update.seo_link = seolink;
    //    try
    //    {
    //        db.SubmitChanges();
    //        return true;
    //    }
    //    catch
    //    {
    //        return false;
    //    }
    //}
}