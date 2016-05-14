using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GraniteFortWorth_WebsiteApplication
{
    public partial class ContactThanks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Send"] != null)
            {
                if ((Request.QueryString["Send"].ToString()).Equals("Success"))
                {
                    divMessage.Visible = true;
                    string myScript = "\n<script type=\"text/javascript\" language=\"Javascript\" id=\"EventScriptBlock\">\n";
                    myScript += "setTimeout(function(){ document.getElementById('btnHomepage').style.visibility = \"visible\"; setTimeout(function(){ window.location.href = \"Default.aspx\"; },45000); },15000);";
                    myScript += "\n\n </script>";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "myKey", myScript, false);

                }
                else if ((Request.QueryString["Send"].ToString()).Equals("Failed"))
                {
                    string myScript = "\n<script type=\"text/javascript\" language=\"Javascript\" id=\"EventScriptBlock\">\n";
                    myScript += "alert('Oops! We were unable to send your message. You did not enter your name or may have entered an invalid email address.'); ";
                    myScript += "window.location='Contact.aspx'; </script>";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "myKey", myScript, false);
                }
            }

        }
    }
}