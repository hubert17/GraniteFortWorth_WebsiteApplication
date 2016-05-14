using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Text;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    /// <summary>
    /// Summary description for HandlerTaskDateSearch
    /// </summary>
    public class HandlerTaskDateSearch : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string prefixText = context.Request.QueryString["q"];
            using (OleDbConnection conn = new OleDbConnection())
            {
                conn.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\\DFWwebsiteDB.accdb;Persist Security Info=True";
                using (OleDbCommand cmd = new OleDbCommand())
                {
                    cmd.CommandText = "SELECT Format(TaskDateIns, 'm/dd/yyyy\') AS InstallDate FROM StatusReportNoGraniteQry WHERE (StatusID = 1 OR StatusID = 2 OR StatusID = 6 OR StatusID = 4 OR StatusID = 3) AND (Format(TaskDateIns, 'm/dd/yyyy\') LIKE ? + '%') GROUP BY Format(TaskDateIns, 'm/dd/yyyy\')";
                    cmd.Parameters.AddWithValue("TaskDate", prefixText);
                    cmd.Connection = conn;
                    StringBuilder sb = new StringBuilder();
                    conn.Open();
                    using (OleDbDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            sb.Append(sdr["InstallDate"])
                                .Append(Environment.NewLine);
                        }
                    }
                    conn.Close();
                    context.Response.Write(sb.ToString());
                }
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}