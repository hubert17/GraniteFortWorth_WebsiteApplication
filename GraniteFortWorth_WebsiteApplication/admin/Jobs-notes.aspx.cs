using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class Jobs_notes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AttachButton_Click(object sender, EventArgs e)
        {
            //Response.Redirect("FileUploader.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"]);
            this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "myUniqueKey",
                    "self.parent.location='FileUploader.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"] + "';", true);
        }
    }
}