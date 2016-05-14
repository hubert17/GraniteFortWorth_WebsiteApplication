// Google Calendar Integration in ASP.NET: Create / Edit / Delete events by m.waqasiqbal
// http://www.codeproject.com/Articles/565032/Google-Calendar-Integration-in-ASP-NET-Create-ed
// Rewritten for Google Calendar API v3 by Hewbert Gabon

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;

using System.Security.Cryptography.X509Certificates;
using System.IO;
using System.Threading;
using Google.Apis.Calendar.v3;
using Google.Apis.Calendar.v3.Data;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Auth.OAuth2.Flows;
using Google.Apis.Auth.OAuth2.Web;
using Google.Apis.Services;
using Google.Apis.Util.Store;




public class GoogleCalendarManager
{
        private static string calID = System.Configuration.ConfigurationManager.AppSettings["GoogleInstallCalendarID"].ToString();
        private static string UserId = System.Web.HttpContext.Current.User.Identity.Name;
        private static string gFolder = System.Web.HttpContext.Current.Server.MapPath("/App_Data/MyGoogleStorage");

        private const string serviceAccountEmail = "18000002748-lgvaqpgngr0nmdhbj2kg9hlte21kdbpb@developer.gserviceaccount.com ";
        private const string SERVICE_ACCOUNT_PKCS12_FILE_PATH = @"\DFW Install Calendar ASP Project-23c0f7ffdd25.p12";

  /// <summary>
  /// Build a Drive service object authorized with the service account
  /// that acts on behalf of the given user.
  /// </summary>
  /// @param userEmail The email of the user.
  /// <returns>Drive service object.</returns>
        static CalendarService GetCalendarService_sa()
        {
            var certificate = new X509Certificate2(gFolder + SERVICE_ACCOUNT_PKCS12_FILE_PATH, "notasecret", X509KeyStorageFlags.Exportable);

            ServiceAccountCredential credential = new ServiceAccountCredential(
               new ServiceAccountCredential.Initializer(serviceAccountEmail)
               {
                   Scopes = new[] { CalendarService.Scope.Calendar }
               }.FromCertificate(certificate));

            // Create the service.
            var service = new CalendarService(new BaseClientService.Initializer()
            {
                HttpClientInitializer = credential,
                ApplicationName = "DFW Install Calendar",
            });

            return service;
        }

        public static CalendarService GetCalendarService()
        {
            CalendarService service = null;

            IAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow(
                new GoogleAuthorizationCodeFlow.Initializer
                {
                    ClientSecrets = GetClientConfiguration().Secrets,
                    DataStore = new FileDataStore(gFolder),
                    Scopes = new[] { CalendarService.Scope.Calendar }
                });

            var uri = System.Web.HttpContext.Current.Request.Url.ToString();
            var code = System.Web.HttpContext.Current.Request["code"];
            if (code != null)
            {
                var token = flow.ExchangeCodeForTokenAsync(UserId, code,
                    uri.Substring(0, uri.IndexOf("?")), CancellationToken.None).Result;

                // Extract the right state.
                var oauthState = AuthWebUtility.ExtracRedirectFromState(
                    flow.DataStore, UserId, System.Web.HttpContext.Current.Request["state"]).Result;
                System.Web.HttpContext.Current.Response.Redirect(oauthState);
            }
            else
            {
                var result = new AuthorizationCodeWebApp(flow, uri, uri).AuthorizeAsync(UserId,
                    CancellationToken.None).Result;
                if (result.RedirectUri != null)
                {
                    // Redirect the user to the authorization server.
                    //System.Web.HttpContext.Current.Response.Redirect(result.RedirectUri);     
                    var page = System.Web.HttpContext.Current.CurrentHandler as Page;
                    page.ClientScript.RegisterClientScriptBlock(page.GetType(),
                        "RedirectToGoogleScript", "window.top.location = '" + result.RedirectUri + "'", true);
                }
                else
                {
                    // The data store contains the user credential, so the user has been already authenticated.
                    service = new CalendarService(new BaseClientService.Initializer
                    {
                        ApplicationName = "DFW Install Calendar ASP.NET",
                        HttpClientInitializer = result.Credential
                    });
                }
            }

            return service;
        }

        public static GoogleClientSecrets GetClientConfiguration()
        {
            using (var stream = new FileStream(gFolder + @"\client_secrets.json", FileMode.Open, FileAccess.Read))
            {
                return GoogleClientSecrets.Load(stream);
            }
        }

        public static bool AddUpdateDeleteEvent(List<GoogleCalendarAppointmentModel> GoogleCalendarAppointmentModelList, double TimeOffset)
        {           
            //Get the calendar service for a user to add/update/delete events
            CalendarService calService = GetCalendarService();

            if (GoogleCalendarAppointmentModelList != null && GoogleCalendarAppointmentModelList.Count > 0)
            {
                foreach (GoogleCalendarAppointmentModel GoogleCalendarAppointmentModelObj in GoogleCalendarAppointmentModelList)
                {
                    EventsResource er = new EventsResource(calService);
                    string ExpKey = "EventID";
                    string ExpVal = GoogleCalendarAppointmentModelObj.EventID;

                    var queryEvent = er.List(calID);
                    queryEvent.SharedExtendedProperty = ExpKey + "=" + ExpVal; //"EventID=9999"
                    var EventsList = queryEvent.Execute();

                    //to restrict the appointment for specific staff only
                    //Delete this appointment from google calendar
                    if (GoogleCalendarAppointmentModelObj.DeleteAppointment == true)
                    {
                        string FoundEventID = String.Empty;
                        foreach (Event evItem in EventsList.Items)
                        {
                            FoundEventID = evItem.Id;
                            if (!String.IsNullOrEmpty(FoundEventID))
                            {
                                er.Delete(calID, FoundEventID).Execute();
                            }
                        }
                        return true;
                    }
                    //Add if not found OR update if appointment already present on google calendar
                    else
                    {
                        Event eventEntry = new Event();

                        EventDateTime StartDate = new EventDateTime();
                        EventDateTime EndDate = new EventDateTime();
                        StartDate.Date = GoogleCalendarAppointmentModelObj.EventStartTime.AddDays(1).ToString("yyyy-MM-dd"); //"2014-11-17";
                        EndDate.Date = StartDate.Date; //GoogleCalendarAppointmentModelObj.EventEndTime

                        //Always append Extended Property whether creating or updating event
                        Event.ExtendedPropertiesData exp = new Event.ExtendedPropertiesData();
                        exp.Shared = new Dictionary<string, string>();
                        exp.Shared.Add(ExpKey, ExpVal);

                        eventEntry.Summary = GoogleCalendarAppointmentModelObj.EventTitle;
                        eventEntry.Start = StartDate;
                        eventEntry.End = EndDate;
                        eventEntry.Location = GoogleCalendarAppointmentModelObj.EventLocation;
                        eventEntry.Description = GoogleCalendarAppointmentModelObj.EventDetails;
                        eventEntry.ExtendedProperties = exp;

                        string FoundEventID = String.Empty;
                        foreach (var evItem in EventsList.Items)
                        {
                            FoundEventID = evItem.Id;
                            if(!String.IsNullOrEmpty(FoundEventID))
                            {
                                //Update the event
                                er.Update(eventEntry, calID, FoundEventID).Execute();
                            }
                        }

                        if (String.IsNullOrEmpty(FoundEventID))
                        {
                            //create the event
                            er.Insert(eventEntry, calID).Execute();
                        }

                        return true;                        
                    }
                }
            }

            return false;
        }


}

