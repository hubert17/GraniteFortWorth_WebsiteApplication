using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.Web.Script.Serialization;

namespace GraniteFortWorth_WebsiteApplication
{
    public partial class LINQ2DS : System.Web.UI.Page
    {
        OleDbDataAdapter dAdapter;
        DataTable dTable;

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadAccessDataToDS();

            var results = from users in dTable.AsEnumerable()
                          where users.Field<string>("UserName") == "hubert17" 
                           select users;

            //JavaScriptSerializer serializer = new JavaScriptSerializer();
            //string json = serializer.Serialize(results);

            ListBox1.DataSource = results.ToList();
            ListBox1.DataValueField="UserName";
            //ListBox1.DataTextField = "Email";
            ListBox1.DataBind();
        }

        private void LoadAccessDataToDS()
        {
            //create the connection string
            string connString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\\DFWwebsiteDB.accdb;Persist Security Info=True";

            //create the database query
            string query = "SELECT * FROM tblUsers";

            //create an OleDbDataAdapter to execute the query
            dAdapter = new OleDbDataAdapter(query, connString);

            //create a command builder
            OleDbCommandBuilder cBuilder = new OleDbCommandBuilder(dAdapter);

            //create a DataTable to hold the query results
            dTable = new DataTable();

            //fill the DataTable
            dAdapter.Fill(dTable);
        }

    }
}