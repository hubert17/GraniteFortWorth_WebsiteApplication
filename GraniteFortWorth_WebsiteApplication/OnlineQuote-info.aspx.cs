using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace GraniteFortWorth_WebsiteApplication
{
    public partial class OnlineQuote_info : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (FormView1.CurrentMode == FormViewMode.Insert)
            {
                string query = "Select max(OnlineQuoteID)+1 from tblOnlineQuotes";
                string connect = SqlDataSource1.ConnectionString;
                OleDbConnection conn = new OleDbConnection(connect);
                OleDbCommand cmd = new OleDbCommand(query, conn);
                conn.Open();
                ((TextBox)FormView1.FindControl("OnlineQuoteIDTextBox")).Text = Convert.ToString(cmd.ExecuteScalar());
                conn.Close();
                ((TextBox)FormView1.FindControl("EdgeTextBox")).Text = "-1";
                ((TextBox)FormView1.FindControl("BacksplashTextBox")).Text = "-1";
                ((TextBox)FormView1.FindControl("StateTextBox")).Text = "Tx";
            }

            try
            {
                if (!Request.QueryString["OnlineQuoteID"].Equals(String.Empty))
                {
                    FormView1.ChangeMode(FormViewMode.Edit);
                }
            }
            catch (Exception ex)
            {

            }



        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            Response.Redirect("OnlineQuote-granite.aspx?OnlineQuoteID=" + ((TextBox)FormView1.FindControl("OnlineQuoteIDTextBox")).Text);
        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            Response.Redirect("OnlineQuote-granite.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"]); ;
        }
    }
}