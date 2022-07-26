using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for cls_HomeSlide
/// </summary>
public class cls_HomeSlide
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public cls_HomeSlide()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public bool Linq_Them(string slide_link, string slide_image)
    {
        tbSlide insert = new tbSlide();
        insert.slide_link = slide_link;
        if (slide_image != "x")
            insert.slide_image = slide_image;
        else
            insert.slide_image = "/web_image/empty.jpg";
        db.tbSlides.InsertOnSubmit(insert);
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
    public bool Linq_Sua(int slide_id, string slide_link, string slide_image)
    {
        tbSlide update = db.tbSlides.Where(x => x.slide_id == slide_id).FirstOrDefault();
        
        if (slide_image != "x")
            update.slide_image = slide_image;
        update.slide_link = slide_link;
       
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
    public bool Linq_Xoa(int slide_id)
    {
        tbSlide delete = db.tbSlides.Where(x => x.slide_id == slide_id).FirstOrDefault();
        db.tbSlides.DeleteOnSubmit(delete);
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