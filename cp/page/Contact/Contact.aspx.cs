using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_Contact_Contact : BaseAdminPage
{
    public List<ContactTBx> contact = new List<ContactTBx>();
    protected void Page_Load(object sender, EventArgs e)
    {
        InitPage();
    }
    protected override void ActionAdminPage()
    {
        ContactManager BM = new ContactManager();
        contact = BM.GetList();
        contact.Reverse();
    }
    protected override void ActionUserPage()
    {

    }
}