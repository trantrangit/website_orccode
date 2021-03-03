using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BannerManager
/// </summary>
public class BannerManager
{
    DataClassesDataContext db = new DataClassesDataContext();

    public void Save()
    {
        db.SubmitChanges();
    }
    public void Add(BannerTBx banner)
    {
        db.BannerTBxes.InsertOnSubmit(banner);
        Save();
    }
    public BannerTBx GetByID(int ID)
    {
        try
        {
            return db.BannerTBxes.Where(e => e.ID == ID && e.Status != -1).First();
        }
        catch (Exception)
        {
            return new BannerTBx();
        }
    }
    public List<BannerTBx> GetList()
    {
        try
        {
            return db.BannerTBxes.Where(u => u.Status != -1).ToList();
        }
        catch {
            return new List<BannerTBx>();
        }
    }
	public BannerManager()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}