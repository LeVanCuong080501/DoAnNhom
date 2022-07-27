using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for cls_Customer
/// </summary>
public class cls_Customer
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public cls_Customer()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public bool Linq_Them(string name, string email, string phone, string conten, DateTime date)
    {
        tbCustomer insert = new tbCustomer();
        insert.cus_name = name;
        insert.cus_email = email;
        insert.cus_phone = phone;
        insert.cus_content = conten;
        insert.cus_date = date;
        insert.cus_active = false;
        db.tbCustomers.InsertOnSubmit(insert);
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
    public bool Linq_Sua(int cus_id, string name, string email, string phone, string conten, DateTime date)
    {

        tbCustomer update = db.tbCustomers.Where(x => x.cus_id == cus_id).FirstOrDefault();
        update.cus_name = name;
        update.cus_email = email;
        update.cus_phone = phone;
        update.cus_content = conten;
        update.cus_date = date;
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
    public bool Linq_Xoa(int cus_id)
    {
        tbCustomer delete = db.tbCustomers.Where(x => x.cus_id == cus_id).FirstOrDefault();
        db.tbCustomers.DeleteOnSubmit(delete);
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