using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace GraniteFortWorth_WebsiteApplication
{
    /// <summary>
    /// Summary description for RedirectToQuote
    /// </summary>
    public class RedirectToQuote : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            var filePath = context.Server.MapPath("/") + "Web.config";
            var map = new ExeConfigurationFileMap { ExeConfigFilename = filePath };
            var configFile = ConfigurationManager.OpenMappedExeConfiguration(map, ConfigurationUserLevel.None);
            string MirrorWeb = configFile.AppSettings.Settings["MirrorWeb"].Value;

            bool NotAdminView = String.IsNullOrEmpty(context.Request.QueryString["AdminView"]);
            if (MirrorWeb == "mirnot")
            {
                if (NotAdminView)
                    context.Response.Redirect("http://www.granitesouthlake.com/mobile/OnlineQuote/preview/" + context.Request.QueryString["OnlineQuoteID"]);
                else
                    context.Response.Redirect("http://www.granitesouthlake.com/mobile/OnlineQuote/preview/" + context.Request.QueryString["OnlineQuoteID"] + "?AdminView=true&CustView=true");
            }
            else
            {
                if (NotAdminView)
                    context.Response.Redirect("http://www.granitefortworth.net/mirror/OnlineQuote/preview/" + context.Request.QueryString["OnlineQuoteID"]);
                else
                    context.Response.Redirect("http://www.granitefortworth.net/mirror/OnlineQuote/preview/" + context.Request.QueryString["OnlineQuoteID"] + "?AdminView=true&CustView=true");
            }

            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}