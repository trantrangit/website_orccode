using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_Banner_EditBanner : BaseAdminPage
{
    public BannerTBx banner = new BannerTBx();
    protected void Page_Load(object sender, EventArgs e)
    {
        InitPage();
    }
    protected override void ActionAdminPage()
    {
        int id = Convert.ToInt32(Page.RouteData.Values["id"]);

        BannerManager BM = new BannerManager();
        banner = BM.GetByID(id);
    }
    protected override void ActionUserPage()
    {

    }
}