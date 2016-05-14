using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class Misc_salesman : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string query = "Select max(SalesManID)+1 from tblSalesMen";
            string connect = SqlDataSource2.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            conn.Open();
            IDLabel.Text = Convert.ToString(cmd.ExecuteScalar());
            conn.Close();

            Page.MaintainScrollPositionOnPostBack = true;
        }
    }
}