using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;


namespace GraniteFortWorth_WebsiteApplication
{
    public partial class OnlineQuote_services : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            string connect = SqlDataSource1.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);

            //delete services
            string query = "DELETE FROM tblOnlineQuotesServices WHERE OnlineQuoteID = " + Request.QueryString["OnlineQuoteID"];
            OleDbCommand cmd = new OleDbCommand(query, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            query = "Select max(OnlineQuoteServiceID)+1 from tblOnlineQuotesServices";
            cmd = new OleDbCommand(query, conn);
            conn.Open();
            OnlineQuoteServicesIDLabel.Text = Convert.ToString(cmd.ExecuteScalar());
            conn.Close();

            OnlineQuoteIDLabel.Text = Request.QueryString["OnlineQuoteID"];

            query = "Select sum(Quantity) from SinkLookupQuantityQry WHERE (OnlineQuoteID = " + Request.QueryString["OnlineQuoteID"] + ") AND (Type = 'O')";
            connect = SqlDataSource1.ConnectionString;
            cmd = new OleDbCommand(query, conn);
            conn.Open();
            int OwnerSinkCount;
            try
            {
                OwnerSinkCount = Convert.ToInt32(cmd.ExecuteScalar());
            }
            catch (Exception ex)
            {
                OwnerSinkCount = 0;
            }
            conn.Close();

            query = "Select Edge from tblOnlineQuotes WHERE (OnlineQuoteID = " + Request.QueryString["OnlineQuoteID"] + ") AND ((Edge = 4) OR (Edge = 11))";
            connect = SqlDataSource1.ConnectionString;
            cmd = new OleDbCommand(query, conn);
            conn.Open();
            int PricedEdgeCount;
            try
            {
                PricedEdgeCount = Convert.ToInt32(cmd.ExecuteScalar());
            }
            catch (Exception ex)
            {
                PricedEdgeCount = 0;
            }
            conn.Close();

                foreach (GridViewRow row in GridView1.Rows)
                {
                    CheckBox chk = (CheckBox)row.FindControl("chkSelect");
                    //GridView.DataKeys[RowIndex].Values[KeyIndex]
                    if ((GridView1.DataKeys[row.RowIndex].Values[1]).Equals("O"))
                    {
                        if (OwnerSinkCount > 0)
                        {
                            chk.Checked = true;
                            chk.Enabled = false;
                        }
                        else
                            GridView1.Rows[row.RowIndex].Visible = false;
                    }
                    
                    if ((GridView1.DataKeys[row.RowIndex].Values[1]).Equals("E1"))
                    {
                        if (PricedEdgeCount == 4)
                        {
                            chk.Checked = true;
                            chk.Enabled = false;
                        }
                        else
                            GridView1.Rows[row.RowIndex].Visible = false;
                    }
                    else if ((GridView1.DataKeys[row.RowIndex].Values[1]).Equals("E2"))
                    {
                        if (PricedEdgeCount == 11)
                        {
                            chk.Checked = true;
                            chk.Enabled = false;
                        }
                        else
                            GridView1.Rows[row.RowIndex].Visible = false;
                    }
                }


        }

        
        protected void PaginateTheData(object sender, GridViewPageEventArgs e)
        {            
            GridView1.PageIndex = e.NewPageIndex;           
        }


        
        protected void GetSelectedRecords()
        {
            int OnlineQuoteServicesDataKey = Convert.ToInt32(OnlineQuoteServicesIDLabel.Text);
            string connect = SqlDataSource1.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);
            
            //Response.Write("<h3>Selected records</h3>");
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chk = (CheckBox)row.FindControl("chkSelect");
                if (chk.Checked)
                {
                    //get the selected AutoId and cells text
                    //Response.Write("AutoId: " + GridView1.DataKeys[row.RowIndex].Value + ", First Name: " + row.Cells[2].Text + "<br />");
                    string query = "INSERT INTO tblOnlineQuotesServices(OnlineQuoteServiceID, OnlineQuoteID, ServicesID) VALUES(" + OnlineQuoteServicesDataKey + ", " + OnlineQuoteIDLabel.Text + ", " + GridView1.DataKeys[row.RowIndex].Value + ")";                    
                    OleDbCommand cmd = new OleDbCommand(query, conn);
                    OleDbDataAdapter da = new OleDbDataAdapter(cmd);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    OnlineQuoteServicesDataKey++;
                }
            }
        }

        protected void NextButton_Click(object sender, EventArgs e)
        {
            GetSelectedRecords();

            String strOnlineQuoteID = Request.QueryString["OnlineQuoteID"];
            Response.Redirect("OnlineQuote-summary.aspx?OnlineQuoteID=" + strOnlineQuoteID);
  
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            //String strOnlineQuoteID = Request.QueryString["OnlineQuoteID"];
            //Response.Redirect("OnlineQuote-sinks.aspx?OnlineQuoteID=" + strOnlineQuoteID);            
        }


    }
}