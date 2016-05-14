using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Reflection;

using Google.Apis.Calendar.v3;
using Google.Apis.Calendar.v3.Data;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Auth.OAuth2.Web;
using Google.Apis.Services;
using Google.Apis.Util.Store;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class GoogleCalendarV3 : System.Web.UI.Page
    {
        CalendarService service;
        private const string ClientId = "18000002748.apps.googleusercontent.com";
        private const string ClientSecret = "MMuUh1Z7a9Yf0Kq9gwLdQwB1";
        private const string ApplicationName = "DFW Install Calendar App";

        protected void Page_Load(object sender, EventArgs e)
        {
            var gFolder = System.Web.HttpContext.Current.Server.MapPath("/App_Data/MyGoogleStorage");

      
        }

        protected void AuthButton_Click(object sender, EventArgs e)
        {

        }

    }
}