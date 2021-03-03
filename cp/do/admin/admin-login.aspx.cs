using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_admin_admin_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string email = Request["user"];
        string password = Request["pwd"];
        
        CPSession cpSession = new CPSession();
        if (email == "AdminFerya" && password == "2468Test@@")
        {
            cpSession.sessionType = CPSession.SessionType.admin;
            cpSession.admin = new Admin(email, password);
            Session["cp-session"] = cpSession;

            Response.Write(1);
        }
      
        else Response.Write("Wrong username or password. Please try again!");
    }
}