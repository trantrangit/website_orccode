using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_Banner_AddBanner :BaseAdminPage
{
    public int bannerID;
    protected void Page_Load(object sender, EventArgs e)
    {
        InitPage();
    }
    protected override void ActionAdminPage()
    {
        bannerID = Convert.ToInt32(Page.RouteData.Values["id"]);
    }
    protected override void ActionUserPage()
    {

    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {


        if (fileUpload.HasFile)
        {
            try
            {
                if (fileUpload.PostedFile.ContentType == "image/jpeg")
                {
                    if (fileUpload.PostedFile.ContentLength < 5424000)
                    {
                        string ext = System.IO.Path.GetExtension(fileUpload.PostedFile.FileName);
                        string filename = "banner_" + bannerID + ext;
                        if (System.IO.File.Exists(filename))
                        {

                            System.IO.File.Delete(filename);
                        }
                        fileUpload.SaveAs(Server.MapPath("~/upload/banner/") + filename);
                        lblStatus.Text = "Upload status: File upload";
                        imgAvatar.Src = "/upload/banner/" + filename;
                        lblStatus.Text = "Upload status: File uploaded!";
                    }
                    else
                        lblStatus.Text = "The file has to be less than 100kb !";
                }
                else
                    lblStatus.Text = "Only JPEG";
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.Message;
            }
        }
        Response.Write(1);
    }
}