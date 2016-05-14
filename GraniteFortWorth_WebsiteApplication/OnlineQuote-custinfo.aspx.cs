using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Configuration;

namespace GraniteFortWorth_WebsiteApplication
{
    public partial class OnlineQuote_custinfo : System.Web.UI.Page
    {
        private string strOnlineQuoteID = String.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            var filePath = Server.MapPath("/") + "Web.config";
            var map = new ExeConfigurationFileMap { ExeConfigFilename = filePath };
            var configFile = ConfigurationManager.OpenMappedExeConfiguration(map, ConfigurationUserLevel.None);
            string MirrorWeb = configFile.AppSettings.Settings["MirrorWeb"].Value;

            if (MirrorWeb == "mirnot")
                Response.Redirect("http://granitesouthlake.com/mobile/OnlineQuote?SlabColorID=" + Request.QueryString["SlabColorID"]);
            else
                Response.Redirect("http://granitesouthlake.com/mirror/OnlineQuote?SlabColorID=" + Request.QueryString["SlabColorID"]);

            if (FormView1.CurrentMode == FormViewMode.Insert)
            {
                ((TextBox)FormView1.FindControl("StateTextBox")).Text = "Tx";
            }

            try
            {
                if (!Request.QueryString["OnlineQuoteID"].Equals(String.Empty))
                {
                    FormView1.ChangeMode(FormViewMode.ReadOnly);
                }
            }
            catch (Exception ex)
            {

            }



        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["SlabColorID"]))
                Response.Redirect("OnlineQuote-granite.aspx?OnlineQuoteID=" + strOnlineQuoteID + "&SlabColorID=" + Request.QueryString["SlabColorID"] + "&img=" + Request.QueryString["img"]);
            else
                Response.Redirect("OnlineQuote-granite.aspx?OnlineQuoteID=" + strOnlineQuoteID);
        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            Response.Redirect("OnlineQuote-granite.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"] + "&SlabColorID=" + Request.QueryString["SlabColorID"]);
        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            string query = "Select max(OnlineQuoteID)+1 from tblOnlineQuotes";
            string connect = SqlDataSource1.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            conn.Open();
            strOnlineQuoteID = Convert.ToString(cmd.ExecuteScalar());
            conn.Close();

            SqlDataSource1.InsertParameters["OnlineQuoteID"].DefaultValue = strOnlineQuoteID;
            SqlDataSource1.InsertParameters["Edge"].DefaultValue = "-1";
            SqlDataSource1.InsertParameters["Backsplash"].DefaultValue = "-1";
        }


    }
}