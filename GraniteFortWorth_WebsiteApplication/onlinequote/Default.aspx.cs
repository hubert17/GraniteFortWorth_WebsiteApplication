using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GraniteFortWorth_WebsiteApplication.onlinequote
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var filePath = Server.MapPath("/") + "Web.config";
            var map = new ExeConfigurationFileMap { ExeConfigFilename = filePath };
            var configFile = ConfigurationManager.OpenMappedExeConfiguration(map, ConfigurationUserLevel.None);
            string SlabPromoOnly = configFile.AppSettings.Settings["SlabPromoOnly"].Value;

            if (SlabPromoOnly == "true")
                Response.Redirect("http://www.granitefortworth.net/OnlineQuote-promo.aspx");
            else
                RedirectToQuote();
        }

        private void RedirectToQuote()
        {
            var filePath = Server.MapPath("/") + "Web.config";
            var map = new ExeConfigurationFileMap { ExeConfigFilename = filePath };
            var configFile = ConfigurationManager.OpenMappedExeConfiguration(map, ConfigurationUserLevel.None);
            string MirrorWeb = configFile.AppSettings.Settings["MirrorWeb"].Value;

            if (MirrorWeb == "mirnot")
                Response.Redirect(URLmirnot.Value);
            else
                Response.Redirect(URLmirsys.Value);

        }

    }
}