using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Threading;

using Google.Apis.Calendar.v3;
using Google.Apis.Calendar.v3.Data;
using Google.Apis.Services;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Util.Store;
using Google;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class sql_util : System.Web.UI.Page
    {
        CalendarService service;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void sqlExecute_Click(object sender, EventArgs e)
        {
            string connect = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\\DFWwebsiteDB.accdb;Persist Security Info=True";
            string query = String.Empty;
            OleDbConnection conn = new OleDbConnection(connect);

            try
            {
                if (sqlType.SelectedValue == "UPDATE")
                {
                    query = "UPDATE " + sqlText.Text + " " + sqlWhere.Text + " " + sqlWhereText.Text;
                }
                else if (sqlType.SelectedValue == "DELETE")
                {
                    query = "DELETE " + sqlText.Text + " " + sqlWhere.Text + " " + sqlWhereText.Text;
                }
                else if (sqlType.SelectedValue == "INSERT INTO")
                {
                    query = "INSERT INTO " + sqlText.Text;
                }

                OleDbCommand cmd = new OleDbCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                string myScript = "\n<script type=\"text/javascript\" language=\"Javascript\" id=\"EventScriptBlock\">\n";
                myScript += "alert('Successfully executed the SQL statement!'); ";
                myScript += "\n\n </script>";
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "myKey", myScript, false);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message + "<br />CONNECTION STRING: " + connect + "<br />SQL COMMAND: " + query);
            }


        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx?ReturnURL=sql-util.aspx");
        }

        protected void AuthButton_Click(object sender, EventArgs e)
        {
            UserCredential credential = GoogleWebAuthorizationBroker.AuthorizeAsync(
                           new ClientSecrets
                           {
                               ClientId = "18000002748.apps.googleusercontent.com",
                               ClientSecret = "MMuUh1Z7a9Yf0Kq9gwLdQwB1",
                           },
                           new[] { CalendarService.Scope.Calendar },
                           "dhitt0327@gmail.com", CancellationToken.None, new FileDataStore(Server.MapPath("/admin/"))).Result;

            // Create the service.
            service = new CalendarService(new BaseClientService.Initializer()
            {
                HttpClientInitializer = credential,
                ApplicationName = "Calendar API Sample",
            });

            // Fetch the list of calendar list
            IList<CalendarListEntry> list = service.CalendarList.List().Execute().Items;

            // Display all calendars
            DisplayList(list);

            foreach (CalendarListEntry calendar in list)
            {
                // Display calendar's events
                DisplayFirstCalendarEvents(calendar);
            }

            //Console.WriteLine("Press any key to continue...");
            //Console.ReadKey();
        }


        // Displays all calendars
        private void DisplayList(IList<CalendarListEntry> list)
        {
            string strResponse = "Lists of calendars: <br>";
            foreach (CalendarListEntry item in list)
            {
                strResponse += "<br> " + item.Summary + ". Location: " + item.Location + ", TimeZone: " + item.TimeZone;
            }
            Response.Write(strResponse);
        }

        // Displays the calendar's events
        private void DisplayFirstCalendarEvents(CalendarListEntry list)
        {
            string strResponse = String.Format(Environment.NewLine + "Maximum 5 first events from {0}:", list.Summary);
            EventsResource.ListRequest requeust = service.Events.List(list.Id);

            //Set MaxResults and TimeMin with sample values
            requeust.MaxResults = 5;
            requeust.TimeMin = new DateTime(2013, 10, 1, 20, 0, 0);

            // Fetch the list of events
            foreach (Event calendarEvent in requeust.Execute().Items)
            {
                strResponse += "<br> Summary: " + calendarEvent.Summary;
            }
        }


    }
}