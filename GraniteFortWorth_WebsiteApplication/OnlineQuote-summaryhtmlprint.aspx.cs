using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GraniteFortWorth_WebsiteApplication
{
    public partial class OnlineQuote_summaryhtmlprint : System.Web.UI.Page
    {
        decimal totalSlabs = 0;
        decimal totalStones = 0;
        decimal totalSink = 0;
        decimal totalServices = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            OnlineQuoteIDLabel.Text = Request.QueryString["OnlineQuoteID"];
        }

        protected void GridView4_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                decimal rowTotal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Total"));
                totalSlabs = totalSlabs + rowTotal;
            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[5].Text = String.Format("{0:C}", totalSlabs);
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                decimal rowTotal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Total"));
                totalStones = totalStones + rowTotal;
            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[6].Text = String.Format("{0:C}", totalStones);
            }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                decimal rowTotal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Total"));
                totalSink = totalSink + rowTotal;
            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[6].Text = String.Format("{0:C}", totalSink);
            }
        }

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                decimal rowTotal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Total"));
                totalServices = totalServices + rowTotal;
            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[5].Text = String.Format("{0:C}", totalServices);
            }
        }

        protected void DisplayTotalCost()
        {
            decimal totalCost = totalSlabs + totalStones + totalSink + totalServices;
            //((Label)FormView1.FindControl("TotalCostLabel")).Text = "TOTAL COST:     " + String.Format("{0:C}", totalCost);
            Response.Write("TOTAL COST:     " + String.Format("{0:C}", totalCost));
        }
    }
}