using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for cls_HomeContact
/// </summary>
public class cls_HomeContact
{
    dbcsdlDataContext db = new dbcsdlDataContext();
	public cls_HomeContact()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public bool Linq_Them( string contact_address,string contact_email, string contact_link, string contact_hotline, string contact_name)
    {
        tbContact insert = new tbContact();
        insert.contact_address = contact_address;
        insert.contact_link = contact_link;
        insert.contact_hotline = contact_hotline;
        insert.contact_email = contact_email;
        insert.contact_name = contact_name;
        //insert.language_id = language_id;
        db.tbContacts.InsertOnSubmit(insert);
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
    public bool Linq_Sua( int contact_id, string contact_address, string contact_email, string contact_link, string contact_hotline, string contact_name)
    {
        tbContact update = db.tbContacts.Where(x => x.contact_id == contact_id).FirstOrDefault();
        update.contact_address = contact_address;
        update.contact_link = contact_link;
        update.contact_hotline = contact_hotline;
        update.contact_email = contact_email;
        update.contact_name = contact_name;
        //update.language_id = language_id;
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
    public bool Linq_Xoa( int contact_id)
    {
        tbContact delete = db.tbContacts.Where(x => x.contact_id == contact_id).FirstOrDefault();
        db.tbContacts.DeleteOnSubmit(delete);
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