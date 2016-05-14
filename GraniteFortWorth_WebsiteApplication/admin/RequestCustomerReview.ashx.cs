using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Data.OleDb;
using System.IO;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    /// <summary>
    /// Summary description for RequestCustomerReview
    /// </summary>
    public class RequestCustomerReview : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            MailMessage message = new MailMessage();
            message.From = new MailAddress("webform@granitesouthlake.com");

            message.IsBodyHtml = true;

            // Proper Authentication Details need to be passed when sending email from gmail
            System.Net.NetworkCredential mailAuthentication = new
                System.Net.NetworkCredential("webform@granitesouthlake.com", "2******e");

            // Smtp Mail server of Gmail is "smpt.gmail.com" and it uses port no. 587
            // For different server like yahoo this details changes and you can
            // Get it from respective server.
            System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient("smtp.granitesouthlake.com", 587);

            // Enable SSL
            //mailClient.EnableSsl = true;
            mailClient.UseDefaultCredentials = false;
            mailClient.Credentials = mailAuthentication;

            string strToName = String.Empty;
            string strToEmail = String.Empty;
            string query2 = "Select CustomerFirstName, Email from tblOnlineQuotes where OnlineQuoteID = " + context.Request.QueryString["OnlineQuoteID"];
            string connect2 = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\\DFWwebsiteDB.accdb;Persist Security Info=True";
            OleDbConnection conn2 = new OleDbConnection(connect2);
            OleDbCommand cmd2 = new OleDbCommand(query2, conn2);
            conn2.Open();
            OleDbDataReader CustomerDataReader = cmd2.ExecuteReader();
            while (CustomerDataReader.Read())
            {
                strToName += CustomerDataReader.GetString(0);
                strToEmail += CustomerDataReader.GetString(1);
            }
            CustomerDataReader.Close();
            conn2.Close();

            //add accounts to notify
            message.To.Add(new MailAddress("info@granitesouthlake.com"));
            message.To.Add(new MailAddress(strToEmail));
            message.ReplyToList.Add(new MailAddress("dhitt0327@yahoo.com"));

            message.Subject = "[DFW Wholesale Granite] - Angie's List Review Request";
            System.Text.StringBuilder builder = new System.Text.StringBuilder();
            builder.AppendLine("<html><body><div style=\"padding:15px;background-color: #F8F8F8; font-family: Georgia, \"Times New Roman\", Times, serif; font-size: large;\">");
            builder.AppendLine("<img src=\"cid:YourPictureId\" /><p>Thank you "+ strToName +" for choosing <strong>");
            builder.AppendLine("<a href=\"http://www.granitesouthlake.com\" target=\"_blank\" style=\"color:black;text-decoration:none;\">");
            builder.AppendLine("DFW Wholesale Granite</a></strong> for your project. We appreciate your business. ");
            builder.AppendLine("Please tell us how we did by clicking the link below to evaluate our performance.</p>	");
            builder.AppendLine("<div style=\"border:2px solid #a1a1a1;padding:10px 40px; background:#dddddd;border-radius:25px;font-size:xx-large\">");
            builder.AppendLine("<a href=\"http://www.angieslist.com/AngiesList/Review/7863610\" target=\"_blank\" style=\"color:black;text-decoration:none;\">");
            builder.AppendLine("AngiesList.com / Review / 7863610</a></div>");
            builder.AppendLine("<p>We use Angie's List to assess whether we're doing a good job keeping valued customers like you, happy. ");
            builder.AppendLine("Again, please visit <a href=\"http://www.angieslist.com/AngiesList/Review/7863610\" target=\"_blank\">AngiesList.com</a> ");
            builder.AppendLine("in order to grade our quality of work and customer service.</p>	");
            builder.AppendLine("<p>-<strong> Dave</strong><br><em>817-231-5153<br>817-300-3298</em><br>");
            builder.AppendLine("<a href=\"mailto:info@granitesouthlake.com\" style=\"color:black;text-decoration:none;\">info@granitesouthlake.com</a></p></div></body></html>");


            //message.Body = builder.ToString();

            AlternateView altView = AlternateView.CreateAlternateViewFromString(builder.ToString(), null, System.Net.Mime.MediaTypeNames.Text.Html);

            LinkedResource yourPictureRes = new LinkedResource(context.Server.MapPath("/images/allogo.gif"), System.Net.Mime.MediaTypeNames.Image.Gif);
            yourPictureRes.ContentId = "YourPictureId";
            altView.LinkedResources.Add(yourPictureRes);

            message.AlternateViews.Add(altView);

            try
            {
                mailClient.Send(message);
                context.Response.Redirect("EditJob.aspx?AngiesListSuccess=true&OnlineQuoteID=" + context.Request.QueryString["OnlineQuoteID"]);
            }
            catch (Exception ex)
            {
                //context.Response.Redirect("EditJob.aspx?AngiesListSuccess=false&OnlineQuoteID=" + context.Request.QueryString["OnlineQuoteID"]);
            }

        }





        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}