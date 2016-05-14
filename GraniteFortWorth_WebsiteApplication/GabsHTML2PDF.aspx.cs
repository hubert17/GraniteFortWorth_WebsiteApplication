using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Net.Mail;
using System.Text;

namespace GraniteFortWorth_WebsiteApplication
{
    public partial class GabsHTML2PDF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string filename = "GabsHTML2pdf" + 290;
            // The address of the web URL which you need to convert into PDF format
            string WebUrl = "http://localhost:26677/OnlineQuote-summaryprint.aspx?OnlineQuoteID=290";
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
            //pdf.HtmlInfo.ImgUrl = "http://en.wikipedia.org/";
            //Save the pdf document
            pdf.Save(Server.MapPath("/html2pdf/" + filename + ".pdf"));

            localWebResponse.Close();
            localResponseStream.Close();

            //SendPDF(filename);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string OnlineQuoteID = "290";
            string target = "OnlineQuote-summaryprint.aspx?OnlineQuoteID=" + OnlineQuoteID;
            string filename = "GabsHTML2pdf" + OnlineQuoteID;
            DateTime expired = DateTime.Now.AddSeconds(-10); // You need to change here bese on your need


            if (Cache["pageContent"] == null || (DateTime)Cache["pageCreateTime"] < expired)
            {
                // Render the page
                System.IO.StringWriter htmlStringWriter = new System.IO.StringWriter();
                Server.Execute(target, htmlStringWriter);


                // Save the page content to the Cache
                Cache["pageContent"] = htmlStringWriter.ToString();
                Cache["pageCreateTime"] = DateTime.Now;
            }


            // Output the cached content
            //Response.Clear();
            //Response.Write((string)Cache["pageContent"]);
            //Response.End();

            StreamWriter cachepage = new StreamWriter(Server.MapPath("/html2pdf/" + filename + ".html"), false, System.Text.Encoding.UTF8);
            cachepage.Write((string)Cache["pageContent"]);
            cachepage.Flush();
            cachepage.Close();

            // Instantiate an object PDF class
            Aspose.Pdf.Generator.Pdf pdf = new Aspose.Pdf.Generator.Pdf();
            // add the section to PDF document sections collection
            Aspose.Pdf.Generator.Section section = pdf.Sections.Add();

            // Read the contents of HTML file into StreamReader object
            StreamReader r = File.OpenText(Server.MapPath("/html2pdf/" + filename + ".html"));

            //Create text paragraphs containing HTML text
            Aspose.Pdf.Generator.Text text2 = new Aspose.Pdf.Generator.Text(section, r.ReadToEnd());
            // enable the property to display HTML contents within their own formatting
            text2.IsHtmlTagSupported = true;
            text2.IsHtml5Supported = true;    
            //Add the text paragraphs containing HTML text to the section
            section.Paragraphs.Add(text2);
            // Specify the URL which serves as images database
            pdf.HtmlInfo.ImgUrl = Server.MapPath("/html2pdf/MemoryStream/");

            //Save the pdf document
            pdf.Save(Server.MapPath("/html2pdf/" + filename + ".pdf"));

            //SendPDF(filename);
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
            //message.To.Add(new MailAddress("dhitt0327@yahoo.com"));
            message.To.Add(new MailAddress("hewbertgabon@gmail.com"));
            message.Attachments.Add(new Attachment(Server.MapPath("/html2pdf/" + filename + ".pdf"))); 

            

            //message.ReplyToList.Add(new MailAddress(email));

            //if ((name.Trim()).Equals(string.Empty) | (email.Trim()).Equals(string.Empty))
                //context.Response.Redirect("Contact.aspx");


            message.Subject = "ONLINE QUOTE";
            System.Text.StringBuilder builder = new System.Text.StringBuilder();
            builder.AppendLine("This is your qoute.");


            message.Body = builder.ToString();

            try
            {
                mailClient.Send(message);
            }
            catch (Exception ex)
            {
                Response.Write("Sending failed.");
            }

            //Response.Redirect("Default.aspx");
            Response.Write("SUCCESSFULLY SENT!");
        }
    }
}