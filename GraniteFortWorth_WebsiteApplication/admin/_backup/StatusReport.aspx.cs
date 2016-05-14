using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class StatusReport : System.Web.UI.Page
    {
        // Used to store the last Category Name between each RowDataBound
        private string tmpCategoryName = String.Empty;
        //string emptyCat = "Unknown Status";

        protected void Page_Load(object sender, EventArgs e)
        {
            //***** LOGIN REDIRECTION BEGIN ********************************************//
            if (System.Web.HttpContext.Current.Session["LoggedInUserName"] != null)
            {
                if (System.Web.HttpContext.Current.Session["LoggedInUserName"].ToString() == String.Empty)
                    Response.Redirect("Login.aspx?ReturnURL=StatusReport.aspx");
            }
            else
                Response.Redirect("Login.aspx?ReturnURL=StatusReport.aspx");
            //***** LOGIN REDIRECTION END ********************************************//

            if (!IsPostBack) CategoryChange();

            this.GridView1.DataSourceID = SqlDataSource1.ID;
            this.GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            // If the current row is a DataRow (and not a Header or Footer row), then do stuff.
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
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


            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            CategoryChange();
        }

        protected void CategoryChange()
        {
            if (DropDownList1.SelectedValue == "StatusNz")
            {
                SqlDataSource1.SelectCommand += " ORDER BY StatusID, InstallDate DESC";
                GridView1.Columns[1].Visible = false;
                GridView1.Columns[2].Visible = true;
                RecentJobByLabel.Text = "by Status";
                //emptyCat = "Unknown Status";
            }
            else
            {
                SqlDataSource1.SelectCommand += " ORDER BY SalesManID, InstallDate DESC";
                GridView1.Columns[2].Visible = false;
                GridView1.Columns[1].Visible = true;
                RecentJobByLabel.Text = "by Salesman";
                //emptyCat = "No Salesman";
            }
        }

    }
}