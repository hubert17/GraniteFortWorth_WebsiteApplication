using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;
using System.Text.RegularExpressions;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class References : System.Web.UI.Page
    {
        // Used to store the last Category Name between each RowDataBound
        private string tmpCategoryName = String.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            string u = Request.ServerVariables["HTTP_USER_AGENT"];
            Regex b = new Regex(@"(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino", RegexOptions.IgnoreCase | RegexOptions.Multiline);
            Regex v = new Regex(@"1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-", RegexOptions.IgnoreCase | RegexOptions.Multiline);
            if ((b.IsMatch(u) || v.IsMatch(u.Substring(0, 4))))
            {
                Response.Redirect("/m/references.aspx");
            }

            if (!IsPostBack) CategoryChange();

            this.GridView1.DataSourceID= SqlDataSource1.ID;
            this.GridView1.DataBind();

            if (Request.QueryString["AdminView"] != null)
            {
                if ((Request.QueryString["AdminView"].ToString()).Equals("true") && Context.User.Identity.IsAuthenticated)
                {
                    btnMailingList.Visible = true;
                }
            }

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
            if (DropDownList1.SelectedValue == "ZipCode")
            {
                SqlDataSource1.SelectCommand += " ORDER BY tblOnlineQuotes.ZipCode, tblOnlineQuotes.CustomerFirstName + ' ' + tblOnlineQuotes.CustomerLastName";
                GridView1.Columns[3].Visible = true;
                RecentJobByLabel.Text = "by Zip";
            }
            else
            {
                SqlDataSource1.SelectCommand += " ORDER BY SlabColorsQry.SlabColorName, tblOnlineQuotes.CustomerFirstName + ' ' + tblOnlineQuotes.CustomerLastName";
                GridView1.Columns[3].Visible = false;
                RecentJobByLabel.Text = "by Granite";
            }
        }

        protected void btnMailingList_Click(object sender, EventArgs e)
        {
            string query1 = "Select CustomerFirstName + ' ' + CustomerLastName AS CustomerName, Email from tblOnlineQuotes WHERE StatusID=8 ORDER BY InstallDate DESC";
            string connect1 = SqlDataSource1.ConnectionString;
            OleDbConnection conn1 = new OleDbConnection(connect1);
            OleDbCommand cmd1 = new OleDbCommand(query1, conn1);
            conn1.Open();
            OleDbDataReader GraniteDataReader = cmd1.ExecuteReader();

            string strMailingList = String.Empty;
            while (GraniteDataReader.Read())
            {
                strMailingList += GraniteDataReader.GetString(0) + " <" + GraniteDataReader.GetString(1) + ">, ";
            }
            GraniteDataReader.Close();
            conn1.Close();

            MailingListTextBox.Text = strMailingList;
            MailingListTextBox.Attributes.Add("onclick", "this.focus();this.select();document.execCommand('copy');");
            InstructionLabel.Visible = true;
            MailingListTextBox.Visible = true;           
            btnMailingList.Visible = false;
        }

    }
}