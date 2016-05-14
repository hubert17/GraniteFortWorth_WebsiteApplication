using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace GraniteFortWorth_WebsiteApplication
{
    public partial class OnlineQuote_measurement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string query = "Select max(OnlineQuoteMeasureID)+1 from tblOnlineQuotesMeasures";
            string connect = SqlDataSource1.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            conn.Open();
            OnlineQuoteMeasureIDLabel.Text = Convert.ToString(cmd.ExecuteScalar());
            conn.Close();

            Page.MaintainScrollPositionOnPostBack = true;

            if (!IsPostBack)
                CalculateTotals();
        }

        protected void NextButton_Click(object sender, EventArgs e)
        {
            string query = "Update tblOnlineQuoteStone Set SquareFeetQty=" + TotalSquareFootTextBox.Text + " WHERE OnlineQuoteStoneID=" + Request.QueryString["OnlineQuoteStoneID"];
            string connect = SqlDataSource1.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("OnlineQuote-granite.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"]);
        }

        protected void CalculateTotals()
        {
            string query2 = "Select sum(Length*Width) from tblOnlineQuotesMeasures where OnlineQuoteStoneID=" + Request.QueryString["OnlineQuoteStoneID"];
            string connect2 = SqlDataSource1.ConnectionString;
            OleDbConnection conn2 = new OleDbConnection(connect2);
            OleDbCommand cmd2 = new OleDbCommand(query2, conn2);
            conn2.Open();
            int intTotalSquareInches;
            try
            {
                intTotalSquareInches = Convert.ToInt32(cmd2.ExecuteScalar());
            }
            catch (Exception ex)
            {
                intTotalSquareInches = 0;
            }
            conn2.Close();

            TotalSquareInchesTextBox.Text = Convert.ToString(intTotalSquareInches);
            double dblTotalSquareFoot = Math.Ceiling((Double)intTotalSquareInches / 144);
            TotalSquareFootTextBox.Text = Convert.ToString(dblTotalSquareFoot);
            TotalSquareFootTextBoxPlus10.Text = Convert.ToString(dblTotalSquareFoot + (dblTotalSquareFoot * 0.1));
        }

        protected void ListView1_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {
            CalculateTotals();
        }

        protected void ListView1_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
        {
            CalculateTotals();
        }

        protected void ListView1_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            CalculateTotals();
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("OnlineQuote-granite.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"]);
        }
    }
}