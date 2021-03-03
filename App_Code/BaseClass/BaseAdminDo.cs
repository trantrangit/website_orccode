using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BaseAdminDo
/// </summary>
public abstract class BaseAdminDo : System.Web.UI.Page
{
    public bool isAdmin = false;

	public BaseAdminDo()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    protected void InitDo()
    {
        try
        {
            CPSession cpSession = (CPSession)Session["cp-session"];
            if (cpSession.sessionType == CPSession.SessionType.admin)
            {
                isAdmin = true;
                ActionAdminDo();
            }
            else if (cpSession.sessionType == CPSession.SessionType.user)
            {
                ActionUserDo();
            }
            else ShowWhenMissingSession();
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    public void ShowWhenMissingSession()
    {
        Response.Write("Missing session, please re-login!");
    }

    // ===========================================================
    // Get Data

    protected CPSession GetSessionInfo()
    {
        return (CPSession)Session["cp-session"];
    }

    // ===========================================================
    // abstract methods

    protected abstract void ActionAdminDo();
    protected abstract void ActionUserDo();
 
}