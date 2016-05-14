using System;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace GraniteFortWorth_WebsiteApplication
{
    public partial class OnlineQuote_summary : System.Web.UI.Page
    {
        string strFabPricePrintOveride;

        protected void Page_Load(object sender, EventArgs e)
        {
            OnlineQuoteIDLabel.Text = Request.QueryString["OnlineQuoteID"];
            
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            //String strOnlineQuoteID = Request.QueryString["OnlineQuoteID"];
            //Response.Redirect("OnlineQuote-info.aspx?OnlineQuoteID=" + strOnlineQuoteID);    
        }

        protected void NextButton_Click(object sender, EventArgs e)
        {
            recaptcha.Validate();
            if (recaptcha.IsValid)
            {
                FormView1.UpdateItem(true);

                String strOnlineQuoteID = Request.QueryString["OnlineQuoteID"];
                string query = "Select FabPricePrintOveride from tblOnlineQuoteStone WHERE OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"];
                string connect = SqlDataSource2.ConnectionString;
                OleDbConnection conn = new OleDbConnection(connect);
                OleDbCommand cmd = new OleDbCommand(query, conn);
                conn.Open();
                strFabPricePrintOveride = cmd.ExecuteScalar().ToString();
                conn.Close();

                SendCustInfo();

                if(String.IsNullOrEmpty(strFabPricePrintOveride))
                    Response.Redirect("QUOTE_DFW-Wholesale-Granite.aspx?OnlineQuoteID=" + strOnlineQuoteID);
                else
                    Response.Redirect("QUOTEWG_DFW-Wholesale-Granite.aspx?OnlineQuoteID=" + strOnlineQuoteID);

                //lblResult.Text = "You Got It!";
                //lblResult.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblResult.Text = "You have entered the wrong character.";
                lblResult.ForeColor = System.Drawing.Color.Red;
            }

        }

        protected void SendCustInfo()
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress("webform@granitesouthlake.com");

            message.IsBodyHtml = true;

            // Proper Authentication Details need to be passed when sending email from gmail
            System.Net.NetworkCredential mailAuthentication = new
                System.Net.NetworkCredential("webform@granitesouthlake.com", "2********e");

            // Smtp Mail server of Gmail is "smpt.gmail.com" and it uses port no. 587
            // For different server like yahoo this details changes and you can
            // Get it from respective server.
            System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient("smtp.granitesouthlake.com", 587);

            // Enable SSL
            //mailClient.EnableSsl = true;
            mailClient.UseDefaultCredentials = false;
            mailClient.Credentials = mailAuthentication;

            //add accounts to notify
            message.To.Add(new MailAddress("webmaster@granitesouthlake.com"));
            string query = "SELECT Email FROM tblEmailNotify WHERE (NotifyCustomerQuote = true)";
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

            message.ReplyToList.Add(new MailAddress(DetailsView1.Rows[5].Cells[1].Text));

            //if ((name.Trim()).Equals(string.Empty) | (email.Trim()).Equals(string.Empty))
            //context.Response.Redirect("Contact.aspx");


            message.Subject = "[New Web Quote]: from " + DetailsView1.Rows[1].Cells[1].Text;
            System.Text.StringBuilder builder = new System.Text.StringBuilder();
            builder.AppendLine("<html><body><div marginwidth=\"0\" marginheight=\"0\" style=\"font:14px/20px 'Helvetica',Arial,sans-serif;margin:0;padding:20px 0 20px 0;text-align:center;background-color:#b84d45\">");
            builder.AppendLine("<center><table border=\"0\" cellpadding=\"20\" cellspacing=\"0\" height=\"100%\" width=\"100%\" style=\"background-color:#b84d45\">");
            builder.AppendLine("<tbody><tr><td align=\"center\" valign=\"top\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-radius:6px;background-color:none\">");
            builder.AppendLine("<tbody><tr><td align=\"center\" valign=\"top\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\">");
            builder.AppendLine("<tbody><tr><td><div style=\"text-align:center\"><img src=\"http://www.granitesouthlake.com/images/logo.png\" alt=\"\" border=\"0\" /></div>");
            builder.AppendLine("</td></tr></tbody></table> </td> </tr>");
            builder.AppendLine("<tr><td align=\"center\" valign=\"top\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-radius:6px;background-color:#ffffff\">");
            builder.AppendLine("<tbody><tr><td align=\"left\" valign=\"top\" style=\"line-height:150%;font-family:Helvetica;font-size:16px;color:#333333;padding:20px\">");
            builder.AppendLine("<div style=\"display:block;text-align:center\"><p style=\"padding:0 0 10px 0\">A new customer has just filled up the ONLINE QUOTE SYSTEM form.</p>");
            if (String.IsNullOrEmpty(strFabPricePrintOveride))
                builder.AppendLine("<a href=\"http://www.granitesouthlake.com/QUOTE_DFW-Wholesale-Granite.aspx?OnlineQuoteID=" + OnlineQuoteIDLabel.Text + "\" style=\"color:#ffffff;display:inline-block;font-family:'Helvetica',Arial,sans-serif;width:auto;white-space:nowrap;min-height:32px;margin:5px 5px 0 0;padding:0 22px;text-decoration:none;text-align:center;font-weight:bold;font-style:normal;font-size:15px;line-height:32px;border:0;border-radius:4px;vertical-align:top;background-color:#b84d45\" target=\"_blank\">");
            else
                builder.AppendLine("<a href=\"http://www.granitesouthlake.com/QUOTEWG_DFW-Wholesale-Granite.aspx?OnlineQuoteID=" + OnlineQuoteIDLabel.Text + "\" style=\"color:#ffffff;display:inline-block;font-family:'Helvetica',Arial,sans-serif;width:auto;white-space:nowrap;min-height:32px;margin:5px 5px 0 0;padding:0 22px;text-decoration:none;text-align:center;font-weight:bold;font-style:normal;font-size:15px;line-height:32px;border:0;border-radius:4px;vertical-align:top;background-color:#b84d45\" target=\"_blank\">");
            builder.AppendLine("<span style=\"display:inline;font-family:'Helvetica',Arial,sans-serif;text-decoration:none;font-weight:bold;font-style:normal;font-size:15px;line-height:32px;border:none;background-color:#b84d45;color:#ffffff\">View the generated Online Quote</span></a>");
            builder.AppendLine("</div><br /></td></tr></tbody></table></td></tr><tr><td align=\"center\" valign=\"top\"></td></tr></tbody></table></td></tr></tbody></table></center></div></body></html>");


            AlternateView altView = AlternateView.CreateAlternateViewFromString(builder.ToString(), null, System.Net.Mime.MediaTypeNames.Text.Html);
            message.AlternateViews.Add(altView);

            try
            {
                mailClient.Send(message);
            }
            catch (Exception ex)
            {
                Response.Write("<h2>Sending failed. Please try again.</h2>");
            }

        }

    }
}