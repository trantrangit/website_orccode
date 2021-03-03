using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_banner_delete_banner : BaseAdminDo
{
    protected void Page_Load(object sender, EventArgs e)
    {
        InitDo();
    }
    protected override void ActionAdminDo()
    {
        int ID = Convert.ToInt32(Request["ID"]);

        BannerManager BM = new BannerManager();
        BannerTBx banner = BM.GetByID(ID);

        if (banner.ID == 0)
        {
            Response.Write("banner not exist!");
            return;
        }

        banner.Status = -1;
        BM.Save();

        Response.Write(1);
    }
    protected override void ActionUserDo()
    {
        // not permission
    }
}