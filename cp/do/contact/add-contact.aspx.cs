using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_contact_add_contact : BaseAdminDo
{
    protected void Page_Load(object sender, EventArgs e)
    {
        InitDo();
    }
    protected override void ActionAdminDo()
    {
        string content = Request.Unvalidated["content"];


        ContactManager CM = new ContactManager();
        ContactTBx contact = new ContactTBx();
        contact.Content = content;
    
        contact.Status = 1;
        CM.Add(contact);
        Response.Write(1);
    }
    protected override void ActionUserDo()
    {
        // not permission
    }
}