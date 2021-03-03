using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_Contact_EditContact : BaseAdminPage
{
    public ContactTBx contact = new ContactTBx();
    protected void Page_Load(object sender, EventArgs e)
    {
        InitPage();
    }
    protected override void ActionAdminPage()
    {
        int id = Convert.ToInt32(Page.RouteData.Values["id"]);

        ContactManager CM = new ContactManager();
        contact = CM.GetByID(id);
    }
    protected override void ActionUserPage()
    {

    }
}