using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ContactManager
/// </summary>
public class ContactManager
{
    DataClassesDataContext db = new DataClassesDataContext();

    public void Save()
    {
        db.SubmitChanges();
    }
    public void Add(ContactTBx contact) { 
        db.ContactTBxes.InsertOnSubmit(contact);
        Save();
    }
    public ContactTBx GetByID(int ID)
    {
        try
        {
            return db.ContactTBxes.Where(e => e.ID == ID && e.Status != -1).First();
        }
        catch (Exception)
        {
            return new ContactTBx();
        }
    }
    public List<ContactTBx> GetList()
    {
        try
        {
            return db.ContactTBxes.Where(u => u.Status != -1).ToList();
        }
        catch
        {
            return new List<ContactTBx>();
        }
    }

	public ContactManager()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}