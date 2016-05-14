using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;


namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class Manage_JobStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //LoggedInUserName.Text += Context.User.Identity.Name + "!";

            this.GridView1.DataSourceID = SqlDataSource1.ID;
            this.GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void CategoryChange()
        {

        }

        protected void DropDownStatus_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownSalesMan_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void StatusDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string query = "Select max(OnlineQuoteServiceID)+1 from tblOnlineQuotesServices";
            string connect = SqlDataSource1.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            conn.Open();
            //OnlineQuoteServiceIDLabel.Text = Convert.ToString(cmd.ExecuteScalar());
            conn.Close();
        }
    }
}