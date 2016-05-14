using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Net;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class Manage_sink : System.Web.UI.Page
    {
        String path = String.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            LoggedInUserName.Text = "Hello, " + Context.User.Identity.Name + "!";

            string query = "Select max(SinkID)+1 from tblSinks";
            //string query = "SELECT @@IDENTITY";
            string connect = SqlDataSource1.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            conn.Open();
            IDPrimaryKeyLabel.Text = Convert.ToString(cmd.ExecuteScalar());
            conn.Close();


        }

        protected void DetailsView1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {

        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            RecordStatusLabel.Text = "";
            //RefreshButton.Visible = false;

        }

        protected void AddNewButton_Click(object sender, EventArgs e)
        {
            RecordStatusLabel.Text = "";
            //RefreshButton.Visible = false;
            FormView1.ChangeMode(FormViewMode.Insert);

        }

        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            FormView1.ChangeMode(FormViewMode.Edit);
        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            //divStatus.Attributes["Display"] = "Block";
            RecordStatusLabel.Text = "Entry successfully added.";
            //RefreshButton.OnClientClick = "window.location = 'Manage-granite.aspx'; return false;";
            //RefreshButton.Visible = true;
            ListBox1.DataBind();


        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            RecordStatusLabel.Text = "Record successfully updated.";
            RefreshButton.Visible = true;
        }

        protected void RefreshButton_Click(object sender, EventArgs e)
        {
            ListBox1.DataBind();
            RefreshButton.Visible = false;
            RecordStatusLabel.Text = String.Empty;
        }

        protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            RecordStatusLabel.Text = "Item permanently deleted.";
            //RefreshButton.OnClientClick = "window.location = 'Manage-granite.aspx'; return false;";
            //RefreshButton.Visible = true;

            //Delete picture
            try
            {
                string DeletePath = Server.MapPath("/Images/Slabs/") + Session["DeleteFile"].ToString();
                string DeleteThumbPath = Server.MapPath("/Images/Slabs/thumb/") + Session["DeleteFile"].ToString();

                if (File.Exists(DeletePath))
                {
                    //File.Delete(DeletePath);
                }
                if (File.Exists(DeleteThumbPath))
                {
                    //File.Delete(DeleteThumbPath);
                }

            }
            catch (Exception ex)
            { RecordStatusLabel.Text += " Unable to delete picture."; }

            ListBox1.DataBind();
        }

        protected void EditJobButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage-granite.aspx");
        }

        protected void ServicesButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage-services.aspx");
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {

        }

        protected void LogoutLinkButton_Click(object sender, EventArgs e)
        {
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("~/admin/Login.aspx");
        }
    }
}