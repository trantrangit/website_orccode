using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BaseAdminPage
/// </summary>
public abstract class BaseAdminPage:System.Web.UI.Page
{ 
    public bool isAdmin = false;
	public BaseAdminPage()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    protected void InitPage()
    {
        try
        {
            CPSession cpSession = (CPSession)Session["cp-session"];
            if (cpSession.sessionType == CPSession.SessionType.admin)
            {
                isAdmin = true;
                ActionAdminPage();
            }
            else if (cpSession.sessionType == CPSession.SessionType.user)
            {
                ActionUserPage();
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    // ===========================================================
    // Get Data

    protected CPSession GetSessionInfo()
    {
        return (CPSession)Session["cp-session"];
    }

    // ===========================================================
    // abstract methods

    protected abstract void ActionAdminPage();
    protected abstract void ActionUserPage();
}