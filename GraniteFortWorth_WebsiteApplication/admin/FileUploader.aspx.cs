using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class FileUploader : System.Web.UI.Page
    {
        String path = String.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            LoggedInUserName.Text = "Hello, " + Context.User.Identity.Name + "!";

            path = HttpContext.Current.Request.PhysicalApplicationPath + "admin\\Attachment\\";

            try
            {
                string myScript = "\n<script type=\"text/javascript\" language=\"Javascript\" id=\"EventScriptBlock\">\n";
                myScript += "function GetFileNameBefore(val) {";
                myScript += "var i = val.split('\\\\').pop().replace(/\\.+$/, '');";
                myScript += "var txtFilename = document.getElementById('" + FormView1.FindControl("BeforePicFilePathTextBox").ClientID + "');";
                myScript += "txtFilename.value = '" + Request.QueryString["OnlineQuoteID"] + "_before_' + i;";
                myScript += "return true; }";
                myScript += "function GetFileNameMeasure(val) {";
                myScript += "var i = val.split('\\\\').pop().replace(/\\.+$/, '');";
                myScript += "var txtFilename = document.getElementById('" + FormView1.FindControl("MeasurementPicFilePathTextBox").ClientID + "');";
                myScript += "txtFilename.value = '" + Request.QueryString["OnlineQuoteID"] + "_measure_' + i;";
                myScript += "return true; }";
                myScript += "function GetFileNameAfter(val) {";
                myScript += "var i = val.split('\\\\').pop().replace(/\\.+$/, '');";
                myScript += "var txtFilename = document.getElementById('" + FormView1.FindControl("AfterPicFilePathTextBox").ClientID + "');";
                myScript += "txtFilename.value = '" + Request.QueryString["OnlineQuoteID"] + "_after_' + i;";
                myScript += "return true; }";
                myScript += "\n\n </script>";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myKey", myScript, false);
            }
            catch (Exception ex)
            {
                //Response.Redirect("ImageUploader.aspx?SlabColorID=172");
            }

            string strFilenameBefore = ((TextBox)FormView1.FindControl("BeforePicFilePathTextBox")).Text;
            if (!String.IsNullOrEmpty(strFilenameBefore))
            {
                pnlCropBefore.Visible = true;
                linkCropBefore.Text = strFilenameBefore;
                linkCropBefore.NavigateUrl = "/admin/Attachment/" + strFilenameBefore;
            }

            string strFilenameMeasure = ((TextBox)FormView1.FindControl("MeasurementPicFilePathTextBox")).Text;
            if (!String.IsNullOrEmpty(strFilenameMeasure))
            {
                pnlCropMeasure.Visible = true;
                linkCropMeasure.Text = strFilenameMeasure;
                linkCropMeasure.NavigateUrl = "/admin/Attachment/" + strFilenameMeasure;
            }

            string strFilenameAfter = ((TextBox)FormView1.FindControl("AfterPicFilePathTextBox")).Text;
            if (!String.IsNullOrEmpty(strFilenameAfter))
            {
                pnlCropAfter.Visible = true;
                linkCropAfter.Text = strFilenameAfter;
                linkCropAfter.NavigateUrl = "/admin/Attachment/" + strFilenameAfter;
            }

            if (!IsPostBack)
            {
                Session.Add("DeleteFile2Before", strFilenameBefore);
                Session.Add("DeleteFile2Measure", strFilenameMeasure);
                Session.Add("DeleteFile2After", strFilenameAfter);
            }

        }

        protected void btnUploadBefore_Click(object sender, EventArgs e)
        {
            Boolean FileOK = false;
            Boolean FileSaved = false;

            if (UploadBefore.HasFile)
            {
                Session["WorkingImageBefore"] = Request.QueryString["OnlineQuoteID"] + "_before_" + UploadBefore.FileName;
                String FileExtension = Path.GetExtension(Session["WorkingImageBefore"].ToString()).ToLower();
                String[] allowedExtensions = { ".jpeg", ".jpg", ".pdf", ".doc", ".docx", ".xls", ".xlsx" };
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
                    UploadBefore.PostedFile.SaveAs(path + Session["WorkingImageBefore"]);
                    FileSaved = true;
                }
                catch (Exception ex)
                {
                    lblErrorBefore.Text = "File could not be uploaded." + ex.Message.ToString();
                    lblErrorBefore.Visible = true;
                    Response.Write(path);
                    FileSaved = false;
                }
            }
            else
            {
                lblErrorBefore.Text = "Cannot accept files of this type.";
                lblErrorBefore.Visible = true;
            }

            if (FileSaved)
            {
                pnlUploadBefore.Visible = false;
                pnlCropBefore.Visible = true;
                linkCropBefore.Text = Session["WorkingImageBefore"].ToString();
                linkCropBefore.NavigateUrl = "/admin/Attachment/" + Session["WorkingImageBefore"].ToString();

                FormView1.UpdateItem(true);

                string myScript = "\n<script type=\"text/javascript\" language=\"Javascript\" id=\"EventScriptBlock\">\n";
                myScript += "setTimeout(function(){ alert('File has been successuly uploaded.'); window.location.href = \"EditJob.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"] + "&Checked=Summary\"; },2000);";
                myScript += "\n\n </script>";
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "myKey", myScript, false);

                //Delete old picture
                try
                {
                    string DeletePath = Server.MapPath("/admin/Attachment/") + Session["DeleteFile2Before"].ToString();

                    if (File.Exists(DeletePath))
                    {
                        File.Delete(DeletePath);
                    }
                }
                catch (Exception ex)
                {
                    lblErrorBefore.Text = " Unable to delete picture.";
                    lblErrorBefore.Visible = true;
                }
            }
        }

        protected void LinkButton1Before_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditJob.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"] + "&Checked=Summary");
        }

        protected void btnUploadMeasure_Click(object sender, EventArgs e)
        {
            Boolean FileOK = false;
            Boolean FileSaved = false;

            if (UploadMeasure.HasFile)
            {
                Session["WorkingImageMeasure"] = Request.QueryString["OnlineQuoteID"] + "_measure_" + UploadMeasure.FileName;
                String FileExtension = Path.GetExtension(Session["WorkingImageMeasure"].ToString()).ToLower();
                String[] allowedExtensions = { ".jpeg", ".jpg", ".pdf", ".doc", ".docx", ".xls", ".xlsx" };
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
                    UploadMeasure.PostedFile.SaveAs(path + Session["WorkingImageMeasure"]);
                    FileSaved = true;
                }
                catch (Exception ex)
                {
                    lblErrorMeasure.Text = "File could not be uploaded." + ex.Message.ToString();
                    lblErrorMeasure.Visible = true;
                    Response.Write(path);
                    FileSaved = false;
                }
            }
            else
            {
                lblErrorMeasure.Text = "Cannot accept files of this type.";
                lblErrorMeasure.Visible = true;
            }

            if (FileSaved)
            {
                pnlUploadMeasure.Visible = false;
                pnlCropMeasure.Visible = true;
                linkCropMeasure.Text = Session["WorkingImageMeasure"].ToString();
                linkCropMeasure.NavigateUrl = "/admin/Attachment/" + Session["WorkingImageMeasure"].ToString();

                FormView1.UpdateItem(true);

                string myScript = "\n<script type=\"text/javascript\" language=\"Javascript\" id=\"EventScriptBlock\">\n";
                myScript += "setTimeout(function(){ alert('File has been successuly uploaded.'); window.location.href = \"EditJob.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"] + "&Checked=Summary\"; },2000);";
                myScript += "\n\n </script>";
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "myKey", myScript, false);

                //Delete old picture
                try
                {
                    string DeletePath = Server.MapPath("/admin/Attachment/") + Session["DeleteFile2Measure"].ToString();

                    if (File.Exists(DeletePath))
                    {
                        File.Delete(DeletePath);
                    }
                }
                catch (Exception ex)
                {
                    lblErrorMeasure.Text = " Unable to delete picture.";
                    lblErrorMeasure.Visible = true;
                }
            }
        }

        protected void LinkButton1Measure_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditJob.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"] + "&Checked=Summary");
        }

        protected void btnUploadAfter_Click(object sender, EventArgs e)
        {
            Boolean FileOK = false;
            Boolean FileSaved = false;

            if (UploadAfter.HasFile)
            {
                Session["WorkingImageAfter"] = Request.QueryString["OnlineQuoteID"] + "_after_" + UploadAfter.FileName;
                String FileExtension = Path.GetExtension(Session["WorkingImageAfter"].ToString()).ToLower();
                String[] allowedExtensions = { ".jpeg", ".jpg", ".pdf", ".doc", ".docx", ".xls", ".xlsx" };
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
                    UploadAfter.PostedFile.SaveAs(path + Session["WorkingImageAfter"]);
                    FileSaved = true;
                }
                catch (Exception ex)
                {
                    lblErrorAfter.Text = "File could not be uploaded." + ex.Message.ToString();
                    lblErrorAfter.Visible = true;
                    Response.Write(path);
                    FileSaved = false;
                }
            }
            else
            {
                lblErrorAfter.Text = "Cannot accept files of this type.";
                lblErrorAfter.Visible = true;
            }

            if (FileSaved)
            {
                pnlUploadAfter.Visible = false;
                pnlCropAfter.Visible = true;
                linkCropAfter.Text = Session["WorkingImageAfter"].ToString();
                linkCropAfter.NavigateUrl = "/admin/Attachment/" + Session["WorkingImageAfter"].ToString();

                FormView1.UpdateItem(true);

                string myScript = "\n<script type=\"text/javascript\" language=\"Javascript\" id=\"EventScriptBlock\">\n";
                myScript += "setTimeout(function(){ alert('File has been successuly uploaded.'); window.location.href = \"EditJob.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"] + "&Checked=Summary\"; },2000);";
                myScript += "\n\n </script>";
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "myKey", myScript, false);

                //Delete old picture
                try
                {
                    string DeletePath = Server.MapPath("/admin/Attachment/") + Session["DeleteFile2After"].ToString();

                    if (File.Exists(DeletePath))
                    {
                        File.Delete(DeletePath);
                    }
                }
                catch (Exception ex)
                {
                    lblErrorAfter.Text = " Unable to delete picture.";
                    lblErrorAfter.Visible = true;
                }
            }
        }

        protected void LinkButton1After_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditJob.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"] + "&Checked=Summary");
        }

        protected void LogoutLinkButton_Click(object sender, EventArgs e)
        {
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("~/admin/Login.aspx");
        }


    }
}