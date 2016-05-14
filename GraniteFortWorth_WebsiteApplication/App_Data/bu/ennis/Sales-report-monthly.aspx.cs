using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class Sales_report_monthly : System.Web.UI.Page
    {
        double totSF;
        decimal totSales, totGranite, totWorkOrder, totGrossProfit;

        protected void Page_Load(object sender, EventArgs e)
        {
            totSF = 0; totSales = 0; totGranite = 0; totWorkOrder = 0; totGrossProfit = 0;

            if (!IsPostBack)
            {
                SqlDataSource1.SelectParameters["Year"].DefaultValue = DateTime.Now.Year.ToString();
                SqlDataSource1.SelectParameters["Month"].DefaultValue = DateTime.Now.Month.ToString();

                var months = CultureInfo.CurrentCulture.DateTimeFormat.MonthNames;
                for (int i = 0; i < months.Length; i++)
                {
                    DropDownListMonth.Items.Add(new ListItem(months[i], (i + 1).ToString()));
                }

                var YearRange = Enumerable.Range(2010, DateTime.Now.Year - 2009);
                DropDownListYear.DataSource = YearRange;
                DropDownListYear.DataBind();

                DropDownListYear.SelectedValue = DateTime.Now.Year.ToString();
                DropDownListMonth.SelectedValue = DateTime.Now.Month.ToString();
            }

            MonthLabel.Text = DropDownListMonth.SelectedItem.Text;
            YearLabel.Text = DropDownListYear.SelectedItem.Text;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                double rowtotSF = Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "Total_SF"));
                decimal rowtotSales = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "TotalSales"));
                decimal rowtotGranite = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "TotalGranite"));
                decimal rowtotWorkOrder = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "TotalWorkOrder"));
                decimal rowtotGrossProfit = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "TotalGrossProfit"));

                totSF += rowtotSF; totSales += rowtotSales; totGranite += rowtotGranite; totWorkOrder += rowtotWorkOrder; totGrossProfit += rowtotGrossProfit;
            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[3].Text = DropDownListMonth.SelectedItem.Text + " Totals:";
                e.Row.Cells[4].Text = String.Format("{0:0.#}", totSF);
                e.Row.Cells[5].Text = String.Format("{0:c}", totSales);
                e.Row.Cells[6].Text = String.Format("{0:c}", totGranite);
                e.Row.Cells[7].Text = String.Format("{0:c}", totWorkOrder);
                e.Row.Cells[8].Text = String.Format("{0:c}", totGrossProfit);
            }

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "Yearly")
                Response.Redirect("Sales-report-yearly.aspx");

        }



    }
}