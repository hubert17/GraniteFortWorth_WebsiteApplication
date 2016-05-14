using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class Jobs_quote : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Add("sCust", "true");
                Session.Add("sJobs", "true");
                Session.Add("sGran", "true");
                Session.Add("sSink", "true");
                Session.Add("sServ", "true");

            }
        }

        protected void chkCust_CheckedChanged(object sender, EventArgs e)
        {
            if (chkCust.Checked)
                Session["sCust"] = "true";
            else
            {
                chkJobs.Checked = false;
                Session["sCust"] = "false";
                Session["sJobs"] = "false";
            }
        }

        protected void chkJobs_CheckedChanged(object sender, EventArgs e)
        {
            if (chkJobs.Checked)
            {
                chkCust.Checked = true;
                Session["sCust"] = "true";
                Session["sJobs"] = "true";
            }
            else
                Session["sJobs"] = "false";
        }

        protected void chkGran_CheckedChanged(object sender, EventArgs e)
        {
            if (chkGran.Checked)
                Session["sGran"] = "true";
            else
            {
                Session["sGran"] = "false";
                Session["sServ"] = "false";
                chkServ.Checked = false;
            }
        }

        protected void chkSink_CheckedChanged(object sender, EventArgs e)
        {
            if (chkSink.Checked)
                Session["sSink"] = "true";
            else
                Session["sSink"] = "false";

        }

        protected void chkServ_CheckedChanged(object sender, EventArgs e)
        {
            if (chkServ.Checked)
            {
                Session["sGran"] = "true";
                Session["sServ"] = "true";
                chkGran.Checked = true;
            }
            else
                Session["sServ"] = "false";
        }


    }
}