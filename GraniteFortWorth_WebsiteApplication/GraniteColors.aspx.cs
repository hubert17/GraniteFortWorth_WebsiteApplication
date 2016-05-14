using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GraniteFortWorth_WebsiteApplication
{
    public partial class GraniteColors : System.Web.UI.Page
    {

        protected void Page_PreLoad(object sender, EventArgs e)
        {
            var filePath = Server.MapPath("/") + "Web.config";
            var map = new ExeConfigurationFileMap { ExeConfigFilename = filePath };
            var configFile = ConfigurationManager.OpenMappedExeConfiguration(map, ConfigurationUserLevel.None);
            string SlabPromoOnly = configFile.AppSettings.Settings["SlabPromoOnly"].Value;
            string MirrorWeb = configFile.AppSettings.Settings["MirrorWeb"].Value;

            if (SlabPromoOnly == "true")
            {
                if (MirrorWeb == "mirnot")
                    Response.Redirect("/OnlineQuote-promo.aspx");
                else
                    Response.Redirect("http://www.granitefortworth.net/mirror/SlabPromo");
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlPriceRange_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (int.Parse(ddlPriceRange.SelectedValue))
            {
                case 0: Context.Response.Redirect(this.Request.Url.AbsoluteUri);
                    break;
                case 1: ListView1.DataSourceID = SqlDataSource2.ID;
                    break;
                case 2: ListView1.DataSourceID = SqlDataSource3.ID;
                    break;
                case 3: ListView1.DataSourceID = SqlDataSource4.ID;
                    break;
                case 4: ListView1.DataSourceID = SqlDataSource5.ID;
                    break;
            }
        }


    }
}