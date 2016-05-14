using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class Jobs_measure : System.Web.UI.Page
    {
        string strNewOnlineQuoteMeasureID = String.Empty;
        double SFplus;

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.MaintainScrollPositionOnPostBack = true;
            
            string connect2 = SqlDataSource1.ConnectionString;
            string query3 = "Select SFplus from tblOnlineQuoteStone where OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"];
            OleDbConnection conn4 = new OleDbConnection(connect2);
            OleDbCommand cmd3 = new OleDbCommand(query3, conn4);
            conn4.Open();
            try
            {
                SFplus = Convert.ToDouble(cmd3.ExecuteScalar());
                TotalSFplus.Text = String.Format("Total SF+{0}%: ", Math.Round((SFplus-1)*100));
            }
            catch
            {
                SFplus = 1;
                TotalSFplus.Text = "Total SF+%";
            }
            conn4.Close();
        }

        protected void CalculateTotals()
        {
            string query2 = "Select sum(Length/144*Width/144) from tblOnlineQuotesMeasures where OnlineQuoteStoneID=" + SlabColorIDDropDownList.SelectedValue;
            string connect2 = SqlDataSource1.ConnectionString;
            OleDbConnection conn2 = new OleDbConnection(connect2);
            OleDbCommand cmd2 = new OleDbCommand(query2, conn2);
            conn2.Open();
            double intTotalSquareInches;
            try
            {
                intTotalSquareInches = Convert.ToDouble(cmd2.ExecuteScalar());
            }
            catch (Exception ex)
            {
                intTotalSquareInches = 0;
            }
            conn2.Close();

            double dblTotalSquareFoot = intTotalSquareInches/144.00;
            TotalSquareFootTextBox.Text = String.Format("{0:0.#}", dblTotalSquareFoot);
            TotalSquareFootTextBoxPlus10.Text = String.Format("{0:0.#}", dblTotalSquareFoot*SFplus );

            OleDbConnection conn3 = new OleDbConnection(connect2);
            string query = "UPDATE tblOnlineQuoteStone SET SquareFeetQty = " + TotalSquareFootTextBox.Text + " WHERE OnlineQuoteStoneID = " + SlabColorIDDropDownList.SelectedValue;
            OleDbCommand cmd = new OleDbCommand(query, conn3);
            conn3.Open();
            cmd.ExecuteNonQuery();
            conn3.Close();

            string query3 = "Select sum(Length/144*Width/144) from SFGrandTotalQry where OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"];
            OleDbConnection conn4 = new OleDbConnection(connect2);
            OleDbCommand cmd3 = new OleDbCommand(query3, conn4);
            conn4.Open();
            try
            {
                GrandTotalSquareFootTextBox.Text = String.Format("{0:0.#}", Convert.ToDouble(cmd3.ExecuteScalar()) / 144.00);
            }
            catch (Exception ex)
            {
                GrandTotalSquareFootTextBox.Text = "";
            }
            conn4.Close();

        }

        protected void ListView1_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {
            try
            {
                CalculateTotals();
            }
            catch (Exception ex)
            {
            }
        }

        protected void ListView1_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
        {
            try
            {
                CalculateTotals();
            }
            catch (Exception ex)
            {
            }
        }

        protected void ListView1_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            CalculateTotals();
        }

        protected void SlabColorIDDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*
            if (SlabColorIDDropDownList.SelectedValue == "-1")
                ListView1.Enabled = false;
            else
                ListView1.Enabled = true;
             * */

            try
            {
                CalculateTotals();
            }
            catch (Exception ex)
            {
            }
        }

        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            string query = "Select max(OnlineQuoteMeasureID)+1 from tblOnlineQuotesMeasures";
            string connect = SqlDataSource1.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            conn.Open();
            strNewOnlineQuoteMeasureID = Convert.ToString(cmd.ExecuteScalar());
            conn.Close();

            SqlDataSource1.InsertParameters["OnlineQuoteMeasureID"].DefaultValue = strNewOnlineQuoteMeasureID;
        }
    }
}