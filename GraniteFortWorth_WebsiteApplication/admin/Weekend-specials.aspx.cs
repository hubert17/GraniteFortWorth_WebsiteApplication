using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;


namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class Weekend_specials : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoggedInUserName.Text = "Hello, " + Context.User.Identity.Name + "!";

            string query = "Select max(TickerTextID)+1 from tblTickerText";
            string connect = SqlDataSourceTickerText.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            conn.Open();
            try
            {
                TickerTextIDLabel.Text = Convert.ToString(cmd.ExecuteScalar());
            }
            catch (Exception ex)
            {
                TickerTextIDLabel.Text = "1";
            }
            conn.Close();
        }

        protected void ShowWeekendSpecialsCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            FormView1.UpdateItem(false);
        }

        protected string ClientSideEditName(string ServerSideName)
        {
            string ClientSideEditName = String.Empty;
            if (ListView1.EditIndex > -1)
                ClientSideEditName = ListView1.Items[ListView1.EditIndex].FindControl(ServerSideName).ClientID;
            else
                ClientSideEditName = ListView1.InsertItem.FindControl(ServerSideName).ClientID;

            return ClientSideEditName;
        }

        protected void LogoutLinkButton_Click(object sender, EventArgs e)
        {
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("~/admin/Login.aspx");
        }
    }
}