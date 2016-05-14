<%@ WebHandler Language="C#" Class="contact" %>

using System;
using System.Web;
using System.Net.Mail;

using System.IO;
using System.Xml;
using System.Xml.XPath;

public class contact : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {

        MailMessage message = new MailMessage();
        message.From = new MailAddress("webform@granitesouthlake.com");

        message.IsBodyHtml = true;

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

        string var_name = context.Request.Params["name"];
        string var_street = context.Request.Params["street"];
        string var_city = context.Request.Params["city"];
        string var_phone = context.Request.Params["phone"];
        string var_email = context.Request.Params["email"];
        string var_msg = context.Request.Params["message"];
        string var_agent = context.Request.Params["http_user_agent"];               
        
        //add accounts to notify
        if (!SpamEmailFound(var_email) || !var_name.Equals("Gabstest"))
        {
            message.To.Add(new MailAddress("dhitt0327@gmail.com"));
            message.To.Add(new MailAddress("rlowman64@gmail.com"));
        }
        message.To.Add(new MailAddress("hewbertgabon@gmail.com"));

        if ((var_name.Trim()).Equals(string.Empty) | (var_email.Trim()).Equals(string.Empty))
        {
            context.Response.Redirect("ContactThanks.aspx?Send=Failed");
        }
        else
        {
            //if (System.Text.RegularExpressions.Regex.IsMatch(email, @"\A(?:[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\.)+[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?)\Z") == false)
            //context.Response.Redirect("Default.aspx?Send=Failed");
            //else

            message.Subject = "[New Web Contact]: Message from " + var_name;
            System.Text.StringBuilder builder = new System.Text.StringBuilder();
            builder.AppendLine("<html><body><div style=\"padding:15px;background-color: #F8F8F8; font-family:Verdana, Geneva, Tahoma, sans-serif;font-size:small;\">");
            builder.AppendLine("<div style=\"border:2px solid #a1a1a1;padding:10px 40px; background:#dddddd;border-radius:25px; font-family:Georgia, 'Times New Roman', Times, serif; font-size:xx-large;text-align:center\">");
            builder.AppendLine("<a href=\"http://www.granitesouthlake.com\" style=\"color:black;text-decoration:none;\">DFW WHOLESALE GRANITE</a></div>");
            builder.AppendLine("<p>Hello! Here is a new message sent via the Web Contact Form.</p>");
            builder.AppendLine("<table style=\"width: 90%;border-collapse:collapse;font-family:Verdana, Geneva, Tahoma, sans-serif;font-size:small;\">");
            builder.AppendLine("<tr><td style=\"border: 1px solid black;width: 20%;vertical-align: top;\"><strong>Name:</strong></td>");
            builder.AppendLine("<td style=\"border: 1px solid black; vertical-align: top;\">" + var_name+ "</td></tr>");
            builder.AppendLine("<tr><td style=\"border: 1px solid black;vertical-align: top;\"><strong>Street:</strong></td>");
            builder.AppendLine("<td style=\"border: 1px solid black;vertical-align: top;\">" + var_street + "</td></tr>");
            builder.AppendLine("<tr><td style=\"border: 1px solid black;vertical-align: top;\"><strong>City:</strong></td>");
            builder.AppendLine("<td style=\"border: 1px solid black;vertical-align: top;\">" + var_city + "</td></tr>");            
            builder.AppendLine("<tr><td style=\"border: 1px solid black;vertical-align: top;\"><strong>Phone:</strong></td>");
            builder.AppendLine("<td style=\"border: 1px solid black;vertical-align: top;\">" + var_phone+ "</td></tr>");
            builder.AppendLine("<tr><td style=\"border: 1px solid black;vertical-align: top;\"><strong>E-mail:</strong></td>");
            builder.AppendLine("<td style=\"border: 1px solid black;vertical-align: top;\">" + var_email + " <a href=\"http://www.granitesouthlake.com/BlockEmail.aspx?name=" + var_name + "&email=" + var_email + "\" style=\"-moz-box-shadow:inset 0px 1px 0px 0px #f5978e;-webkit-box-shadow:inset 0px 1px 0px 0px #f5978e;box-shadow:inset 0px 1px 0px 0px #f5978e;background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f24537), color-stop(1, #c62d1f) );background:-moz-linear-gradient( center top, #f24537 5%, #c62d1f 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f24537', endColorstr='#c62d1f');background-color:#f24537;-webkit-border-top-left-radius:20px;-moz-border-radius-topleft:20px;border-top-left-radius:20px;-webkit-border-top-right-radius:20px;-moz-border-radius-topright:20px;border-top-right-radius:20px;-webkit-border-bottom-right-radius:20px;-moz-border-radius-bottomright:20px;border-bottom-right-radius:20px;-webkit-border-bottom-left-radius:20px;-moz-border-radius-bottomleft:20px;border-bottom-left-radius:20px;text-indent:0px;border:1px solid #d02718;display:inline-block;color:#ffffff;font-family:Arial;font-size:10px;font-weight:bold;font-style:normal;height:18px;line-height:16px;width:64px;text-decoration:none;text-align:center;text-shadow:1px 1px 0px #810e05;\">BLOCK</a> ");           
            builder.AppendLine("</td></tr>");
            builder.AppendLine("<tr><td style=\"border: 1px solid black;vertical-align: top;\"><strong>Message:</strong></td>");
            builder.AppendLine("<td style=\"border: 1px solid black;vertical-align: top;\">" + var_msg + "</td></tr></table>");
            builder.AppendLine("<p>HTTP_USER_AGENT: " + var_agent + "</p></div></body></html>");

            message.Body = builder.ToString();
            
            try
            {
                message.ReplyToList.Add(new MailAddress(var_email));
                mailClient.Send(message);
            }
            catch (Exception ex)
            {
                context.Response.Redirect("ContactThanks.aspx?Send=Failed");
            }

        }

        context.Response.Redirect("ContactThanks.aspx?Send=Success");                      
       
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

    public bool SpamEmailFound(string CustEmail)
    {
        bool EmailFound = false;
        string strFilePath = "~/App_Data/SpamEmail.xml";
        strFilePath = HttpContext.Current.Server.MapPath(strFilePath);

        if (File.Exists(strFilePath))
        {
            XPathNavigator nav;
            XPathDocument docNav;
            //XPathNodeIterator NodeIter;
            string strExpression;

            // Open the XML.
            docNav = new XPathDocument(strFilePath);

            // Create a navigator to query with XPath.
            nav = docNav.CreateNavigator();

            // Find the average cost of a book.
            // This expression uses standard XPath syntax.
            strExpression = "count(//SpamEmail[email='" + CustEmail + "'])";

            // Use the Evaluate method to return the evaluated expression.
            if (int.Parse((nav.Evaluate(strExpression)).ToString()) > 0)
                EmailFound = true;
        }
        return EmailFound;
    }


}