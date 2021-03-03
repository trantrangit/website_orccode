using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CPSession
/// </summary>
public class CPSession
{
    public SessionType sessionType;
    public Admin admin;
    public int userID;
	public CPSession()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public enum SessionType
    {
        admin = 0,
        user = 1
    }
}