using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace GraniteFortWorth_NewWebsite.admin
{
    public partial class CreateJob : System.Web.UI.Page
    {
        private string strOnlineQuoteID = String.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            //LoggedInUserName.Text += Context.User.Identity.Name + "!";
        }


        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            Response.Redirect("EditJob.aspx?OnlineQuoteID=" + strOnlineQuoteID);
        }

        protected void FormView1_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName == "Cancel")
                Response.Redirect("Default.aspx");
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
        }
    }
}