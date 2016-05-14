using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class Misc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoggedInUserName.Text = "Hello, " + Context.User.Identity.Name + "!";
        }

        protected void AdminHomeButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void GraniteButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage-granite.aspx");
        }

        protected void ServicesButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage-services.aspx");
        }

        protected void LogoutLinkButton_Click(object sender, EventArgs e)
        {
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("~/admin/Login.aspx"); Response.Redirect("Login.aspx");
        }
    }
}