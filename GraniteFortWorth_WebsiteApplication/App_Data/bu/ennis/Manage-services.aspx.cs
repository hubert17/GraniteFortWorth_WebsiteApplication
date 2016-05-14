using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class Manage_services : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //***** LOGIN REDIRECTION BEGIN ********************************************//
            if (System.Web.HttpContext.Current.Session["LoggedInUserName"] != null)
            {
                if (System.Web.HttpContext.Current.Session["LoggedInUserName"].ToString() == String.Empty)
                    Response.Redirect("Login.aspx?ReturnURL=Manage-services.aspx");
            }
            else
                Response.Redirect("Login.aspx?ReturnURL=Manage-services.aspx");
            //***** LOGIN REDIRECTION END ********************************************//

            string query = "Select max(ServicesID)+1 from tblServices";
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
            string connect2 = SqlDataSource1.ConnectionString;
            OleDbConnection conn3 = new OleDbConnection(connect2);
            string query = "UPDATE tblServices SET ServiceType = 'D' WHERE ServiceType = '-1'";
            OleDbCommand cmd = new OleDbCommand(query, conn3);
            conn3.Open();
            cmd.ExecuteNonQuery();
            conn3.Close();

            RecordStatusLabel.Text = "Entry successfully added.";
            //RefreshButton.OnClientClick = "window.location = 'Manage-services.aspx'; return false;";
            //RefreshButton.Visible = true;
            ListBox1.DataBind();

        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            RecordStatusLabel.Text = "Record successfully updated.";
        }

        protected void RefreshButton_Click(object sender, EventArgs e)
        {
            ListBox1.DataBind();
        }

        protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            RecordStatusLabel.Text = "Item permanently deleted.";
            //RefreshButton.OnClientClick = "window.location = 'Manage-services.aspx'; return false;";
            //RefreshButton.Visible = true;
            ListBox1.DataBind();
        }

        protected void ServicesButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage-granite.aspx");
        }

        protected void EditJobButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage-sink.aspx");
        }

    }
}