using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class Misc_leads : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string query = "Select max(LeadID)+1 from tblLeads";
            string connect = SqlDataSource1.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            conn.Open();
            IDLabel.Text = Convert.ToString(cmd.ExecuteScalar());
            conn.Close();

            Page.MaintainScrollPositionOnPostBack = true;
        }
    }
}