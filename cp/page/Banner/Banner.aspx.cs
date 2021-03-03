using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_Banner_Banner : BaseAdminPage
{
    public List<BannerTBx> listBanber = new List<BannerTBx>();
    protected void Page_Load(object sender, EventArgs e)
    {
        InitPage();
    }
    protected override void ActionAdminPage()
    {
        BannerManager BM = new BannerManager();
        listBanber = BM.GetList();
        listBanber.Reverse();
    }
    protected override void ActionUserPage()
    {

    }
}