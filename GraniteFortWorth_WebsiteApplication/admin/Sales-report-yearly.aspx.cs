using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Globalization;


namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class Sales_report_yearly : System.Web.UI.Page
    {
        // To keep track of the previous row Group Identifier
        string strPreviousRowID = string.Empty;
        // To keep track the Index of Group Total
        int intSubTotalIndex = 1;

        double totSF = 0;
        double subtotSF = 0;
        decimal totSales = 0, totGranite = 0, totWorkOrder = 0, totGrossProfit = 0;
        decimal subtotSales = 0, subtotGranite = 0, subtotWorkOrder = 0, subtotGrossProfit = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            LoggedInUserName.Text = "Hello, " + Context.User.Identity.Name + "!";

            if (GroupCheckBox.Checked)
            {
                GridView1.DataSourceID = SqlDataSource1.ID;
                GridView1.ShowFooter = false;
            }
            else
            {
                GridView1.DataSourceID = SqlDataSource2.ID;
                GridView1.ShowFooter = true;
            }



            if (!IsPostBack)
            {
                SqlDataSource1.SelectParameters["Year"].DefaultValue = DateTime.Now.Year.ToString();
                //SqlDataSource1.SelectParameters["Month"].DefaultValue = DateTime.Now.Month.ToString();

                var YearRange = Enumerable.Range(2010, DateTime.Now.Year - 2009);
                DropDownListYear.DataSource = YearRange;
                DropDownListYear.DataBind();

                DropDownListYear.SelectedValue = DateTime.Now.Year.ToString();
                //.SelectedValue = DateTime.Now.Month.ToString();
            }

            //MonthLabel.Text = DropDownListMonth.SelectedItem.Text;
            YearLabel.Text = DropDownListYear.SelectedItem.Text;

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // This is for cumulating the values
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                double rowtotSF; try { rowtotSF = Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "Total_SF")); } catch (Exception ex) { rowtotSF = 0;  }
                decimal rowtotSales; try { rowtotSales = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "TotalSales")); } catch (Exception ex) { rowtotSales = 0;  }
                decimal rowtotGranite; try { rowtotGranite = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "TotalGranite")); } catch (Exception ex) { rowtotGranite = 0;  }
                decimal rowtotWorkOrder; try { rowtotWorkOrder = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "TotalWorkOrder")); } catch (Exception ex) { rowtotWorkOrder = 0;  }
                decimal rowtotGrossProfit; try { rowtotGrossProfit = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "TotalGrossProfit")); } catch (Exception ex) { rowtotGrossProfit = 0;  }

                // Cumulating Grand Total
                totSF += rowtotSF;
                totSales += rowtotSales;
                totGranite += rowtotGranite;
                totWorkOrder += rowtotWorkOrder;
                totGrossProfit += rowtotGrossProfit;

                if (GroupCheckBox.Checked)
                {
                    strPreviousRowID = DataBinder.Eval(e.Row.DataItem, "InstallMonthName").ToString();

                    // Cumulating Sub Total
                    subtotSF += rowtotSF;
                    subtotSales += rowtotSales;
                    subtotGranite += rowtotGranite;
                    subtotWorkOrder += rowtotWorkOrder;
                    subtotGrossProfit += rowtotGrossProfit;
                }
            }

            if (!GroupCheckBox.Checked)
            {
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[1].ColumnSpan = 2;
                    e.Row.Cells[1].Text = "Grand Total: ";
                    e.Row.Cells[3].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Cells[3].Text = String.Format("{0:0.##}", totSF);
                    e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Right;
                    e.Row.Cells[4].Text = String.Format("{0:c}", totSales);
                    e.Row.Cells[5].Text = String.Format("{0:c}", totGranite);
                    e.Row.Cells[6].Text = String.Format("{0:c}", totWorkOrder);
                    e.Row.Cells[7].Text = String.Format("{0:c}", totGrossProfit);
                    e.Row.CssClass = "GrandTotalRowStyle";
                }
            }
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {

            if (GroupCheckBox.Checked)
            {
                bool IsSubTotalRowNeedToAdd = false;
                bool IsGrandTotalRowNeedtoAdd = false;

                if ((strPreviousRowID != string.Empty) && (DataBinder.Eval(e.Row.DataItem, "InstallMonthName") != null))
                    if (strPreviousRowID != DataBinder.Eval(e.Row.DataItem, "InstallMonthName").ToString())
                        IsSubTotalRowNeedToAdd = true;

                if ((strPreviousRowID != string.Empty) && (DataBinder.Eval(e.Row.DataItem, "InstallMonthName") == null))
                {
                    IsSubTotalRowNeedToAdd = true;
                    IsGrandTotalRowNeedtoAdd = true;
                    intSubTotalIndex = 0;
                }

                #region Inserting first Row and populating fist Group Header details
                if ((strPreviousRowID == string.Empty) && (DataBinder.Eval(e.Row.DataItem, "InstallMonthName") != null))
                {
                    GridView grdViewSales = (GridView)sender;

                    GridViewRow row = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);

                    string InstallMonthName = DataBinder.Eval(e.Row.DataItem, "InstallMonthName").ToString();
                    TableCell cell = new TableCell();
                    // Span the row across all of the columns in the Gridview
                    //cell.ColumnSpan = this.GridView1.Columns.Count;
                    cell.ColumnSpan = grdViewSales.Columns.Count;

                    cell.Width = Unit.Percentage(100);
                    cell.Style.Add("font-weight", "bold");
                    cell.Style.Add("font-size", "medium");
                    cell.Style.Add("border-bottom", "solid 1px");
                    cell.Style.Add("border-bottom-color", "black");
                    //cell.Style.Add("background-color", "#c0c0c0");
                    cell.Style.Add("color", "black");
                    cell.Style.Add("vertical-align", "bottom");

                    HtmlGenericControl span = new HtmlGenericControl("span");
                    span.InnerHtml = InstallMonthName;

                    cell.Controls.Add(span);
                    row.Cells.Add(cell);

                    grdViewSales.Controls[0].Controls.AddAt(e.Row.RowIndex + intSubTotalIndex, row);
                    intSubTotalIndex++;
                }
                #endregion

                if (IsSubTotalRowNeedToAdd)
                {
                    #region Adding Sub Total Row
                    GridView grdViewSales = (GridView)sender;

                    // Creating a Row
                    GridViewRow row = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);

                    //Adding Total Cell 
                    TableCell cell = new TableCell();
                    cell.Text = "Sub Total";
                    cell.Style.Add("font-Style", "italic");
                    cell.HorizontalAlign = HorizontalAlign.Left;
                    cell.ColumnSpan = 3;
                    cell.CssClass = "SubTotalRowStyle";
                    row.Cells.Add(cell);

                    //Adding Unit Price Column
                    cell = new TableCell();
                    cell.Text = string.Format("{0:0.##}", subtotSF);
                    cell.HorizontalAlign = HorizontalAlign.Center;
                    cell.CssClass = "SubTotalRowStyle";
                    row.Cells.Add(cell);

                    //Adding Quantity Column
                    cell = new TableCell();
                    cell.Text = string.Format("{0:c}", subtotSales);
                    cell.HorizontalAlign = HorizontalAlign.Right;
                    cell.CssClass = "SubTotalRowStyle";
                    row.Cells.Add(cell);

                    //Adding Discount Column
                    cell = new TableCell();
                    cell.Text = string.Format("{0:c}", subtotGranite);
                    cell.HorizontalAlign = HorizontalAlign.Right;
                    cell.CssClass = "SubTotalRowStyle";
                    row.Cells.Add(cell);

                    //Adding Amount Column
                    cell = new TableCell();
                    cell.Text = string.Format("{0:c}", subtotWorkOrder);
                    cell.HorizontalAlign = HorizontalAlign.Right;
                    cell.CssClass = "SubTotalRowStyle";
                    row.Cells.Add(cell);

                    //Adding Amount Column
                    cell = new TableCell();
                    cell.Text = string.Format("{0:c}", subtotGrossProfit);
                    cell.HorizontalAlign = HorizontalAlign.Right;
                    cell.CssClass = "SubTotalRowStyle";
                    row.Cells.Add(cell);

                    //Adding the Row at the RowIndex position in the Grid
                    grdViewSales.Controls[0].Controls.AddAt(e.Row.RowIndex + intSubTotalIndex, row);
                    intSubTotalIndex++;
                    #endregion

                    #region Adding Next Group Header Details
                    if (DataBinder.Eval(e.Row.DataItem, "InstallMonthName") != null)
                    {
                        row = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);

                        string InstallMonthName = DataBinder.Eval(e.Row.DataItem, "InstallMonthName").ToString();
                        cell = new TableCell();
                        // Span the row across all of the columns in the Gridview
                        cell.ColumnSpan = grdViewSales.Columns.Count;

                        cell.Width = Unit.Percentage(100);
                        cell.Style.Add("font-weight", "bold");
                        cell.Style.Add("font-size", "medium");
                        cell.Style.Add("border-bottom", "solid 1px");
                        cell.Style.Add("border-bottom-color", "black");
                        //cell.Style.Add("background-color", "#c0c0c0");
                        cell.Style.Add("color", "black");
                        cell.Style.Add("vertical-align", "bottom");

                        HtmlGenericControl span = new HtmlGenericControl("span");
                        span.InnerHtml = InstallMonthName != String.Empty ? "<br />" + InstallMonthName : InstallMonthName;

                        cell.Controls.Add(span);
                        row.Cells.Add(cell);

                        grdViewSales.Controls[0].Controls.AddAt(e.Row.RowIndex + intSubTotalIndex, row);
                        intSubTotalIndex++;
                    }
                    #endregion

                    #region Reseting the Sub Total Variables
                    subtotSF = 0;
                    subtotSales = 0;
                    subtotGranite = 0;
                    subtotWorkOrder = 0;
                    subtotGrossProfit = 0;
                    #endregion
                }
                if (IsGrandTotalRowNeedtoAdd)
                {
                    #region Grand Total Row
                    GridView grdViewSales = (GridView)sender;

                    // Creating a Row
                    GridViewRow row = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);

                    //Adding Total Cell 
                    TableCell cell = new TableCell();

                    cell.Text = "Grand Total";
                    cell.HorizontalAlign = HorizontalAlign.Left;
                    cell.ColumnSpan = 3;
                    cell.CssClass = "GrandTotalRowStyle";
                    row.Cells.Add(cell);

                    //Adding Unit Price Column
                    cell = new TableCell();
                    cell.Text = string.Format("{0:0.##}", totSF);
                    cell.HorizontalAlign = HorizontalAlign.Center;
                    cell.CssClass = "GrandTotalRowStyle";
                    row.Cells.Add(cell);

                    //Adding Quantity Column
                    cell = new TableCell();
                    cell.Text = string.Format("{0:c}", totSales);
                    cell.HorizontalAlign = HorizontalAlign.Right;
                    cell.CssClass = "GrandTotalRowStyle";
                    row.Cells.Add(cell);

                    //Adding Discount Column
                    cell = new TableCell();
                    cell.Text = string.Format("{0:c}", totGranite);
                    cell.HorizontalAlign = HorizontalAlign.Right;
                    cell.CssClass = "GrandTotalRowStyle";
                    row.Cells.Add(cell);

                    //Adding Amount Column
                    cell = new TableCell();
                    cell.Text = string.Format("{0:c}", totWorkOrder);
                    cell.HorizontalAlign = HorizontalAlign.Right;
                    cell.CssClass = "GrandTotalRowStyle";
                    row.Cells.Add(cell);

                    //Adding Amount Column
                    cell = new TableCell();
                    cell.Text = string.Format("{0:c}", totGrossProfit);
                    cell.HorizontalAlign = HorizontalAlign.Right;
                    cell.CssClass = "GrandTotalRowStyle";
                    row.Cells.Add(cell);

                    //Adding the Row at the RowIndex position in the Grid
                    grdViewSales.Controls[0].Controls.AddAt(e.Row.RowIndex, row);
                    #endregion
                }
            }

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "Monthly")
                Response.Redirect("Sales-report-monthly.aspx");
            else if (DropDownList1.SelectedValue == "Date")
                Response.Redirect("/admin2014/admin/sales-report-date.aspx");
        }

        protected void LogoutLinkButton_Click(object sender, EventArgs e)
        {
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("~/admin/Login.aspx");
        }
    }
}