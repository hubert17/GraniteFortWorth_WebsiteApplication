using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class Jobs_service : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string query = "Select max(OnlineQuoteServiceID)+1 from tblOnlineQuotesServices";
            string connect = SqlDataSource1.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            conn.Open();
            OnlineQuoteServiceIDLabel.Text = Convert.ToString(cmd.ExecuteScalar());
            conn.Close();

            Page.MaintainScrollPositionOnPostBack = true;

            if (IsPostBack)
            {
                string query2;
                if (ListView1.EditIndex > -1)
                    query2 = "Select ServicePrice from tblServices where ServicesID=" + ((DropDownList)ListView1.Items[ListView1.EditIndex].FindControl("DropDownList1")).SelectedValue;
                else
                    query2 = "Select ServicePrice from tblServices where ServicesID=" + ((DropDownList)ListView1.InsertItem.FindControl("DropDownList1")).SelectedValue;
                
                OleDbConnection conn2 = new OleDbConnection(connect);
                OleDbCommand cmd2 = new OleDbCommand(query2, conn2);
                conn2.Open();
                string strPriceEdit = Convert.ToString(cmd2.ExecuteScalar());
                if (ListView1.EditIndex > -1)
                    ((Label)ListView1.Items[ListView1.EditIndex].FindControl("PriceTextBox")).Text = String.Format("{0:0.00}", strPriceEdit);
                else
                {
                    ((Label)ListView1.InsertItem.FindControl("PriceTextBox")).Text = String.Format("{0:0.00}", strPriceEdit);
                    //if (((    (DropDownList)ListView1.InsertItem.FindControl("DropDownList1")).SelectedValue).Equals("10")    )
                    var discountItem = ListBox1.Items.FindByValue(((DropDownList)ListView1.InsertItem.FindControl("DropDownList1")).SelectedValue);
                    if (discountItem != null)
                        ((TextBox)ListView1.InsertItem.FindControl("QuantityTextBox")).Visible = true;
                    else
                        ((TextBox)ListView1.InsertItem.FindControl("QuantityTextBox")).Visible = false;
                }
                conn2.Close();



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
            string query2 = "Select Sum(IIf(IsNull(Quantity),1,Quantity)*IIf(IsNull(Price) Or ServiceType='E',ServicePrice,Price)) from JobServiceQry where OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"];
            string connect2 = SqlDataSource1.ConnectionString;
            OleDbConnection conn2 = new OleDbConnection(connect2);
            OleDbCommand cmd2 = new OleDbCommand(query2, conn2);
            conn2.Open();
            try
            {
                ServiceSubtotal.Text = String.Format("{0:c}", cmd2.ExecuteScalar());
            }
            catch (Exception ex)
            {
                ServiceSubtotal.Text = "0";
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

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "myUniqueKey",
                  "self.parent.location='Manage-services.aspx';", true);
        }


    }
}