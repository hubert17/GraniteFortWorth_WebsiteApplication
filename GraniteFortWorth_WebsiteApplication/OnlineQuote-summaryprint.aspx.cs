﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GraniteFortWorth_WebsiteApplication
{
    public partial class OnlineQuote_summaryprint : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OnlineQuoteIDLabel.Text = Request.QueryString["OnlineQuoteID"];
        }
    }
}