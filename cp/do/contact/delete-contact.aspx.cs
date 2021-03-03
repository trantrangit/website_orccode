using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_contact_delete_contact : BaseAdminDo
{
    protected void Page_Load(object sender, EventArgs e)
    {
        InitDo();
    }
    protected override void ActionAdminDo()
    {
        int ID = Convert.ToInt32(Request["ID"]);

        ContactManager CM = new ContactManager();
        ContactTBx contact = CM.GetByID(ID);

        if (contact.ID == 0)
        {
            Response.Write("contact not exist!");
            return;
        }

        contact.Status = -1;
        CM.Save();

        Response.Write(1);
    }
    protected override void ActionUserDo()
    {
        // not permission
    }
}