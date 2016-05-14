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
    public partial class ImageUploader : System.Web.UI.Page
    {
        String path = String.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            //LoggedInUserName.Text += Context.User.Identity.Name + "!";

            path = HttpContext.Current.Request.PhysicalApplicationPath + "Images\\Slabs\\";

            try
            {
                string myScript = "\n<script type=\"text/javascript\" language=\"Javascript\" id=\"EventScriptBlock\">\n";
                myScript += "function GetFileName(val) {";
                myScript += "var i = val.split('\\\\').pop().replace(/\\.+$/, '');";
                myScript += "var txtImageFilename = document.getElementById('" + FormView1.FindControl("ImageFilenameTextBox").ClientID + "');";
                myScript += "txtImageFilename.value = '" +  Request.QueryString["SlabColorID"] + "_' + i;";
                myScript += "return true; }";
                myScript += "\n\n </script>";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myKey", myScript, false);
            }
            catch (Exception ex)
            {
                //Response.Redirect("ImageUploader.aspx?SlabColorID=172");
            }

            string strFilename = ((TextBox)FormView1.FindControl("ImageFilenameTextBox")).Text;
            if (!String.IsNullOrEmpty(strFilename))
            {
                pnlCrop.Visible = true;
                imgCrop.ImageUrl = "/Images/Slabs/" + strFilename;
            }

            if(!IsPostBack)
                Session.Add("DeleteFile2", strFilename);

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            Boolean FileOK = false;
            Boolean FileSaved = false;

            if (Upload.HasFile)
            {
                Session["WorkingImage"] = Request.QueryString["SlabColorID"] + "_" + Upload.FileName;
                String FileExtension = Path.GetExtension(Session["WorkingImage"].ToString()).ToLower();
                String[] allowedExtensions = { ".jpeg", ".jpg" };
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
                    Upload.PostedFile.SaveAs(path + Session["WorkingImage"]);
                    FileSaved = true;
                }
                catch (Exception ex)
                {
                    lblError.Text = "File could not be uploaded." + ex.Message.ToString();
                    lblError.Visible = true;
                    Response.Write(path);
                    FileSaved = false;
                }
            }
            else
            {
                lblError.Text = "Cannot accept files of this type.";
                lblError.Visible = true;
            }

            if (FileSaved)
            {
                pnlUpload.Visible = false;
                pnlCrop.Visible = true;
                imgCrop.ImageUrl = "/Images/Slabs/" + Session["WorkingImage"].ToString();

                string fp = Server.MapPath("/Images/Slabs") + "\\" + Session["WorkingImage"].ToString();
                WebClient webClient = new WebClient();
                byte[] imageBytes = webClient.DownloadData(fp);
                MemoryStream mem = new MemoryStream(imageBytes);

                string op = Server.MapPath("/Images/Slabs/thumb") + "\\" + Session["WorkingImage"].ToString();

                ResizeStream(280,  mem , op);         

                FormView1.UpdateItem(true);
                
                string myScript = "\n<script type=\"text/javascript\" language=\"Javascript\" id=\"EventScriptBlock\">\n";
                myScript += "setTimeout(function(){ alert('Image has been successuly uploaded.'); window.location.href = \"Manage-granite.aspx\"; },2000);";
                myScript += "\n\n </script>";
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "myKey", myScript, false);

                //Delete old picture
                try
                {
                    string DeletePath = Server.MapPath("/Images/Slabs/") + Session["DeleteFile2"].ToString();
                    string DeleteThumbPath = Server.MapPath("/Images/Slabs/thumb/") + Session["DeleteFile2"].ToString();

                    if (File.Exists(DeletePath))
                    {
                        File.Delete(DeletePath);
                    }
                    if (File.Exists(DeleteThumbPath))
                    {
                        File.Delete(DeleteThumbPath);
                    }
                }
                catch (Exception ex)
                {
                    lblError.Text = " Unable to delete picture.";
                    lblError.Visible = true;
                }
            }
        }

        public void ResizeStream(int imageSize, Stream filePath, string outputPath)
        {
            var image = System.Drawing.Image.FromStream(filePath);

            int thumbnailSize = imageSize;
            int newWidth, newHeight;

            if (image.Width > image.Height)
            {
                newWidth = thumbnailSize;
                newHeight = image.Height * thumbnailSize / image.Width;
            }
            else
            {
                newWidth = image.Width * thumbnailSize / image.Height;
                newHeight = thumbnailSize;
            }

            var thumbnailBitmap = new Bitmap(newWidth, newHeight);

            var thumbnailGraph = Graphics.FromImage(thumbnailBitmap);
            thumbnailGraph.CompositingQuality = CompositingQuality.HighQuality;
            thumbnailGraph.SmoothingMode = SmoothingMode.HighQuality;
            thumbnailGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;

            var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
            thumbnailGraph.DrawImage(image, imageRectangle);

            thumbnailBitmap.Save(outputPath, image.RawFormat);
            thumbnailGraph.Dispose();
            thumbnailBitmap.Dispose();
            image.Dispose();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage-granite.aspx");
        }

        protected void LogoutLinkButton_Click(object sender, EventArgs e)
        {
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("~/admin/Login.aspx");
        }

    }
}