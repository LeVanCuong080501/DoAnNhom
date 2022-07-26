using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for cls_News
/// </summary>
public class cls_News
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public cls_News()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    //public bool Linq_Them(string news_title, string news_image, string news_summary, string news_content, string SEO_KEYWORD, string SEO_TITLE, string SEO_LINK, string SEO_DEP, string SEO_IMAGE)
    //{
    //    //var seodata = (from gr in db.tb
    //    //               where gr.newscate_id == newscate_id
    //    //               select gr).Single();

    //    tbNew insert = new tbNew();
    //    insert.news_title = news_title;
    //    if (news_image != "x")
    //        insert.news_image = news_image;
    //    else
    //        insert.news_image = "/web_image/empty.jpg";
    //    insert.news_summary = news_summary;
    //    insert.news_content = news_content;
    //    insert.news_datetime = DateTime.Now.Date;
    //    if (SEO_KEYWORD != "")
    //    {
    //        insert.meta_keywords = SEO_KEYWORD;
    //    }
    //    else
    //    {
    //        insert.meta_keywords = SEO_KEYWORD + ", " + cls_ToAscii.ToAscii(SEO_KEYWORD.ToLower());
    //    }
    //    if (SEO_TITLE != "")
    //    {
    //        insert.meta_tittle = SEO_TITLE;
    //    }
    //    else
    //    {
    //        insert.meta_tittle = SEO_KEYWORD + " | " + cls_ToAscii.ToAscii(SEO_KEYWORD.ToLower());
    //    }

    //    if (SEO_DEP != "")
    //    {
    //        insert.meta_description = SEO_DEP;
    //    }
    //    else
    //    {
    //        insert.meta_description = SEO_KEYWORD + " | " + cls_ToAscii.ToAscii(SEO_KEYWORD.ToLower());
    //    }
    //    insert.meta_image = SEO_IMAGE;
       
    //    db.tbNews.InsertOnSubmit(insert);
    //    if (SEO_LINK != "")
    //    {
    //        insert.link_seo = SEO_LINK;
    //    }
    //    else
    //    {
    //        insert.link_seo = "tin-tuc" + cls_ToAscii.ToAscii(seodata.newscate_title.ToLower()) + "/" + news_title.ToLower() + "-" + insert.news_id;
    //    }
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
    //public bool Linq_Sua(int news_id, string news_title, string news_image, string news_summary, string news_content, int newscate_id, string SEO_KEYWORD, string SEO_TITLE, string SEO_LINK, string SEO_DEP, string SEO_IMAGE)
    //{
    //    var seodata = (from gr in db.tbNewsCates
    //                   where gr.newscate_id == newscate_id
    //                   select gr).Single();
    //    tbNew update = db.tbNews.Where(x => x.news_id == news_id).FirstOrDefault();
    //    update.news_title = news_title;
    //    if (news_image != "x")
    //        update.news_image = news_image;
    //    update.news_summary = news_summary;
    //    update.news_content = news_content;
    //    update.newscate_id = newscate_id;
    //    update.news_createdate = DateTime.Now.Date;
    //    if (SEO_KEYWORD != "")
    //    {
    //        update.meta_keywords = SEO_KEYWORD;
    //    }
    //    else
    //    {
    //        update.meta_keywords = SEO_KEYWORD + ", " + cls_ToAscii.ToAscii(SEO_KEYWORD.ToLower());
    //    }
    //    if (SEO_TITLE != "")
    //    {
    //        update.meta_title = SEO_TITLE;
    //    }
    //    else
    //    {
    //        update.meta_title = SEO_KEYWORD + " | " + cls_ToAscii.ToAscii(SEO_KEYWORD.ToLower());
    //    }

    //    if (SEO_DEP != "")
    //    {
    //        update.meta_description = SEO_DEP;
    //    }
    //    else
    //    {
    //        update.meta_description = SEO_KEYWORD + " | " + cls_ToAscii.ToAscii(SEO_KEYWORD.ToLower());
    //    }
    //    update.meta_image = SEO_IMAGE;
    //    if (SEO_LINK != "")
    //    {
    //        update.link_seo = SEO_LINK;
    //    }
    //    else
    //    {
    //        update.link_seo = "http://lang-da-non-nuoc.net/" + cls_ToAscii.ToAscii(seodata.newscate_title.ToLower()) + "/" + news_title.ToLower() + "-" + update.news_id;
    //    }
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
    //public bool Linq_Xoa( int news_id)
    //{
    //    tbNew delete = db.tbNews.Where(x => x.news_id == news_id).FirstOrDefault();
    //    db.tbNews.DeleteOnSubmit(delete);
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