using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;

using System.Configuration;


namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class Settings : System.Web.UI.Page
    {
        //Configuration configuration;
        //CustomErrorsSection section;

        protected void Page_Load(object sender, EventArgs e)
        {
            LoggedInUserName.Text = "Hello, " + Context.User.Identity.Name + "!";

            if (!IsPostBack)
            {
                Configuration config = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
                KeyValueConfigurationElement GoogleInstallCalendarID = config.AppSettings.Settings["GoogleInstallCalendarID"];
                KeyValueConfigurationElement GoogleDhitt0327Password = config.AppSettings.Settings["GoogleDhitt0327Password"];

                if (null != GoogleInstallCalendarID) txtCalendarID.Text = GoogleInstallCalendarID.Value;
                if (null != GoogleDhitt0327Password) txtAcctPwd.Text = "***";
            }

        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            Boolean FileOK = false;
            Boolean FileSaved = false;
            FileUpload FileUploadRef = (FileUpload) FormView1.FindControl("FileUploadReferences");

            if (FileUploadRef.HasFile)
            {
                String FileExtension = Path.GetExtension(FileUploadRef.FileName.ToString()).ToLower();
                String[] allowedExtensions = { ".pdf" };
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (FileExtension == allowedExtensions[i])
                    {
                        FileOK = true;
                    }
                }
            }

            if (FileOK)
            {
                try
                {
                    FileUploadRef.PostedFile.SaveAs(Server.MapPath("/Download/") + "References.pdf");
                    FileSaved = true;
                }
                catch (Exception ex)
                {
                    ((Label) FormView1.FindControl("JobRefLabel")).Text += " File could not be uploaded." + ex.Message.ToString();
                    FileSaved = false;
                }
            }
            else
            {
               ((Label) FormView1.FindControl("JobRefLabel")).Text += " Cannot accept files of this type.";
            }

            if (FileSaved)
            {
                ((Label)FormView1.FindControl("JobRefLabel")).Text += " File has been successfully uploaded.";
            }
        }

        protected void LogoutLinkButton_Click(object sender, EventArgs e)
        {
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("~/admin/Login.aspx");
        }

        protected void btnSaveAppSettings_Click(object sender, EventArgs e)
        {
            try
            {
                Configuration config = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
                KeyValueConfigurationElement GoogleInstallCalendarID = config.AppSettings.Settings["GoogleInstallCalendarID"];
                KeyValueConfigurationElement GoogleDhitt0327Password = config.AppSettings.Settings["GoogleDhitt0327Password"];

                if (!String.IsNullOrEmpty(txtCalendarID.Text)) GoogleInstallCalendarID.Value = txtCalendarID.Text;
                if (txtAcctPwd.Text != "***") GoogleDhitt0327Password.Value = txtAcctPwd.Text;

                config.Save();
                string myScript = "\n<script type=\"text/javascript\" language=\"Javascript\" id=\"EventScriptBlock\">\n";
                myScript += "alert('Google Install Calendar setting successfully updated.'); ";
                myScript += "\n\n </script>";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myKey", myScript, false);
                Response.Redirect("~/admin/Settings.aspx");
            }
            catch (System.Exception exc)
            {
                Response.Write((exc.Message + "<br />" + exc.StackTrace).Replace("\n", "<br />"));
            }
        }
    }
}