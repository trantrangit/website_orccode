using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_banner_edit_banner : BaseAdminDo
{
    protected void Page_Load(object sender, EventArgs e)
    {
        InitDo();
    }
    protected override void ActionAdminDo()
    {
        int ID = Convert.ToInt32(Request["id"]);
        string name = Request["name"];
        string title = Request["title"];
       BannerManager BM = new BannerManager();
        BannerTBx banner = BM.GetByID(ID);

        if (banner.ID == 0)
        {
            Response.Write("banner not exist!");
            return;
        }


        banner.Name = name;
        banner.TitleBN = title;

        BM.Save();

        Response.Write(1);
    }
    protected override void ActionUserDo()
    {
        // not permission
    }
}