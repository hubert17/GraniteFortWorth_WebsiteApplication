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
    public partial class PrintWorkOrder : System.Web.UI.Page
    {
        decimal totalStones = 0;
        decimal totalServices = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            OnlineQuoteIDLabel.Text = Request.QueryString["OnlineQuoteID"];

            if (Context.User.Identity.IsAuthenticated)
                btnHome.Visible = true;
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
                System.Net.NetworkCredential("webform@granitesouthlake.com", "2*******e");

            // Smtp Mail server of Gmail is "smpt.gmail.com" and it uses port no. 587
            // For different server like yahoo this details changes and you can
            // Get it from respective server.
            System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient("smtp.granitesouthlake.com", 587);

            // Enable SSL
            //mailClient.EnableSsl = true;
            mailClient.UseDefaultCredentials = false;
            mailClient.Credentials = mailAuthentication;

            //add accounts to notify
            //message.To.Add(new MailAddress(DetailsView1.Rows[5].Cells[1].Text));
            message.To.Add(new MailAddress(((Label) FormView3.FindControl("WOEmailLabel")).Text));
            message.Bcc.Add(new MailAddress("webmaster@granitesouthlake.com"));
            string query = "SELECT Email FROM tblEmailNotify WHERE (NotifyWorkOrder = true)";
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

            //message.To.Add(new MailAddress("hewbertgabon@gmail.com"));
            //message.Attachments.Add(new Attachment(Server.MapPath("/html2pdf/" + filename + ".pdf")));

            message.ReplyToList.Add(new MailAddress("dhitt0327@yahoo.com"));

            //if ((name.Trim()).Equals(string.Empty) | (email.Trim()).Equals(string.Empty))
            //context.Response.Redirect("Contact.aspx");


            message.Subject = "[WORK ORDER]: " + DetailsView1.Rows[1].Cells[1].Text;
            System.Text.StringBuilder builder = new System.Text.StringBuilder();
            builder.AppendLine("Attached is your Work Order for " + DetailsView1.Rows[1].Cells[1].Text + ". \n");
            builder.AppendLine("For some reason the attached pdf file doesn't render nicely, ");
            builder.AppendLine("please open the printable html version at this link ");
            builder.AppendLine("http://www.granitesouthlake.com/admin/PrintWorkOrder.aspx?OnlineQuoteID=" + OnlineQuoteIDLabel.Text);

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

            Response.Write("<h2>Work Order has been successfully sent.</h2>");
            //Response.Write("SUCCESSFULLY SENT!");
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

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //Hardcoded total of services
            string query2 = "Select Sum(IIf(IsNull(Quantity),1,Quantity) * WOPrice) from JobServiceQry where OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"];
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
            decimal totalCost = totalStones + totalServices;
            //((Label)FormView1.FindControl("TotalCostLabel")).Text = "TOTAL COST:     " + String.Format("{0:C}", totalCost);
            Response.Write("TOTAL COST:     " + String.Format("{0:C}", totalCost));
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