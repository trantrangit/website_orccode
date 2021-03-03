using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_contact_edit_contact : BaseAdminDo
{
    protected void Page_Load(object sender, EventArgs e)
    {
        InitDo();
    }
    protected override void ActionAdminDo()
    {
        int ID = Convert.ToInt32(Request["id"]);
        string content = Request.Unvalidated["content"];

        ContactManager CM = new ContactManager();
        ContactTBx contact = CM.GetByID(ID);

        if (contact.ID == 0)
        {
            Response.Write("contact not exist!");
            return;
        }
        contact.Content = content;
        CM.Save();

        Response.Write(1);
    }
    protected override void ActionUserDo()
    {
        // not permission
    }
}