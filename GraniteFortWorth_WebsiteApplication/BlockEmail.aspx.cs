using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

using System.Xml;
using System.Xml.XPath;

namespace GraniteFortWorth_WebsiteApplication
{
    public partial class BlockEmail : System.Web.UI.Page
    {
        string strFilePath;
        DataSet myDataSet;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Checking the existance of XML database

            {
                try
                {
                    strFilePath = Server.MapPath("~/App_Data/SpamEmail.xml");

                    //If XML database not exist then it creates a new XML database 
                    //using other functions given below

                    if (!Page.IsPostBack)
                    {
                        //If XML file not exists, create a new one
                        if (!File.Exists(strFilePath))
                        {
                            InitializeXMLFile();
                        }
                        //If XML database exist then runs it
                        PopulateDataSet();
                        //Add new entry to DataSet
                        DataRow myDataRow = myDataSet.Tables[0].NewRow();
                        myDataRow["name"] = Request.QueryString["name"];
                        myDataRow["email"] = Request.QueryString["email"];
                        myDataSet.Tables[0].Rows.Add(myDataRow);
                        //Write to XML
                        myDataSet.WriteXml(strFilePath, XmlWriteMode.WriteSchema);
                        NameLabel.Text = Request.QueryString["name"];
                        EmailLabel.Text = Request.QueryString["email"];                      
                    }
                }
                catch (Exception ex)
                {
                    divMessage.InnerHtml = "<span style=\"color:red;\">Error encoutered upon blocking the email address. Please try again later.<span>";
                }
                divMessage.Visible = true;
            }
        }

        public void InitializeXMLFile()
        {
            //Create a new data-set
            myDataSet = new DataSet();

            //Create a new data-table
            DataTable myTable = myDataSet.Tables.Add("SpamEmail");

            //Define column id, it will not be visible on form page
            DataColumn myDataColumn = myTable.Columns.Add("id", Type.GetType("System.Int32"));
            var _with1 = myDataColumn;
            _with1.AutoIncrement = true;
            _with1.AutoIncrementSeed = 1;
            _with1.AutoIncrementStep = 1;

            //Seting column named id as the primary key
            DataColumn[] arrPrimaryKey = new DataColumn[2];
            arrPrimaryKey[0] = myDataColumn;
            myTable.PrimaryKey = arrPrimaryKey;

            //Defining other columns which will be visible on form
            myTable.Columns.Add("name", Type.GetType("System.String"));
            myTable.Columns.Add("email", Type.GetType("System.String"));
            //Writing table structure in XML file which is defined above
            myDataSet.WriteXml(strFilePath, XmlWriteMode.WriteSchema);
        }

        public void PopulateDataSet()
        {
            myDataSet = new DataSet();
            myDataSet.ReadXml(strFilePath, XmlReadMode.ReadSchema);
        }

        public void DisplayData()
        {
            //Bind data to Repeater
            //DataView myDataView = myDataSet.Tables(0).DefaultView;

            //Uncomment next line to display the newer messages first
            //myDataView.Sort = "id DESC";
            //myRepeater.DataSource = myDataView;
            //myRepeater.DataBind();
        }


    }
}