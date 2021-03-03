using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BaseCPMasterPage
/// </summary>
public abstract class BaseCPMasterPage : System.Web.UI.MasterPage
{
    public bool isAdmin = false;
    private CPSession cpSession = new CPSession();
	public BaseCPMasterPage()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    protected void InitMasterPage()
    {
        try
        {
            cpSession = (CPSession)Session["cp-session"];
            if (cpSession == null)
            {
                ShowWhenMissingSession();
            }
            else // got session
            {
                if (cpSession.sessionType == CPSession.SessionType.admin)
                {
                    isAdmin = true;
                    ActionAdminMasterPage();
                }
                else if (cpSession.sessionType == CPSession.SessionType.user)
                {
                    ActionUserMasterPage();
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    public void ShowWhenMissingSession()
    {
        Response.Redirect("/cp-login");
    }
    public CPSession GetCPSession()
    {
        return cpSession;
    }
    protected abstract void ActionAdminMasterPage();
    protected abstract void ActionUserMasterPage();
}