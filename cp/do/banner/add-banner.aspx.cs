using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_banner_add_banner : BaseAdminDo
{
    protected void Page_Load(object sender, EventArgs e)
    {
        InitDo();

    }
    protected override void ActionAdminDo()
    {
        string name = Request["name"];
        string title = Request["title"];
        

        BannerManager BM = new BannerManager();
        BannerTBx banner = new BannerTBx();
        banner.Name = Request["name"];
        banner.TitleBN = Request["title"];

        banner.Status = 1;
        BM.Add(banner);
        Response.Write(1);
    }
    protected override void ActionUserDo()
    {
        // not permission
    }
}