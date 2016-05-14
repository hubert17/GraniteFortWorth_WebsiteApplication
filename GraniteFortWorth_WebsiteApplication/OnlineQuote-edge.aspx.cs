using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;


namespace GraniteFortWorth_WebsiteApplication
{
    public partial class OnlineQuote_edge : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OnlineQuoteIDLabel.Text = Request.QueryString["OnlineQuoteID"];

            DataSet ds = new DataSet();

            ds = BindEdges();

            foreach (DataRow dr in ds.Tables[0].Rows)
            {

                ListItem li = new ListItem();

                li.Value = dr[0].ToString();

                li.Text = "<img src=\"Images/Edges/" + dr[3].ToString() + "\" alt=\"\" width=\"100px\"  />&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + dr[1].ToString() + " - " + dr[2].ToString() + "<br /><br />";  // This will display the image next to the text
                li.Attributes.CssStyle.Add("margin", "0 0 10px 15px");

                try
                {
                    ((RadioButtonList)(FormView1.FindControl("RadioButtonList1"))).Items.Add(li);
                    //((RadioButtonList)(FormView1.FindControl("RadioButtonList1"))).DataBind();
                }
                catch (Exception ex)
                {
                    //Response.Redirect("OnlineQuote-sinks.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"]);
                    Response.Write(ex.Message);
                    //RadioButtonList EdgeList = ((RadioButtonList)(FormView1.FindControl("RadioButtonList1")));
                    //EdgeList.DataSourceID = SqlDataSource2.ID;
                    //EdgeList.DataValueField = "EdgeID";
                    //EdgeList.DataTextField = "EdgeNamePrice";
                }
            } 

        }

        public DataSet BindEdges()
        {
            string query = "Select EdgeID, EdgeName, WebPrice, ImageFilename from EdgesQry";
            string connect = SqlDataSource1.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            OleDbDataAdapter da = new OleDbDataAdapter(cmd);
            DataSet ds = new DataSet();
            conn.Open();
            cmd.ExecuteNonQuery();
            da.Fill(ds);
            conn.Close();
            return ds;

        }

        protected void RadioButtonList1_DataBound(object sender, EventArgs e)
        {
            RadioButtonList list = (RadioButtonList)sender;
            ListItem blank = list.Items.FindByValue("-1");
            if (blank != null)
                list.Items.Remove(blank);
        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            Response.Redirect("OnlineQuote-sinks.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"]);
        }

        protected void UpdateCancelButton_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect("OnlineQuote-granite.aspx?OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"]);
        }

        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            if ((((RadioButtonList)FormView1.FindControl("RadioButtonList1")).SelectedValue).Equals("-1"))
            {
                ((Literal)FormView1.FindControl("SelectStoneRequiredLiteral")).Visible = true;
                e.Cancel = true;
            }
        }



    }
}