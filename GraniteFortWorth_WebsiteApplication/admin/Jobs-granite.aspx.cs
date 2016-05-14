using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class Jobs_granite : System.Web.UI.Page    
    {
        string delOnlineQuoteStoneID = String.Empty;
        string strNewOnlineQuoteStoneID = String.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            OnlineQuoteIDLabel.Text = Request.QueryString["OnlineQuoteID"];

            try
            {
                CalculateTotals();
            }
            catch (Exception ex)
            {
            }
        }

        protected void SlabColorIDDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string connect = SqlDataSource0.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);

            string query = "Select PublishedPrice from SlabColorsQry WHERE SlabColorID = " + ((DropDownList)FormView1.FindControl("SlabColorIDDropDownList")).SelectedValue;
            connect = SqlDataSource0.ConnectionString;
            OleDbCommand cmd = new OleDbCommand(query, conn);
            conn.Open();
            try
            {
                ((TextBox)FormView1.FindControl("PublishedPriceTextBox")).Text = String.Format("{0:#0.00}", cmd.ExecuteScalar());
            }
            catch (Exception ex)
            {
                ((TextBox)FormView1.FindControl("PublishedPriceTextBox")).Text = "Enter PublishedPrice";
            }
            conn.Close();

            OleDbConnection conn4 = new OleDbConnection(connect);
            string query4 = "Select sum(Length/144*Width/144) from tblOnlineQuotesMeasures WHERE OnlineQuoteStoneID = -1 AND OnlineQuoteID = " + OnlineQuoteIDLabel.Text;
            OleDbCommand cmd4 = new OleDbCommand(query4, conn4);
            conn4.Open();
            try
            {
                ((TextBox)FormView1.FindControl("SquareFeetQtyTextBox")).Text = String.Format("{0:#0.00}", Convert.ToDouble(cmd4.ExecuteScalar())/144 );
            }
            catch (Exception ex)
            {
            }
            conn4.Close();

            ((TextBox)FormView1.FindControl("SurchargeTextBox")).Text = DetailsView1.Rows[0].Cells[1].Text;
            ((TextBox)FormView1.FindControl("StateTaxTextBox")).Text = DetailsView1.Rows[1].Cells[1].Text;

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
            string query2;
            if (((CheckBox)FormView2.FindControl("QuoteWithGraniteCheckBox")).Checked)
                query2 = "Select Sum(SubtotFabPrint) from GranitePurchasesQry where OnlineQuoteID=" + OnlineQuoteIDLabel.Text;
            else
                query2 = "Select Sum(SubtotFab) from GranitePurchasesQry where OnlineQuoteID=" + OnlineQuoteIDLabel.Text;

            string connect2 = SqlDataSource0.ConnectionString;
            OleDbConnection conn2 = new OleDbConnection(connect2);
            OleDbCommand cmd2 = new OleDbCommand(query2, conn2);
            conn2.Open();
            double TotalGranFab;
            try
            {
                TotalGranFab = Convert.ToDouble(cmd2.ExecuteScalar());
            }
            catch (Exception ex)
            {
                TotalGranFab = 0;
            }
            conn2.Close();

            string query3 = "Select Sum(Subtot) from GranitePurchasesQry where OnlineQuoteID=" + OnlineQuoteIDLabel.Text;
            OleDbConnection conn3 = new OleDbConnection(connect2);
            OleDbCommand cmd3 = new OleDbCommand(query3, conn3);
            conn3.Open();
            double TotalGran;
            try
            {
                TotalGran = Convert.ToDouble(cmd3.ExecuteScalar());
            }
            catch (Exception ex)
            {
                TotalGran = 0;
            }
            conn3.Close();

            TotalFab.Text = String.Format("{0:c}", TotalGranFab);
            TotalGranite.Text  = String.Format("{0:c}", TotalGran);
        }

        protected void QuoteWithGraniteCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            FormView2.UpdateItem(false);
        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            try
            {
                CalculateTotals();
            }
            catch (Exception ex)
            {
            }

            string query = "UPDATE tblOnlineQuotesMeasures SET OnlineQuoteStoneID = " + strNewOnlineQuoteStoneID + " WHERE OnlineQuoteStoneID = -1 AND OnlineQuoteID = " + OnlineQuoteIDLabel.Text;
            string connect = SqlDataSource0.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            //ClientScript.RegisterClientScriptBlock(this.GetType(), "RedirectScript", "window.parent.location = 'EditJob.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"] + "&Checked=Granite'", true);
            //ClientScript.RegisterClientScriptBlock(this.GetType(), "RedirectScript", "window.parent.", true);
        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            try
            {
                CalculateTotals();
            }
            catch (Exception ex)
            {
            }

            //ClientScript.RegisterClientScriptBlock(this.GetType(), "RedirectScript", "window.parent.location = 'EditJob.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"] + "&Checked=Granite'", true);

        }

        protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            try
            {
                CalculateTotals();
            }
            catch (Exception ex)
            {
            }

            string query = "DELETE FROM tblOnlineQuotesMeasures WHERE OnlineQuoteStoneID = " + delOnlineQuoteStoneID;
            string connect = SqlDataSource0.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            ClientScript.RegisterClientScriptBlock(this.GetType(), "RedirectScript", "window.parent.location = 'EditJob.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"] + "&Checked=Granite'", true);
            //ClientScript.RegisterClientScriptBlock(this.GetType(), "CheckGraniteRadio", "document.getElementById('ac-4').checked = true;", true);

        }

        protected void FormView1_ItemDeleting(object sender, FormViewDeleteEventArgs e)
        {
            delOnlineQuoteStoneID = ((Label)FormView1.FindControl("OnlineQuoteStoneIDLabel")).Text;
        }

        protected void NewButton_Click(object sender, EventArgs e)
        {
            string query = "Select count(*) from tblOnlineQuotesMeasures WHERE OnlineQuoteStoneID = -1 AND OnlineQuoteID = " + OnlineQuoteIDLabel.Text;
            string connect = SqlDataSource0.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            conn.Open();
            int SetMeasureCount = Convert.ToByte(Convert.ToString(cmd.ExecuteScalar()));
            conn.Close();

            if (SetMeasureCount <= 0)
                ClientScript.RegisterClientScriptBlock(this.GetType(), "RedirectScript", "window.parent.location = 'EditJob.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"] + "&Checked=Measure'", true);

        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            string query = "Select max(OnlineQuoteStoneID)+1 from tblOnlineQuoteStone";
            string connect = SqlDataSource0.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            conn.Open();
            strNewOnlineQuoteStoneID = Convert.ToString(cmd.ExecuteScalar());
            conn.Close();

            SqlDataSource0.InsertParameters["OnlineQuoteStoneID"].DefaultValue = strNewOnlineQuoteStoneID;
        }


    }
}