using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace GraniteFortWorth_WebsiteApplication
{
    public partial class OnlineQuote_sinks1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string query = "Select max(OnlineQuoteSinkID)+1 from tblOnlineQuotesSinks";
            string connect = SqlDataSource1.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            conn.Open();
            OnlineQuoteSinkIDLabel.Text = Convert.ToString(cmd.ExecuteScalar());
            conn.Close();

            OnlineQuoteIDLabel.Text = Request.QueryString["OnlineQuoteID"];

        }

        protected string ShowSinkImage(string Sink, string SinkName)
        {
            //((TextBox)ListView1.InsertItem.FindControl("QuantityTextBox")).Text = "1";

            if (!(Sink.Equals("-1")))
            {
                string query = "Select ImageFilename from tblSinks where SinkID=" + Sink;
                string connect = SqlDataSource1.ConnectionString;
                OleDbConnection conn = new OleDbConnection(connect);
                OleDbCommand cmd = new OleDbCommand(query, conn);
                conn.Open();
                string ImageFilename = Convert.ToString(cmd.ExecuteScalar());
                conn.Close();
               
                if ((((TextBox)ListView1.InsertItem.FindControl("QuantityTextBox")).Text).Equals(String.Empty))
                {
                    ((TextBox)ListView1.InsertItem.FindControl("QuantityTextBox")).Text = "1";
                }
                ((Literal)ListView1.InsertItem.FindControl("SelectStoneRequiredLiteral")).Visible = false;
                
                string SinkImage = "<a class=\"fancybox\" title=\"" + SinkName + "\" href=\"images/Sinks/" + ImageFilename + "\"><img src=\"images/Sinks/thumbs2/" + ImageFilename + "\" Width=\"285px\" ></a>";
                if(String.IsNullOrEmpty(ImageFilename))
                    SinkImage = "<img src=\"images/Sinks/thumbs2/owner_provide.png\" Width=\"285px\" >";

                return SinkImage;
            }
            else
                return String.Empty;
        }

        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            if ((((DropDownList)ListView1.InsertItem.FindControl("SinkIDDropDownList")).SelectedValue).Equals("-1"))
            {
                ((Literal)ListView1.InsertItem.FindControl("SelectStoneRequiredLiteral")).Visible = true;
                e.Cancel = true;
            }
            
        }

        protected void NextButton_Click(object sender, EventArgs e)
        {
            if ((((TextBox)ListView1.InsertItem.FindControl("QuantityTextBox")).Text).Equals(String.Empty))
            {
                ((TextBox)ListView1.InsertItem.FindControl("QuantityTextBox")).Text = "1";
            }
            ListView1.InsertNewItem(true);

                String strOnlineQuoteID = Request.QueryString["OnlineQuoteID"];
                Response.Redirect("OnlineQuote-services.aspx?OnlineQuoteID=" + strOnlineQuoteID);
   
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            //Response.Redirect("OnlineQuote-edge.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"]);

        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if ((((TextBox)ListView1.InsertItem.FindControl("QuantityTextBox")).Text).Equals(String.Empty))
            {
                ((TextBox)ListView1.InsertItem.FindControl("QuantityTextBox")).Text = "1";
            }
        }

    }
}