using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class Jobs_sink : System.Web.UI.Page
    {
        int NewEditIndex;

        protected void Page_Load(object sender, EventArgs e)
        {
            string query = "Select max(OnlineQuoteSinkID)+1 from tblOnlineQuotesSinks";
            string connect = SqlDataSource1.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            conn.Open();
            OnlineQuoteSinkIDLabel.Text = Convert.ToString(cmd.ExecuteScalar());
            conn.Close();

            Page.MaintainScrollPositionOnPostBack = true;

            if (IsPostBack)
            {
                string query2;
                if (ListView1.EditIndex > -1)   
                    query2 = "Select Price from tblSinks where SinkID=" + ((DropDownList)ListView1.Items[ListView1.EditIndex].FindControl("SlabColorIDDropDownList")).SelectedValue;
                else
                    query2 = "Select Price from tblSinks where SinkID=" + ((DropDownList)ListView1.InsertItem.FindControl("SlabColorIDDropDownList")).SelectedValue;
                
                OleDbConnection conn2 = new OleDbConnection(connect);
                OleDbCommand cmd2 = new OleDbCommand(query2, conn2);
                conn2.Open();
                string strPriceEdit = Convert.ToString(cmd2.ExecuteScalar());
                if (ListView1.EditIndex > -1)
                    ((Label)ListView1.Items[ListView1.EditIndex].FindControl("PurchasePriceTextBox")).Text = String.Format("{0:0.00}", strPriceEdit);
                else
                    ((Label)ListView1.InsertItem.FindControl("PurchasePriceTextBox")).Text = String.Format("{0:0.00}", strPriceEdit);
                conn2.Close();


                    if ((((TextBox)ListView1.InsertItem.FindControl("QuantityTextBox")).Text).Equals(String.Empty) && ListView1.EditIndex < 0)
                    {
                        ((TextBox)ListView1.InsertItem.FindControl("QuantityTextBox")).Text = "1";
                    }

               }

            try
            {
                CalculateTotals();
            }
            catch (Exception ex)
            {
            }
        }

        protected void CalculateTotals()
        {
            string query2 = "Select sum(Quantity*PurchasePrice) from tblOnlineQuotesSinks where OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"];
            string connect2 = SqlDataSource1.ConnectionString;
            OleDbConnection conn2 = new OleDbConnection(connect2);
            OleDbCommand cmd2 = new OleDbCommand(query2, conn2);
            conn2.Open();
            try
            {
                SinkSubtotal.Text = String.Format("{0:c}", cmd2.ExecuteScalar());
            }
            catch (Exception ex)
            {
                SinkSubtotal.Text = "0";
            }
            conn2.Close();
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

        protected void ListView1_ItemDeleted(object sender, ListViewDeletedEventArgs e)
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

        protected void ListView1_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            NewEditIndex = e.NewEditIndex;
        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

        }




    }
}