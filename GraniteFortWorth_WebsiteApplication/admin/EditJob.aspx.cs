using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Collections;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class EditJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoggedInUserName.Text = "Hello, " + Context.User.Identity.Name + "!";

            Session.Add("OnlineQuoteID", Request.QueryString["OnlineQuoteID"]);

            frameGranite.Attributes.Add("src", "Jobs-granite.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"]); // ((Label)FormView1.FindControl("OnlineQuoteIDLabel")).Text);
            frameMeasure.Attributes.Add("src", "Jobs-measure.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"]); //((Label)FormView1.FindControl("OnlineQuoteIDLabel")).Text);
            frameSink.Attributes.Add("src", "Jobs-sink.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"]); //((Label)FormView1.FindControl("OnlineQuoteIDLabel")).Text);
            frameService.Attributes.Add("src", "Jobs-service.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"]); //((Label)FormView1.FindControl("OnlineQuoteIDLabel")).Text);
            
            //frameJobInfo.Attributes.Add("src", "Jobs-info.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"]); //((Label)FormView1.FindControl("OnlineQuoteIDLabel")).Text);
            frameJobInfo.Attributes.Add("src", "Jobs-info.aspx");
            
            framePayment.Attributes.Add("src", "Jobs-payment.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"]); //((Label)FormView1.FindControl("OnlineQuoteIDLabel")).Text);
            frameNotes.Attributes.Add("src", "Jobs-notes.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"]); //((Label)FormView1.FindControl("OnlineQuoteIDLabel")).Text);

            Page.MaintainScrollPositionOnPostBack = true;

            //***********
            try
            {
                if (FormView1.CurrentMode == FormViewMode.ReadOnly)
                {
                    CustomerLabel.Text = ((Label)FormView1.FindControl("CustomerFirstNameLabel")).Text + " " + ((Label)FormView1.FindControl("CustomerLastNameLabel")).Text;

                    //CHECK INVOICE METHOD
                    //if (((Label)FormView1.FindControl("InvoiceMethodLabel")).Text == "wo")                    
                    //    PrintQuoteWithGraniteButton.OnClientClick = "javascript:return confirm('The recent invoice method is QUOTE ONLY. Proceed to QUOTE WITH GRANITE?')";
                    //else if (((Label)FormView1.FindControl("InvoiceMethodLabel")).Text == "wg")
                    //    PrintQuoteButton.OnClientClick = "javascript:return confirm('The recent invoice method is QUOTE WITH GRANITE. Proceed to QUOTE ONLY?')";
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("EditJob.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"]);
                //Response.Write(ex.Message);
            }
            //***********
            string query = "Select StatusID from tblOnlineQuotes WHERE OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"];
            string connect = SqlDataSource1.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            conn.Open();
            string strStatusID = Convert.ToString(cmd.ExecuteScalar());
            conn.Close();
            if (strStatusID == "8")
                RequestAngiesListReviewButton.Visible = true;

            //************
            if (Request.QueryString["Checked"]!=null)
            {
                if ((Request.QueryString["Checked"].ToString()).Equals("Granite"))
                {
                    Page.ClientScript.RegisterClientScriptBlock(
                      this.GetType(),
                      "onload",
                      "parent.onload = function(){ var allElems = document.getElementsByTagName('input');for (i = 0; i < allElems.length; i++) {    if (allElems[i].type == 'radio' && allElems[i].value == 'granite') { allElems[i].checked = true;    } } }",
                      true
                    );
                }
                else if ((Request.QueryString["Checked"].ToString()).Equals("Measure"))
                {
                    Page.ClientScript.RegisterClientScriptBlock(
                      this.GetType(),
                      "onload",
                      "parent.onload = function(){ var allElems = document.getElementsByTagName('input');for (i = 0; i < allElems.length; i++) {    if (allElems[i].type == 'radio' && allElems[i].value == 'measure') { allElems[i].checked = true;    } } }",
                      true
                    );
                }
                else if ((Request.QueryString["Checked"].ToString()).Equals("Summary"))
                {
                    Page.ClientScript.RegisterClientScriptBlock(
                      this.GetType(),
                      "onload",
                      "parent.onload = function(){ var allElems = document.getElementsByTagName('input');for (i = 0; i < allElems.length; i++) {    if (allElems[i].type == 'radio' && allElems[i].value == 'summary') { allElems[i].checked = true;    } } }",
                      true
                    );
                }
                else if ((Request.QueryString["Checked"].ToString()).Equals("JobInfo"))
                {
                    Page.ClientScript.RegisterClientScriptBlock(
                      this.GetType(),
                      "onload",
                      "parent.onload = function(){ var allElems = document.getElementsByTagName('input');for (i = 0; i < allElems.length; i++) {    if (allElems[i].type == 'radio' && allElems[i].value == 'jobinfo') { allElems[i].checked = true;    } } }",
                      true
                    );
                }                  
            }

            //QUOTE FROM THIS QUOTE
            if (Request.QueryString["iQuoteID"] != null)
            {
                    string myScript = "\n<script type=\"text/javascript\" language=\"Javascript\" id=\"EventScriptBlock\">\n";
                    myScript += "setTimeout(function(){ alert('New quote has been successfully created base on Job Quote #: " + Request.QueryString["iQuoteID"] + ".'); },2000);";
                    myScript += "\n\n </script>";
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "myKey", myScript, false);
            }

            if (Request.QueryString["AngiesListSuccess"] != null)
            {
                if ((Request.QueryString["AngiesListSuccess"].ToString()).Equals("true"))
                {
                    string myScript = "\n<script type=\"text/javascript\" language=\"Javascript\" id=\"EventScriptBlock\">\n";
                    myScript += "alert('Angies List Review Request was successfuly sent.'); ";
                    myScript += "\n\n </script>";
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "myKey", myScript, false);
                }
                else
                {
                    string myScript = "\n<script type=\"text/javascript\" language=\"Javascript\" id=\"EventScriptBlock\">\n";
                    myScript += "alert('An error had occured. Angie's List Review Request Sending failed.'); ";
                    myScript += "\n\n </script>";
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "myKey", myScript, false);
                }
            }

            try
            {
                string query5 = "Select count(*) from tblOnlineQuoteStone WHERE OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"];
                string connect5 = SqlDataSource1.ConnectionString;
                OleDbConnection conn5 = new OleDbConnection(connect5);
                OleDbCommand cmd5 = new OleDbCommand(query5, conn5);
                conn5.Open();
                int StoneColorCount = Convert.ToInt16(cmd5.ExecuteScalar());
                conn5.Close();

                if(StoneColorCount > 1)
                {
                    PrintQuoteWithGraniteButton.Visible = true;
                    PrintQuoteButton.Visible = false;
                }
            }
            catch { throw; }

        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            //Response.Redirect("OnlineQuote-granite.aspx?OnlineQuoteID=" + ((TextBox)FormView1.FindControl("OnlineQuoteIDTextBox")).Text);
        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            //Response.Redirect("OnlineQuote-granite.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"]); ;
        }

        [System.Web.Services.WebMethod]
        public void ReloadFrameGranite()
        {
            //frameGranite.Attributes.Add("src", "Jobs-granite.aspx?OnlineQuoteID=" + ((Label)FormView1.FindControl("OnlineQuoteIDLabel")).Text);
        }

        protected void PrintQuoteButton_Click(object sender, EventArgs e)
        {
            //string query = "UPDATE tblOnlineQuotes SET InvoiceMethod='wo' WHERE OnlineQuoteID = " + Request.QueryString["OnlineQuoteID"];
            //string connect = SqlDataSource1.ConnectionString;
            //OleDbConnection conn = new OleDbConnection(connect);
            //OleDbCommand cmd = new OleDbCommand(query, conn);
            //conn.Open();
            //cmd.ExecuteNonQuery();
            //conn.Close();
            
            //Response.Redirect("PrintQuote.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"] + "&NoRef=true");
            Response.Redirect("http://www.granitefortworth.net/mirror/OnlineQuote/preview/" + Request.QueryString["OnlineQuoteID"] + "?AdminView=true");
        }

        protected void PrintQuoteWithGraniteButton_Click(object sender, EventArgs e)
        {
            string query = "UPDATE tblOnlineQuotes SET InvoiceMethod='wg' WHERE OnlineQuoteID = " + Request.QueryString["OnlineQuoteID"];
            string connect = SqlDataSource1.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("PrintQuoteWithGranite.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"] + "&NoRef=true");
        }

        protected void PrintWorkOrderButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("PrintWorkOrder.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"]);
        }

        protected void OkButton_Click(object sender, EventArgs e)
        {
            string query = "Select max(OnlineQuoteID)+1 from tblOnlineQuotes";
            string connect = SqlDataSource1.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            conn.Open();
            string strNewOnlineQuoteID = Convert.ToString(cmd.ExecuteScalar());
            conn.Close();

            SqlDataSourceCustomerJob.InsertParameters["NewOnlineQuoteID"].DefaultValue = strNewOnlineQuoteID;
            SqlDataSourceCustomerOnly.InsertParameters["NewOnlineQuoteID"].DefaultValue = strNewOnlineQuoteID;
            SqlDataSourceNoCustomer.InsertParameters["NewOnlineQuoteID"].DefaultValue = strNewOnlineQuoteID;
            SqlDataSourceGranite.InsertParameters["NewOnlineQuoteID"].DefaultValue = strNewOnlineQuoteID;
            SqlDataSourceMeasures.InsertParameters["NewOnlineQuoteID"].DefaultValue = strNewOnlineQuoteID;
            SqlDataSourceSinks.InsertParameters["NewOnlineQuoteID"].DefaultValue = strNewOnlineQuoteID;
            SqlDataSourceServices.InsertParameters["NewOnlineQuoteID"].DefaultValue = strNewOnlineQuoteID;

            if (System.Web.HttpContext.Current.Session["sCust"].ToString() == "true" && System.Web.HttpContext.Current.Session["sJobs"].ToString() == "true")
                SqlDataSourceCustomerJob.Insert();
            else if (System.Web.HttpContext.Current.Session["sCust"].ToString() == "true" && System.Web.HttpContext.Current.Session["sJobs"].ToString() == "false")
                SqlDataSourceCustomerOnly.Insert();
            else if (System.Web.HttpContext.Current.Session["sCust"].ToString() == "false" && System.Web.HttpContext.Current.Session["sJobs"].ToString() == "false")
                SqlDataSourceNoCustomer.Insert();

            if (System.Web.HttpContext.Current.Session["sGran"].ToString() == "true")
            {
                string query2 = "Select OnlineQuoteStoneID from tblOnlineQuoteStone where OnlineQuoteID = " + Request.QueryString["OnlineQuoteID"];
                string connect2 = SqlDataSource1.ConnectionString;
                OleDbConnection conn2 = new OleDbConnection(connect2);
                OleDbCommand cmd2 = new OleDbCommand(query2, conn2);
                conn2.Open();
                OleDbDataReader StoneDataReader = cmd2.ExecuteReader();

                while (StoneDataReader.Read())
                {
                    string strFromOnlineQuoteStoneID = Convert.ToString(StoneDataReader.GetInt32(0));
                    SqlDataSourceGranite.InsertParameters["FromOnlineQuoteStoneID"].DefaultValue = strFromOnlineQuoteStoneID;
                    string query3 = "Select max(OnlineQuoteStoneID)+1 from tblOnlineQuoteStone";
                    string connect3 = SqlDataSource1.ConnectionString;
                    OleDbConnection conn3 = new OleDbConnection(connect3);
                    OleDbCommand cmd3 = new OleDbCommand(query3, conn3);
                    conn3.Open();
                    string strNewOnlineQuoteStoneID = Convert.ToString(cmd3.ExecuteScalar());
                    conn3.Close();
                    SqlDataSourceGranite.InsertParameters["NewOnlineQuoteStoneID"].DefaultValue = strNewOnlineQuoteStoneID;
                    SqlDataSourceGranite.Insert();

                    SqlDataSourceMeasures.InsertParameters["NewOnlineQuoteStoneID"].DefaultValue = strNewOnlineQuoteStoneID;
                    SqlDataSourceMeasures.InsertParameters["FromOnlineQuoteStoneID"].DefaultValue = strFromOnlineQuoteStoneID;
                    SqlDataSourceMeasures.Insert();

                }
                StoneDataReader.Close();
                conn2.Close();
            }

            if (System.Web.HttpContext.Current.Session["sSink"].ToString() == "true")
                SqlDataSourceSinks.Insert();

            if (System.Web.HttpContext.Current.Session["sServ"].ToString() == "true")
                SqlDataSourceServices.Insert();

            Response.Redirect("EditJob.aspx?OnlineQuoteID=" + strNewOnlineQuoteID + "&iQuoteID=" + Request.QueryString["OnlineQuoteID"]);

        }

        protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            try
            {
                string delQuery1 = "delete * from tblOnlineQuotesMeasures where OnlineQuoteID = " + Request.QueryString["OnlineQuoteID"];
                string delQuery2 = "delete * from tblOnlineQuoteStone where OnlineQuoteID = " + Request.QueryString["OnlineQuoteID"];
                string delQuery3 = "delete * from tblOnlineQuotesSinks where OnlineQuoteID = " + Request.QueryString["OnlineQuoteID"];
                string delQuery4 = "delete * from tblOnlineQuotesServices where OnlineQuoteID = " + Request.QueryString["OnlineQuoteID"];
                string delQuery5 = "delete * from tblPayments where OnlineQuoteID = " + Request.QueryString["OnlineQuoteID"];
                string delQuery6 = "DELETE FROM SalesTotalJobsTbl WHERE OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"];

                string connect1 = SqlDataSource1.ConnectionString;
                OleDbConnection conn1 = new OleDbConnection(connect1);

                OleDbCommand cmd1 = new OleDbCommand(delQuery1, conn1);
                OleDbCommand cmd2 = new OleDbCommand(delQuery2, conn1);
                OleDbCommand cmd3 = new OleDbCommand(delQuery3, conn1);
                OleDbCommand cmd4 = new OleDbCommand(delQuery4, conn1);
                OleDbCommand cmd5 = new OleDbCommand(delQuery5, conn1);
                OleDbCommand cmd6 = new OleDbCommand(delQuery6, conn1);

                conn1.Open();
                cmd1.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();
                cmd3.ExecuteNonQuery();
                cmd4.ExecuteNonQuery();
                cmd5.ExecuteNonQuery();
                cmd6.ExecuteNonQuery();
                conn1.Close();

                Response.Redirect("Default.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("Error deleting related data. " + ex.Message);
            }

        }

        protected void RequestAngiesListReviewButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("RequestCustomerReview.ashx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"]);
        }

        protected void LogoutLinkButton_Click(object sender, EventArgs e)
        {
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("~/admin/Login.aspx");
        }
 
    }
}