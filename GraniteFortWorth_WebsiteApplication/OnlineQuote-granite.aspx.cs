using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GraniteFortWorth_WebsiteApplication
{
    public partial class OnlineQuote_granite : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {  
            string query = "Select max(OnlineQuoteStoneID)+1 from tblOnlineQuoteStone";
            string connect = SqlDataSource0.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            conn.Open();
            OnlineQuoteStoneIDLabel.Text = Convert.ToString(cmd.ExecuteScalar());
            conn.Close();

            OnlineQuoteIDLabel.Text = Request.QueryString["OnlineQuoteID"];

            //((CompareValidator)ListView0.InsertItem.FindControl("StoneValidator")).ControlToValidate = ((DropDownList)ListView0.InsertItem.FindControl("SlabColorIDDropDownList")).ID;
            query = "Select max(OnlineQuoteMeasureID)+1 from tblOnlineQuotesMeasures";
            connect = SqlDataSource0.ConnectionString;
            conn = new OleDbConnection(connect);
            cmd = new OleDbCommand(query, conn);
            conn.Open();
            OnlineQuoteMeasureIDLabel.Text = Convert.ToString(cmd.ExecuteScalar());
            conn.Close();


            Page.MaintainScrollPositionOnPostBack = true;
             //((TextBox)ListView0.InsertItem.FindControl("SquareFeetQtyTextBox")).Text = Request.QueryString["SF"];

            if (!IsPostBack)
            {
                CalculateTotals();
            }

           
        }

        protected int CountItem()
        {
            string query = "Select count(OnlineQuoteStoneID) from tblOnlineQuoteStone WHERE OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"];
            string connect = SqlDataSource0.ConnectionString;
            OleDbConnection conn = new OleDbConnection(connect);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            conn.Open();
            int ItemCount = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();

            return ItemCount;
        }



        protected void ListView0_ItemCreated(object sender, ListViewItemEventArgs e)
        {
            /*
            TextBox OnlineQuoteIDTextBox = new TextBox();
            OnlineQuoteIDTextBox.Text = "This is test";

            PlaceHolder objPlc = (PlaceHolder)e.Item.FindControl("plcSam");
            objPlc.Controls.Add(OnlineQuoteIDTextBox);            
             * */
            if (!String.IsNullOrEmpty(Request.QueryString["SlabColorID"]))
            {
                DropDownList ddlSlabColorID = (DropDownList)ListView0.InsertItem.FindControl("SlabColorIDDropDownList");
                ddlSlabColorID.DataSourceID = "SqlDataSourcePromoLookup";
            }
        }



        protected void ListView0_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            //((TextBox)ListView0.InsertItem.FindControl("OnlineQuoteID")).Text = "12345";

        }

        protected void ListView0_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            if ((((DropDownList)ListView0.InsertItem.FindControl("SlabColorIDDropDownList")).SelectedValue).Equals("-1"))
            {
                ((Literal)ListView0.InsertItem.FindControl("SelectStoneRequiredLiteral")).Visible = true;
                e.Cancel = true;
            }
            else
            {
                string query = "DELETE FROM tblOnlineQuoteStone WHERE OnlineQuoteID=" + OnlineQuoteIDLabel.Text;
                string connect = SqlDataSource0.ConnectionString;
                OleDbConnection conn = new OleDbConnection(connect);
                OleDbCommand cmd = new OleDbCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

        }

        protected string ShowSlabImage(string SlabColorID, string SlabColorName)
        {
            
            if (!(SlabColorID.Equals("-1")))
            {
                string query = "Select ImageFilename from SlabColorsQry where SlabColorID=" + Convert.ToInt32(SlabColorID);
                string connect = SqlDataSource0.ConnectionString;
                OleDbConnection conn = new OleDbConnection(connect);
                OleDbCommand cmd = new OleDbCommand(query, conn);
                conn.Open();
                string ImageFilename = Convert.ToString(cmd.ExecuteScalar());
                conn.Close();

                ((Literal)ListView0.InsertItem.FindControl("SelectStoneRequiredLiteral")).Visible = false;
                return "<a class=\"fancybox\" title=\"" + SlabColorName + "\" href=\"images/Slabs/" + ImageFilename + "\"><img id=\"imgSlab\" src=\"images/Slabs/thumb/" + ImageFilename + "\" Width=\"280px\" ></a>";
            }
            else if (!String.IsNullOrEmpty(Request.QueryString["SlabColorID"]))
            {
                return "<a class=\"fancybox\" href=\"images/Slabs\"><img id=\"imgSlab\" src=\"\" Width=\"280px\" ></a>";
            }
            else                         
                return String.Empty;
        }

        protected void NextButton_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["SlabColorID"]))
            {
                string query = "Select SlabPromoPrice from tblSlabPromo where SlabColorID=" + ((DropDownList)ListView0.InsertItem.FindControl("SlabColorIDDropDownList")).SelectedValue;
                string connect = SqlDataSource0.ConnectionString;
                OleDbConnection conn = new OleDbConnection(connect);
                OleDbCommand cmd = new OleDbCommand(query, conn);
                conn.Open();
                SqlDataSource0.InsertParameters["FabPricePrintOveride"].DefaultValue = Convert.ToString(cmd.ExecuteScalar());
                conn.Close();
            }
            
            ListView0.InsertNewItem(true);

            if (CountItem() > 0)
            {
                String strOnlineQuoteID = Request.QueryString["OnlineQuoteID"];
                Response.Redirect("OnlineQuote-edge.aspx?OnlineQuoteID=" + strOnlineQuoteID);
            }
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            String strOnlineQuoteID = Request.QueryString["OnlineQuoteID"];
            Response.Redirect("OnlineQuote-custinfo.aspx?OnlineQuoteID=" + strOnlineQuoteID);
        }

        protected void ListView0_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {
            if (CountItem() > 0)
            {
                if ((((TextBox)ListView0.InsertItem.FindControl("SquareFeetQtyTextBox")).Text).Equals(String.Empty))
                    Response.Redirect("OnlineQuote-measurement.aspx?OnlineQuoteStoneID=" + OnlineQuoteStoneIDLabel.Text + "&OnlineQuoteID=" + Request.QueryString["OnlineQuoteID"]);
            }
            

        }


        protected void CalculateTotals()
        {
            string query2 = "Select sum(Length*Width) from tblOnlineQuotesMeasures where OnlineQuoteStoneID=" + OnlineQuoteStoneIDLabel.Text;
            string connect2 = SqlDataSource1.ConnectionString;
            OleDbConnection conn2 = new OleDbConnection(connect2);
            OleDbCommand cmd2 = new OleDbCommand(query2, conn2);
            conn2.Open();
            int intTotalSquareInches;
            try
            {
                intTotalSquareInches = Convert.ToInt32(cmd2.ExecuteScalar());
            }
            catch (Exception ex)
            {
                intTotalSquareInches = 0;
            }
            conn2.Close();

            TotalSquareInchesTextBox.Text = Convert.ToString(intTotalSquareInches);
            double dblTotalSquareFoot = Math.Ceiling((Double)intTotalSquareInches / 144);
            TotalSquareFootTextBox.Text = Convert.ToString(dblTotalSquareFoot);
            TotalSquareFootTextBoxPlus10.Text = Convert.ToString(dblTotalSquareFoot + (dblTotalSquareFoot * 0.1));
        }

        protected void ListView1_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {
            CalculateTotals();
        }

        protected void ListView1_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
        {
            CalculateTotals();
        }

        protected void ListView1_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            CalculateTotals();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            //((TextBox)ListView0.InsertItem.FindControl("SquareFeetQtyTextBox")).Text = TotalSquareFootTextBox.Text;
            //Response.Redirect(Request.RawUrl + "&SF=" + TotalSquareFootTextBox.Text); 

        }

    }
}