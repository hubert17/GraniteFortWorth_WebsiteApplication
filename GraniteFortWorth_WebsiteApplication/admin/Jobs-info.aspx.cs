using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;

using Google.GData;
using Google.GData.Calendar;
using Google.GData.Client;
using System.Threading;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class Jobs_info : System.Web.UI.Page
    {
        private string strStatusID = String.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (FormView2.CurrentMode == FormViewMode.Edit)
            {
                TextBox txtUserJob = (TextBox)FormView2.FindControl("UserJobNoTextBox");
                if (String.IsNullOrEmpty(txtUserJob.Text))
                {
                    txtUserJob.Text = ((TextBox)(FormView2.FindControl("OnlineQuoteIDLabel1"))).Text;
                }
            }
            else
            {
                if (strStatusID == "8")
                {
                    string myScript = "\n<script type=\"text/javascript\" language=\"Javascript\" id=\"EventScriptBlock\">\n";
                    myScript += "alert('Job status is now Referenced. It is highly recommended to ask this customer to write us a review in Angies List.'); ";
                    myScript += "\n\n </script>";
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "myKey", myScript, false);
                }
            }
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            /*
            Literal txtUserJob = (Literal)FormView2.FindControl("UserJobNoLabel");
                 if (String.IsNullOrEmpty(txtUserJob.Text))
                 {
                     string query = "UPDATE tblOnlineQuotes SET UserJobNo = " + (Convert.ToInt32(((Literal)FormView2.FindControl("OnlineQuoteIDLabel")).Text) + 331) + " WHERE OnlineQuoteID = " + Request.QueryString["OnlineQuoteID"];
                     string connect = SqlDataSource2.ConnectionString;
                     OleDbConnection conn = new OleDbConnection(connect);
                     OleDbCommand cmd = new OleDbCommand(query, conn);
                     conn.Open();
                     cmd.ExecuteNonQuery();
                     conn.Close();
                 }
             * */
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            /*
            TextBox txtUserJob = (TextBox)FormView2.FindControl("UserJobNoTextBox");
            if (String.IsNullOrEmpty(txtUserJob.Text))
            {
                string query = "UPDATE tblOnlineQuotes SET UserJobNo = " + (Convert.ToInt32(((Literal)FormView2.FindControl("OnlineQuoteIDLabel1")).Text) + 331) + " WHERE OnlineQuoteID = " + Request.QueryString["OnlineQuoteID"];
                string connect = SqlDataSource2.ConnectionString;
                OleDbConnection conn = new OleDbConnection(connect);
                OleDbCommand cmd = new OleDbCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
             */
        }

        protected string FindEditControl(string ControlID)
        {
            string ControlName = string.Empty;
            if (FormView2.CurrentMode == FormViewMode.Edit)
                ControlName = FormView2.FindControl(ControlID).ClientID;
            else
                ControlName = FormView2.FindControl("TrushControlTextBox").ClientID; 

            return ControlName;
        }

        protected void FormView2_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            strStatusID = ((DropDownList)FormView2.FindControl("DropDownList5")).SelectedValue;
            string strOnlineQuoteID = Session["OnlineQuoteID"].ToString();

            if (strStatusID == "6")
            {
                CreateUpdateGoogleInstallCalendar(strOnlineQuoteID);
            }
            else if (strStatusID == "8")
            {
                if (Request.Form["confirm_value"] == "Yes")
                {
                    SendAngiesListReviewRequest();
                }
            }
            
            switch(strStatusID)
            {
                case "1":
                case "2":
                case "3":
                case "4":
                case "5":
                case "9":
                case "10": Nito.AspNetBackgroundTasks.BackgroundTaskManager.Run(() =>
                            {
                                Thread obj = new Thread(() => deleteSalesTotalJob(strOnlineQuoteID));
                                obj.IsBackground = true;
                                obj.Start();
                            });                
                    break;
                case "6":
                case "7":
                case "8": Nito.AspNetBackgroundTasks.BackgroundTaskManager.Run(() =>
                            {
                                Thread obj = new Thread(() => addSalesTotalJob(strOnlineQuoteID));
                                obj.IsBackground = true;
                                obj.Start();                                
                            });                 
                    break;
            }

        }

        protected void CreateUpdateGoogleInstallCalendar(string strOnlineQuoteID)
        {          
            List<GoogleCalendarAppointmentModel> GoogleCalendarAppointmentModelList = new List<GoogleCalendarAppointmentModel>();
            GoogleCalendarAppointmentModel GoogleCalendarAppointmentModelObj = new GoogleCalendarAppointmentModel();

            //vars for Install email notification
            string var_ToEmail = String.Empty;
            string var_ToName = String.Empty;
            string var_InstallDate = String.Empty;
            string var_stone = String.Empty;
            string var_edge = String.Empty;
            string var_sink = String.Empty;

            #region populate GoogleAppointment values

            //Retrieve Granite/SF info
            string query2 = "SELECT SlabColorName AS SLABNAME, str(SF) + 'sf ) ' AS SFVAL FROM SummaryStoneQry WHERE OnlineQuoteID = " + strOnlineQuoteID;
            string connect2 = SqlDataSource2.ConnectionString;
            OleDbConnection conn2 = new OleDbConnection(connect2);
            OleDbCommand cmd2 = new OleDbCommand(query2, conn2);
            conn2.Open();
            OleDbDataReader JobInfoDataReader2 = cmd2.ExecuteReader();

            int c=1;
            while (JobInfoDataReader2.Read())
            {
                if (c < 2)
                {
                    if (!String.IsNullOrEmpty(JobInfoDataReader2.GetValue(1).ToString()))
                    {
                        GoogleCalendarAppointmentModelObj.EventDetails += "STONE: (" + JobInfoDataReader2.GetValue(1).ToString() + JobInfoDataReader2.GetValue(0).ToString();
                        var_stone += "(" + JobInfoDataReader2.GetValue(1).ToString() + JobInfoDataReader2.GetValue(0).ToString();
                    }
                }
                else
                {
                    GoogleCalendarAppointmentModelObj.EventDetails += "," + JobInfoDataReader2.GetValue(1).ToString() + JobInfoDataReader2.GetValue(0).ToString();
                    var_stone += "<br / >(" + JobInfoDataReader2.GetValue(1).ToString() + JobInfoDataReader2.GetValue(0).ToString();
                }
                c++;
            }
            JobInfoDataReader2.Close();
            conn2.Close();

            string strCurrentEdge = ((DropDownList)FormView2.FindControl("EdgeDropDownList1")).SelectedItem.Text;
            GoogleCalendarAppointmentModelObj.EventDetails += !String.IsNullOrEmpty(strCurrentEdge) ? " | EDGE: " + strCurrentEdge : String.Empty;
            var_edge = strCurrentEdge;
            //;

            //Retrieve Sink info
            string query5 = "SELECT SinkName, Quantity FROM SummarySinksQry WHERE OnlineQuoteID = " + strOnlineQuoteID;
            string connect5 = SqlDataSource2.ConnectionString;
            OleDbConnection conn5 = new OleDbConnection(connect5);
            OleDbCommand cmd5 = new OleDbCommand(query5, conn5);
            conn5.Open();
            OleDbDataReader JobInfoDataReader5 = cmd5.ExecuteReader();

            int c5 = 1;
            while (JobInfoDataReader5.Read())
            {
                if (c5 < 2)
                {
                    if (!String.IsNullOrEmpty(JobInfoDataReader5.GetValue(1).ToString()))
                    {
                        GoogleCalendarAppointmentModelObj.EventDetails += " | SINK: " + JobInfoDataReader5.GetValue(1).ToString() + " " + JobInfoDataReader5.GetValue(0).ToString();
                        var_sink += "( " + JobInfoDataReader5.GetValue(1).ToString() + " ) " + JobInfoDataReader5.GetValue(0).ToString();
                    }
                }
                else
                {
                    GoogleCalendarAppointmentModelObj.EventDetails += ", " + JobInfoDataReader5.GetValue(1).ToString() + " " + JobInfoDataReader5.GetValue(0).ToString();
                    var_sink += "<br />( " + JobInfoDataReader5.GetValue(1).ToString() + " ) " + JobInfoDataReader5.GetValue(0).ToString();
                }
                c5++;
            }
            JobInfoDataReader5.Close();
            conn5.Close();
           

            //Retrieve Customer Install Info
            string query1 = "SELECT CustomerFirstName + ' ' + CustomerLastName AS CustomerName, Address + ', ' + City + ', ' + State  AS InstallAddress, "
                + " InstallDate, InstallTime, Notes, ZipCode, Email  FROM tblOnlineQuotes WHERE OnlineQuoteID = " + strOnlineQuoteID;
            string connect1 = SqlDataSource2.ConnectionString;
            OleDbConnection conn1 = new OleDbConnection(connect1);
            OleDbCommand cmd1 = new OleDbCommand(query1, conn1);
            conn1.Open();
            OleDbDataReader JobInfoDataReader = cmd1.ExecuteReader();

            while (JobInfoDataReader.Read())
            {
                GoogleCalendarAppointmentModelObj.EventID = strOnlineQuoteID;
                GoogleCalendarAppointmentModelObj.EventTitle = JobInfoDataReader.GetString(0) + " Install";
                var_ToName = JobInfoDataReader.GetString(0);
                GoogleCalendarAppointmentModelObj.EventStartTime = DateTime.Parse(JobInfoDataReader.GetDateTime(2).ToShortDateString()).AddHours(-2);
                string strInstallTime = JobInfoDataReader.GetValue(3).ToString();
                var_InstallDate = (GoogleCalendarAppointmentModelObj.EventStartTime.AddDays(1)).ToLongDateString() + " " + strInstallTime;                
                GoogleCalendarAppointmentModelObj.EventEndTime = GoogleCalendarAppointmentModelObj.EventStartTime.AddHours(2);
                //Giving the proper location so you can view on the map in google calendar
                GoogleCalendarAppointmentModelObj.EventLocation = JobInfoDataReader.GetValue(1).ToString() + " " + JobInfoDataReader.GetValue(5).ToString();
                GoogleCalendarAppointmentModelObj.EventDetails += !String.IsNullOrEmpty(JobInfoDataReader.GetValue(3).ToString()) ? " | INSTALL TIME: " + strInstallTime : String.Empty;
                GoogleCalendarAppointmentModelObj.EventDetails += !String.IsNullOrEmpty(JobInfoDataReader.GetValue(4).ToString()) ? " | NOTES: " + JobInfoDataReader.GetValue(4).ToString() : String.Empty;
                var_ToEmail = JobInfoDataReader.GetString(6);
            }
            JobInfoDataReader.Close();
            conn1.Close();
            
            GoogleCalendarAppointmentModelList.Add(GoogleCalendarAppointmentModelObj);
            #endregion

            #region Add event to google calendar

            //if (((bool)Session["DisableCalendarUpdate"]) == false)
            //{
            //    if (GoogleCalendarManager.AddUpdateDeleteEvent(GoogleCalendarAppointmentModelList, 0) == true)
            //    {
            //        //LblMessage.Text = "Event Created / updated successfully. Go to <a href='https://www.google.com/calendar/' target='blank'>Google Calendar</a> to view your event ";
            //        //BtnDeleteEvent.Enabled = true;
            //    }
            //}
          
            if (Request.Form["confirm_value"] == "Yes")
            {
                SendInstallEmail(var_ToEmail, var_ToName, var_InstallDate, var_stone, var_edge, var_sink);
            }

            #endregion
        }

        protected void DeleteGoogleInstallCalendar(string strOnlineQuoteID)
        {
            List<GoogleCalendarAppointmentModel> GoogleCalendarAppointmentModelList = new List<GoogleCalendarAppointmentModel>();
            GoogleCalendarAppointmentModel GoogleCalendarAppointmentModelObj = new GoogleCalendarAppointmentModel();

            #region populate GoogleAppointment values
            GoogleCalendarAppointmentModelObj.EventID = strOnlineQuoteID;
            GoogleCalendarAppointmentModelObj.DeleteAppointment = true;
            GoogleCalendarAppointmentModelList.Add(GoogleCalendarAppointmentModelObj);
            #endregion

                if (GoogleCalendarManager.AddUpdateDeleteEvent(GoogleCalendarAppointmentModelList, 0) == true)
                {
                    //LblMessage.Text = "Event deleted successfully. Go to <a href='https://www.google.com/calendar/' target='blank'>Google Calendar</a> to view your event ";
                    //BtnDeleteEvent.Enabled = false;
                }
        }

        private void SendInstallEmail(string var_ToEmail, string var_ToName, string var_InstallDate, string var_stone, string var_edge, string var_sink)
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress("webform@granitesouthlake.com");

            message.IsBodyHtml = true;

            // Proper Authentication Details need to be passed when sending email from gmail
            System.Net.NetworkCredential mailAuthentication = new
                System.Net.NetworkCredential("webform@granitesouthlake.com", "2*****e");

            // Smtp Mail server of Gmail is "smpt.gmail.com" and it uses port no. 587
            // For different server like yahoo this details changes and you can
            // Get it from respective server.
            System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient("smtp.granitesouthlake.com", 587);

            // Enable SSL
            //mailClient.EnableSsl = true;
            mailClient.UseDefaultCredentials = false;
            mailClient.Credentials = mailAuthentication;

            //add accounts to notify
            message.To.Add(new MailAddress(var_ToEmail));
            message.To.Add(new MailAddress("webmaster@granitesouthlake.com"));
            message.To.Add(new MailAddress("dhitt0327@gmail.com"));
            message.ReplyToList.Add(new MailAddress("dhitt0327@gmail.com "));
            message.ReplyToList.Add(new MailAddress("rlowman64@gmail.com"));

            message.Subject = "[DFW Wholesale Granite] - Install Job Verification";
            System.Text.StringBuilder builder = new System.Text.StringBuilder();
            builder.AppendLine("<html><body><div marginwidth=\"0\" marginheight=\"0\" style=\"margin:0;padding:20px 0 20px 0;text-align:center;background-color:#b84d45\">");
            builder.AppendLine("<center><table border=\"0\" cellpadding=\"20\" cellspacing=\"0\" height=\"100%\" width=\"100%\" style=\"background-color:#b84d45\">");
            builder.AppendLine("<tbody><tr><td align=\"center\" valign=\"top\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"640\" style=\"border-radius:6px;background-color:none\">");
            builder.AppendLine("<tbody><tr><td align=\"center\" valign=\"top\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"640\">");
            builder.AppendLine("<tbody><tr><td><div style=\"text-align:center\"><img src=\"http://www.granitesouthlake.com/images/logo.png\" alt=\"\" border=\"0\" /></div>");
            builder.AppendLine("</td></tr></tbody></table> </td> </tr>");
            builder.AppendLine("<tr><td align=\"center\" valign=\"top\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"640\" style=\"border-radius:6px;background-color:#ffffff\">");
            builder.AppendLine("<tbody><tr><td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, Tahoma, sans-serif;font-size:small;line-height:150%;color:#333333;padding:20px\"><div style=\"display:block;\">");
            builder.AppendLine("<p>Dear <strong>" + var_ToName + "</strong>,</p>");
            builder.AppendLine("<p>Your Counter Tops are scheduled for install on " + var_InstallDate + ". ");
            builder.AppendLine("Please review the following items to confirm that we have the correct components for your job:</p>");
            builder.AppendLine("<table style=\"width: 90%;border-collapse:collapse;font-family:'Helvetica',Arial,sans-serif;font-size:small;\">");
            builder.AppendLine("<tr><td style=\"border: 1px solid black;width: 20%;vertical-align: top;\">Stone:</td>");
            builder.AppendLine("<td style=\"border: 1px solid black; vertical-align: top;\">" + var_stone + "</td></tr>");
            builder.AppendLine("<tr><td style=\"border: 1px solid black;vertical-align: top;\">Edge:</td>");
            builder.AppendLine("<td style=\"border: 1px solid black;vertical-align: top;\">" + var_edge + "</td></tr>");
            builder.AppendLine("<tr><td style=\"border: 1px solid black;vertical-align: top;\">Sink:</td>");
            builder.AppendLine("<td style=\"border: 1px solid black;vertical-align: top;\">" + var_sink + "</td></tr></table>");
            builder.AppendLine("<p>Kindly reply to this email promptly and confirm that the above items are correct. We do not cut the slabs until we receive your confirmation email.</p>");
            builder.AppendLine("<p>Please take a moment to read below the things you need to know about this install job.</p>");
            builder.AppendLine("<p>Thank you,</p>");
            builder.AppendLine("<p>-<strong> Dave</strong><br><em><a style=\"color:inherit;text-decoration:none\" href=\"tel:8173003298\">817-300-3298</a><br><a style=\"color:inherit;text-decoration:none\" href=\"tel:8172315153\">817-231-5153</a></em><br>");
            builder.AppendLine("<a href=\"mailto:info@granitesouthlake.com\" style=\"color:black;text-decoration:none;\">info@granitesouthlake.com</a></p>");
            builder.AppendLine("<div style=\"border:1px solid #a1a1a1;padding:5px 20px; background:#dddddd;border-radius:25px; font-family:'Helvetica',Arial,sans-serif; font-size:small;\">");
            builder.AppendLine("<p style=\"text-align:center;\"><strong>What you need to know about the Install</strong></p><p><strong><em>Preparations by you: </em></strong></p><ul>");
            builder.AppendLine("<li>Have the area underneath the sink area cleaned out</li>");
            builder.AppendLine("<li>Have your new faucet on site on day of install </li>");
            builder.AppendLine("<li>If you are purchasing a new stove top, have it on site for install</li>");
            builder.AppendLine("<li>If you are providing the sink(s) we need sink 3 days prior to install date</li>");
            builder.AppendLine("<li>Please keep pets and children clear of the work area. It is dangerous</li>");
            builder.AppendLine("<li style=\"color:red;font-size:medium;\">Please be on-site at job completion for inspection</li></ul>");
            builder.AppendLine("<p><strong><em>What we do: </em></strong></p><ul>");
            builder.AppendLine("<li>We will call you the evening prior to install with arrival time</li>");
            builder.AppendLine("<li>If you have paid for tear out. We will tear out old counters and dispose of them</li>");
            builder.AppendLine("<li>We will remove old garbage disposal and sink</li>");
            builder.AppendLine("<li>We install new counters</li>");
            builder.AppendLine("<li>We attach sink to counter and drill faucet holes</li>");
            builder.AppendLine("<li>We seal the counters</li>");
            builder.AppendLine("<li>We answer any questions you may have about care and maintenance of your counters</li></ul>");
            builder.AppendLine("<p><strong><em>What we do not do: </em></strong></p><ul>");
            builder.AppendLine("<li>We are not licensed to do plumbing, electrical, or carpentry work</li>");
            builder.AppendLine("<li>You will be responsible for plumbing your sinks</li>");
            builder.AppendLine("<li>You will be responsible for any trim work and painting if necessary</li>");
            builder.AppendLine("<li>If you elect to keep your existing tile backsplash the tile may be damaged or may not exactly fit your new counters. In most cases this is not a problem. You are responsible for any necessary repairs and grouting</li>");
            builder.AppendLine("<li>We cannot install stone on days with heavy rain or icy conditions. If this occurs you will be rescheduled</li></ul>");
            builder.AppendLine("</div></div><br /></td></tr></tbody></table></td></tr><tr><td align=\"center\" valign=\"top\"></td></tr></tbody></table></td></tr></tbody></table></center></div></body></html>");

            //message.Body = builder.ToString();

            AlternateView altView = AlternateView.CreateAlternateViewFromString(builder.ToString(), null, System.Net.Mime.MediaTypeNames.Text.Html);
            message.AlternateViews.Add(altView);

            try
            {
                mailClient.Send(message);
                string myScript = "\n<script type=\"text/javascript\" language=\"Javascript\" id=\"EventScriptBlock\">\n";
                myScript += "alert('Install Verification email has been successfully sent to " + var_ToEmail + ".'); ";
                myScript += "\n\n </script>";
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "myKey", myScript, false);

            }
            catch (Exception ex)
            {
                string myScript = "\n<script type=\"text/javascript\" language=\"Javascript\" id=\"EventScriptBlock\">\n";
                myScript += "alert('Failed to send Install Email Verification. Please try again later.'); ";
                myScript += "\n\n </script>";
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "myKey", myScript, false);
            }

        }

        private void SendAngiesListReviewRequest()
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress("webform@granitesouthlake.com");

            message.IsBodyHtml = true;

            // Proper Authentication Details need to be passed when sending email from gmail
            System.Net.NetworkCredential mailAuthentication = new
                System.Net.NetworkCredential("webform@granitesouthlake.com", "2******e");

            // Smtp Mail server of Gmail is "smpt.gmail.com" and it uses port no. 587
            // For different server like yahoo this details changes and you can
            // Get it from respective server.
            System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient("smtp.granitesouthlake.com", 587);

            // Enable SSL
            //mailClient.EnableSsl = true;
            mailClient.UseDefaultCredentials = false;
            mailClient.Credentials = mailAuthentication;

            string strToName = String.Empty;
            string strToEmail = String.Empty;
            string query2 = "Select CustomerFirstName, Email from tblOnlineQuotes where OnlineQuoteID = " + Session["OnlineQuoteID"].ToString();
            string connect2 = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\\DFWwebsiteDB.accdb;Persist Security Info=True";
            OleDbConnection conn2 = new OleDbConnection(connect2);
            OleDbCommand cmd2 = new OleDbCommand(query2, conn2);
            conn2.Open();
            OleDbDataReader CustomerDataReader = cmd2.ExecuteReader();
            while (CustomerDataReader.Read())
            {
                strToName += CustomerDataReader.GetString(0);
                strToEmail += CustomerDataReader.GetString(1);
            }
            CustomerDataReader.Close();
            conn2.Close();

            //add accounts to notify
            message.To.Add(new MailAddress(strToEmail));
            message.ReplyToList.Add(new MailAddress("dhitt0327@gmail.com"));

            message.Subject = "[DFW Wholesale Granite] - Angie's List Review Request";
            System.Text.StringBuilder builder = new System.Text.StringBuilder();
            builder.AppendLine("<html><body><div style=\"padding:15px;background-color: #F8F8F8; font-family: Georgia, \"Times New Roman\", Times, serif; font-size: large;\">");
            builder.AppendLine("<img src=\"cid:YourPictureId\" /><p>Thank you " + strToName + " for choosing <strong>");
            builder.AppendLine("<a href=\"http://www.granitesouthlake.com\" target=\"_blank\" style=\"color:black;text-decoration:none;\">");
            builder.AppendLine("DFW Wholesale Granite</a></strong> for your project. We appreciate your business. ");
            builder.AppendLine("Please tell us how we did by clicking the link below to evaluate our performance.</p>	");
            builder.AppendLine("<div style=\"border:2px solid #a1a1a1;padding:10px 40px; background:#dddddd;border-radius:25px;font-size:xx-large\">");
            builder.AppendLine("<a href=\"http://www.angieslist.com/AngiesList/Review/7863610\" target=\"_blank\" style=\"color:black;text-decoration:none;\">");
            builder.AppendLine("AngiesList.com / Review / 7863610</a></div>");
            builder.AppendLine("<p>We use Angie's List to assess whether we're doing a good job keeping valued customers like you, happy. ");
            builder.AppendLine("Again, please visit <a href=\"http://www.angieslist.com/AngiesList/Review/7863610\" target=\"_blank\">AngiesList.com</a> ");
            builder.AppendLine("in order to grade our quality of work and customer service.</p>	");
            builder.AppendLine("<p>-<strong> Dave</strong><br><em>817-231-5153<br>817-300-3298</em><br>");
            builder.AppendLine("<a href=\"mailto:info@granitesouthlake.com\" style=\"color:black;text-decoration:none;\">info@granitesouthlake.com</a></p></div></body></html>");


            //message.Body = builder.ToString();

            AlternateView altView = AlternateView.CreateAlternateViewFromString(builder.ToString(), null, System.Net.Mime.MediaTypeNames.Text.Html);

            LinkedResource yourPictureRes = new LinkedResource(Server.MapPath("/images/allogo.gif"), System.Net.Mime.MediaTypeNames.Image.Gif);
            yourPictureRes.ContentId = "YourPictureId";
            altView.LinkedResources.Add(yourPictureRes);

            message.AlternateViews.Add(altView);

            try
            {
                mailClient.Send(message);
                string myScript = "\n<script type=\"text/javascript\" language=\"Javascript\" id=\"EventScriptBlock\">\n";
                myScript += "alert('Angies List Review Request was successfuly sent.'); ";
                myScript += "\n\n </script>";
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "myKey", myScript, false);
            }
            catch (Exception ex)
            {
                //Response.Write("Failed to send Angie's List Customer Review Request email. Please try again later.");
                string myScript = "\n<script type=\"text/javascript\" language=\"Javascript\" id=\"EventScriptBlock\">\n";
                myScript += "alert('An error had occured. Angies List Review Request Sending failed.'); ";
                myScript += "\n\n </script>";
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "myKey", myScript, false);
            }

        }

        protected void btnReturnToQuote_Click(object sender, EventArgs e)
        {
            //Response.Redirect("/admin/EditJob.aspx?OnlineQuoteID=" + Session["OnlineQuoteID"].ToString() + "?Checked=JobInfo");
            Response.Redirect("/admin/EditJob.aspx?OnlineQuoteID=" + Session["OnlineQuoteID"].ToString());
        }

        private void addSalesTotalJob(string OnlineQuoteID)
        {
            deleteSalesTotalJob(OnlineQuoteID);
            string query = "INSERT INTO SalesTotalJobsTbl ( OnlineQuoteID, CustomerName, LeadID, Lead, StatusID, InstallDate, SlabColorID, TotalG, TotalGP, TotalServices, TotalSink, TotalJob, QuoteWithGranite, InstallYear, InstallMonth, InstallMonthName, TotSlabsSum, WorkOrderSum, GrossProfit, TotalSF, TotalNSlab, TotalGrossProfit ) " +
                " SELECT OnlineQuoteID, CustomerName, LeadID, Lead, StatusID, InstallDate, SlabColorID, TotalG, TotalGP, TotalServices, TotalSink, TotalJob, QuoteWithGranite, InstallYear, InstallMonth, InstallMonthName, TotSlabsSum, WorkOrderSum, GrossProfit, TotalSF, TotalNSlab, TotalGrossProfit " +
                " FROM SalesTotalJobsQry WHERE OnlineQuoteID=" + OnlineQuoteID;
            using (OleDbConnection conn = new OleDbConnection(SqlDataSource2.ConnectionString))
            {
                using (OleDbCommand cmd = new OleDbCommand(query, conn))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private void deleteSalesTotalJob(string OnlineQuoteID)
        {
            string query = "DELETE FROM SalesTotalJobsTbl WHERE OnlineQuoteID=" + OnlineQuoteID;
            using (OleDbConnection conn = new OleDbConnection(SqlDataSource2.ConnectionString))
            {
                using (OleDbCommand cmd = new OleDbCommand(query, conn))
                {
                    conn.Open();
                    try
                    {
                        cmd.ExecuteNonQuery();
                    }
                    catch
                    {
                        throw;
                    }
                   
                }
            }
        }



    }
}