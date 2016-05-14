using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class Jobs_payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string query = "Select max(PaymentID)+1 from tblPayments";
            string connect = SqlDataSource1.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            conn.Open();
            PaymentIDLabel2.Text = Convert.ToString(cmd.ExecuteScalar());
            conn.Close();

            Page.MaintainScrollPositionOnPostBack = true;

            try
            {
                CalculateServiceTotals();
            }
            catch (Exception ex)
            {
            }
        
        }

        protected void CalculateServiceTotals()
        {
            string query2 = "Select Sum(IIf(IsNull(Quantity),1,Quantity)*IIf(IsNull(Price),ServicePrice,Price)) from JobServiceQry where OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"];
            string connect2 = SqlDataSource1.ConnectionString;
            OleDbConnection conn2 = new OleDbConnection(connect2);
            OleDbCommand cmd2 = new OleDbCommand(query2, conn2);
            conn2.Open();
            double ServiceTotalLabel;
            try
            {
                ServiceTotalLabel = Convert.ToDouble(Convert.ToString(cmd2.ExecuteScalar()));
            }
            catch (Exception ex)
            {
                ServiceTotalLabel = 0;
            }
            conn2.Close();        

            try
            {
                FormView1.DataBind();

                double ServiceTot = Convert.ToDouble(((TextBox)FormView1.FindControl("TotalJobLabel")).Text);
                ((TextBox)FormView1.FindControl("TotalJobLabel")).Text = Convert.ToString(ServiceTot + ServiceTotalLabel);
                double PaymentTot = Convert.ToDouble(((TextBox)FormView1.FindControl("TotalPaymentLabel")).Text);
                ((TextBox)FormView1.FindControl("BalanceDueLabel")).Text = String.Format("{0:0.00}", ServiceTot + ServiceTotalLabel - PaymentTot);

            }
            catch (Exception ex)
            {
            }


        }

        protected void ListView1_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {
            try
            {
                CalculateServiceTotals(); 
            }
            catch (Exception ex)
            {
            }

        }

        protected void ListView1_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            try
            {
                CalculateServiceTotals();
            }
            catch (Exception ex)
            {
            }
        }


    }
}