using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class TaskReportByDate : System.Web.UI.Page
    {

        // Used to store the last Category Name between each RowDataBound
        private string tmpCategoryName = String.Empty;
        private string strJobID = String.Empty;
        private bool ShowAll = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            LoggedInUserName.Text = "Hello, " + Context.User.Identity.Name + "!";

            //if (!IsPostBack) 
                CategoryChange();

            this.GridView1.DataSourceID = SqlDataSource1.ID;
            this.GridView1.DataBind();
            SpanCategory.Style.Add("display", "block");

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (ShowAll)
            {
                // If the current row is a DataRow (and not a Header or Footer row), then do stuff.
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    int JobIDColumn = 3;
                    int SinkColumn = 4;
                    //strJobID = HttpUtility.ParseQueryString(e.Row.Cells[JobIDColumn].Text).Get("OnlineQuoteID");
                    strJobID = e.Row.Cells[JobIDColumn].Text;

                    if (strJobID != null)
                    {
                        string query1 = "Select SlabColorName from OnlineQuoteStonenameQry where OnlineQuoteID = " + strJobID;
                        string connect1 = SqlDataSource1.ConnectionString;
                        OleDbConnection conn1 = new OleDbConnection(connect1);
                        OleDbCommand cmd1 = new OleDbCommand(query1, conn1);
                        conn1.Open();
                        OleDbDataReader GraniteDataReader = cmd1.ExecuteReader();

                        while (GraniteDataReader.Read())
                        {
                            e.Row.Cells[6].Text += GraniteDataReader.GetString(0) + "<br>";
                        }
                        GraniteDataReader.Close();
                        conn1.Close();

                        if (e.Row.Cells[1].Text == "Install")
                        {
                            string query2 = "Select SinkName from OnlineQuoteSinknameQry where SinkID>0 AND OnlineQuoteID = " + strJobID;
                            string connect2 = SqlDataSource1.ConnectionString;
                            OleDbConnection conn2 = new OleDbConnection(connect2);
                            OleDbCommand cmd2 = new OleDbCommand(query2, conn2);
                            conn2.Open();
                            OleDbDataReader SinkDataReader = cmd2.ExecuteReader();

                            while (SinkDataReader.Read())
                            {
                                try
                                {
                                    e.Row.Cells[SinkColumn].Text += "<br>●" + SinkDataReader.GetString(0);
                                }
                                catch (Exception ex)
                                {
                                    e.Row.Cells[SinkColumn].Text += "<br>●<em>" + ex.Message + "</em>";
                                }
                            }
                            SinkDataReader.Close();
                            conn2.Close();
                        }

                        e.Row.Cells[JobIDColumn].Text = "<a href=\"http://www.granitesouthlake.com/admin/EditJob.aspx?OnlineQuoteID=" + e.Row.Cells[JobIDColumn].Text + "\" target=\"_blank\">" + e.Row.Cells[JobIDColumn].Text + "</a>";
                    }

                    /*
                    DataRowView drv = (DataRowView)e.Row.DataItem;

                    if (tmpCategoryName != drv[DropDownList1.SelectedValue].ToString())
                    {
                        tmpCategoryName = drv[DropDownList1.SelectedValue].ToString();

                        // Get a reference to the current row’s Parent, which is the Gridview (which happens to be a table)
                        Table tbl = e.Row.Parent as Table;
                        if (tbl != null)
                        {
                            GridViewRow row = new GridViewRow(-1, -1, DataControlRowType.DataRow, DataControlRowState.Normal);
                            TableCell cell = new TableCell();

                            // Span the row across all of the columns in the Gridview
                            cell.ColumnSpan = this.GridView1.Columns.Count;

                            cell.Width = Unit.Percentage(100);
                            cell.Style.Add("font-weight", "bold");
                            cell.Style.Add("font-size", "medium");
                            cell.Style.Add("border-bottom", "solid 1px");
                            cell.Style.Add("border-bottom-color", "black");
                            //cell.Style.Add("background-color", "#c0c0c0");
                            cell.Style.Add("color", "black");
                            cell.Style.Add("vertical-align", "bottom");

                            HtmlGenericControl span = new HtmlGenericControl("span");
                            span.InnerHtml = tmpCategoryName != String.Empty ? "<br />" + tmpCategoryName : tmpCategoryName;

                            cell.Controls.Add(span);
                            row.Cells.Add(cell);

                            tbl.Rows.AddAt(tbl.Rows.Count - 1, row);
                            
                        }                        
                    }
                    * */

                }
            }
        }

        protected void CategoryChange()
        {
            ShowAll = true;

            /*
            if (DropDownList1.SelectedValue == "Summary")
                Response.Redirect("StatusReport.aspx");
            else if (DropDownList1.SelectedValue == "Measure")
                Response.Redirect("StatusMeasureReport.aspx");
            else if (DropDownList1.SelectedValue == "Quote")
                Response.Redirect("StatusQuoteReport.aspx");
            else if (DropDownList1.SelectedValue == "Template")
                Response.Redirect("StatusTemplateReport.aspx");
             * */

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            CategoryChange();
        }

        protected void LogoutLinkButton_Click(object sender, EventArgs e)
        {
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("~/admin/Login.aspx");
        }

        protected void TaskDateDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("TaskReportByDate.aspx?TaskDate=" + TaskDateDropDown.SelectedValue);
        }

        protected void TaskDateDropDown_DataBound(object sender, EventArgs e)
        {
            if (Request.QueryString["TaskDate"] != null)
            {
                string qsTaskDate = Request.QueryString["TaskDate"];
                if (!IsPostBack)
                {
                    try
                    {
                        TaskDateDropDown.SelectedValue = qsTaskDate;
                    }
                    catch (Exception ex)
                    {
                        CategoryLabel.Text = "#Invalid Date#";
                    }
                }
                CategoryLabel.Text = Request.QueryString["TaskDate"];
            }
        }

    }
}