﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_MasterPage : BaseCPMasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        InitMasterPage();
    }
    protected override void ActionAdminMasterPage()
    {
        // do nothing
    }

    protected override void ActionUserMasterPage()
    {
       
    }
}
