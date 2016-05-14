using System;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class PrintQuote : System.Web.UI.Page
    {
        decimal totalSlabs = 0;
        decimal totalStones = 0;
        decimal totalSink = 0;
        decimal totalServices = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            OnlineQuoteIDLabel.Text = Request.QueryString["OnlineQuoteID"];

            if (System.Web.HttpContext.Current.Request.QueryString["NoRef"] != null && Context.User.Identity.IsAuthenticated)
            {
                btnHome.Visible = true;
            }
            else
            {
                    string myScript = "\n<script type=\"text/javascript\" language=\"Javascript\" id=\"EventScriptBlock\">\n";
                    myScript += "setTimeout(function(){ var x; var r=confirm(\"See our recent References...\"); if (r==true) { var myPopup = window.open(\"References.aspx\", \"screenX=100\"); if (!myPopup) alert(\"REFERENCES from our Recent Jobs page which lists the contact information of our happy customers is being block by your browser. We at DFW Wholesale Granite guarantee that the page is trusted and safe. Please allow the pop-up page to appear just for this instance.\"); else { myPopup.onload = function() { setTimeout(function() { if (myPopup.screenX === 0) alert(\"REFERENCES from our Recent Jobs page which lists the contact information of our happy customers is being block by Chrome browser. We at DFW Wholesale Granite guarantee that the page is trusted and safe. Please allow the pop-up page to appear just for this instance.\"); document.getElementById(\"btnRef\").style.display = \"inline\"; }, 0); }; } } else { document.getElementById(\"btnRef\").style.display = \"inline\"; } },5000);";
                    myScript += "\n\n </script>";
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "myKey", myScript, false);
            }

        }

        protected void NextButton_Click(object sender, EventArgs e)
        {

        }

        protected void SendPDF(string filename)
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress("webform@granitesouthlake.com");

            message.IsBodyHtml = false;

            // Proper Authentication Details need to be passed when sending email from gmail
            System.Net.NetworkCredential mailAuthentication = new
                System.Net.NetworkCredential("webform@granitesouthlake.com", "2*****e");

            // Smtp Mail server of Gmail is "smpt.gmail.com" and it uses port no. 587
            // For different server like yahoo this details changes and you can
            // Get it from respective server.
            System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient("smtp.granitesouthlake.com", 587);

            // Enable SSL
            //mailClient.EnableSsl = true;
            mailClient.UseDefaultCredentials = false;
            mailClient.Credentials = mailAuthentication;

            //add accounts to notify
            message.To.Add(new MailAddress(DetailsView1.Rows[5].Cells[1].Text));
            message.To.Add(new MailAddress("webmaster@granitesouthlake.com"));
            string query = "SELECT Email FROM tblEmailNotify WHERE (NotifyAdminQuote = true)";
            string connect2 = SqlDataSource1.ConnectionString;
            OleDbConnection conn2 = new OleDbConnection(connect2);
            OleDbCommand cmd = new OleDbCommand(query, conn2);
            OleDbDataReader dr;
            try
            {
                conn2.Open();
                dr = cmd.ExecuteReader();
                while (dr.Read())
                    message.To.Add(new MailAddress(dr.GetString(dr.GetOrdinal("Email"))));
                dr.Close();
            }
            catch (Exception exp) { }
            finally { conn2.Close(); }

            //message.Attachments.Add(new Attachment(Server.MapPath("/html2pdf/" + filename + ".pdf")));

            message.ReplyToList.Add(new MailAddress("dhitt0327@yahoo.com"));

            //if ((name.Trim()).Equals(string.Empty) | (email.Trim()).Equals(string.Empty))
            //context.Response.Redirect("Contact.aspx");


            message.Subject = "[DFW Wholesale Granite] - Quote for your Granite Countertop";
            System.Text.StringBuilder builder = new System.Text.StringBuilder();
            builder.AppendLine("Attached is your Quote. \n");
            builder.AppendLine("For some reason the attached pdf file doesn't render nicely, ");
            builder.AppendLine("please open the printable html version at this link ");
            builder.AppendLine("http://www.granitesouthlake.com/admin/PrintQuote.aspx?OnlineQuoteID=" + OnlineQuoteIDLabel.Text);

            builder.AppendLine("\n\nClick the link below to view References from our Recent Jobs.");
            builder.AppendLine("http://www.granitesouthlake.com/admin/References.aspx");


            builder.AppendLine("\n\n\nDFW Wholesale Granite \nDavid Hitt \n(817) 300-3298");

            message.Body = builder.ToString();

            try
            {
                mailClient.Send(message);
            }
            catch (Exception ex)
            {
                Response.Write("<h2>Sending failed. Please try again.</h2>");
            }

            Response.Redirect("~/OnlineQuote-success.aspx");
            //Response.Write("SUCCESSFULLY SENT!");

            try
            {
                File.Delete(Server.MapPath("/html2pdf/" + filename + ".pdf"));
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btnEmail_Click(object sender, EventArgs e)
        {
            string filename = "dfwQuote_" + OnlineQuoteIDLabel.Text;
            // The address of the web URL which you need to convert into PDF format
            //string WebUrl = "http://localhost:26677/OnlineQuote-summaryhtmlprint.aspx?OnlineQuoteID=" + OnlineQuoteIDLabel.Text;
            string WebUrl = "http://www.granitesouthlake.com/OnlineQuote-summaryhtmlprint.aspx?OnlineQuoteID=" + OnlineQuoteIDLabel.Text;
            // create a Web Request object to connect to remote URL
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(WebUrl);
            // set the Web Request timeout
            request.Timeout = 10000;     // 10 secs

            // Retrieve request info headers
            HttpWebResponse localWebResponse = (HttpWebResponse)request.GetResponse();
            // Windows default Code Page  (Include System.Text namespace in project)
            Encoding encoding = Encoding.GetEncoding(1252);
            // Read the contents of into StreamReader object
            StreamReader localResponseStream = new StreamReader(localWebResponse.GetResponseStream(), encoding);

            // Instantiate an object PDF class
            Aspose.Pdf.Generator.Pdf pdf = new Aspose.Pdf.Generator.Pdf();

            pdf.PageSetup.Margin.Top = 20;
            pdf.PageSetup.Margin.Left = 60;
            pdf.PageSetup.Margin.Right = 30;
            pdf.PageSetup.Margin.Bottom = 20;

            // add the section to PDF document sections collection
            Aspose.Pdf.Generator.Section section = pdf.Sections.Add();

            //Create text paragraphs containing HTML text
            Aspose.Pdf.Generator.Text text2 = new Aspose.Pdf.Generator.Text(section, localResponseStream.ReadToEnd());

            // enable the property to display HTML contents within their own formatting
            text2.IsHtmlTagSupported = true;

            // Add the text object containing HTML contents to PD Sections
            section.Paragraphs.Add(text2);

            // Specify the URL which serves as images database
            //Save the pdf document
            pdf.Save(Server.MapPath("/html2pdf/" + filename + ".pdf"));

            localWebResponse.Close();
            localResponseStream.Close();

            SendPDF(filename);
        }

        protected void GridView4_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                decimal rowTotal;
                try
                {
                    rowTotal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Total"));
                }
                catch (Exception ex)
                {
                    rowTotal = 0;
                }
                totalSlabs = totalSlabs + rowTotal;
            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[5].Text = String.Format("{0:C}", totalSlabs);
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                decimal rowTotal;
                try
                {
                    rowTotal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Total"));
                }
                catch (Exception ex)
                {
                    rowTotal = 0;
                }
                totalStones = totalStones + rowTotal;
            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[6].Text = String.Format("{0:C}", totalStones);
            }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                decimal rowTotal;
                try
                {
                    rowTotal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Total"));
                }
                catch (Exception ex)
                {
                    rowTotal = 0;
                }
                totalSink = totalSink + rowTotal;
            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[6].Text = String.Format("{0:C}", totalSink);
            }
        }

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //Hardcoded total of services
            string query2 = "Select Sum(IIf(IsNull(Quantity),1,Quantity)*IIf(IsNull(Price) Or ServiceType='E',ServicePrice,Price)) from JobServiceQry where OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"];
            string connect2 = SqlDataSource1.ConnectionString;
            OleDbConnection conn2 = new OleDbConnection(connect2);
            OleDbCommand cmd2 = new OleDbCommand(query2, conn2);
            conn2.Open();
            try
            {
                totalServices = Convert.ToDecimal(cmd2.ExecuteScalar());
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[5].Text = String.Format("{0:C}", totalServices);
                }                
            }
            catch (Exception ex)
            {
            }
            conn2.Close();
        }

        protected void DisplayTotalCost()
        {
            decimal totalPayment = 0;
            decimal totalCost = 0;
            decimal amountDue = 0;
            try
            {
                string query = "Select SUM(Amount) from tblPayments WHERE OnlineQuoteID = " + OnlineQuoteIDLabel.Text;
                string connect = SqlDataSource1.ConnectionString;
                OleDbConnection conn = new OleDbConnection(connect);
                OleDbCommand cmd = new OleDbCommand(query, conn);
                conn.Open();
                totalPayment = Convert.ToDecimal(cmd.ExecuteScalar());
                conn.Close();

                totalCost = totalSlabs + totalStones + totalSink + totalServices;
                amountDue = totalCost - totalPayment;
            }
            catch (Exception ex)
            {
                totalCost = totalSlabs + totalStones + totalSink + totalServices;
                amountDue = totalCost;
                //Response.Write("You have attempted to generate a report without a valid inputs or data.");
            }
            //((Label)FormView1.FindControl("TotalCostLabel")).Text = "TOTAL COST:     " + String.Format("{0:C}", totalCost);
            Response.Write("<table style=\"float: right;\" >");
            Response.Write("<tr><td>TOTAL COST:</td><td style=\"text-align: right;width:105px;\" >" + String.Format("{0:C}", totalCost) + "</td></tr>");
            Response.Write("<tr><td>PMT/DEPOSIT:</td><td style=\"text-align: right;\">" + String.Format("{0:C}", totalPayment) + "</td></tr>");
            Response.Write("<tr><td>AMOUNT DUE:</td><td style=\"text-align: right;\">" + String.Format("{0:C}", amountDue) + "</td></tr>");
            Response.Write("</table>");
        }

        private void InitializeComponent()
        {
            //this.LoadComplete += new System.EventHandler(this.QUOTE_DFW_Wholesale_Granite_LoadComplete);

        }

        private void QUOTE_DFW_Wholesale_Granite_LoadComplete(object sender, EventArgs e)
        {

        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditJob.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"]);
        }        
    }
}