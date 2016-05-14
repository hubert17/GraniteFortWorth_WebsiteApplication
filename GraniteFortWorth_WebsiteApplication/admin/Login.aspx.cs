using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Web.Security;

namespace GraniteFortWorth_WebsiteApplication.admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Abandon();
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            if (PasswordTextBox.Text == (UsernameTextBox.Text + hfRP.Value))
            {
                try
                {
                    ResetInvalidLoginAttempts();
                    LoginMessageLabel.Text = "You can now login with your valid username and password.";
                }
                catch (Exception ex)
                {
                    LoginMessageLabel.Text = "User not found.";
                    return;
                }
            }
            else
            {

                string connect = SqlDataSource1.ConnectionString;
                OleDbConnection conn = new OleDbConnection(connect);

                string query = "Select count(*) from tblUsers WHERE UserName = '" + UsernameTextBox.Text + "' AND UserPassword= '" + PasswordTextBox.Text + "' AND Inactive=false";
                //connect = SqlDataSource1.ConnectionString;
                OleDbCommand cmd = new OleDbCommand(query, conn);
                conn.Open();
                int intResult;
                try
                {
                    intResult = Convert.ToInt16(Convert.ToString(cmd.ExecuteScalar()));
                }
                catch (Exception ex)
                {
                    intResult = 0;
                    LoginMessageLabel.Text = "User not found.";
                }
                conn.Close();

                if (intResult > 0)
                    ValidLogin();
                else
                    InvalidLogin();
            }
        }

        protected void ValidLogin()
        {
            string query3 = "UPDATE tblUsers SET InvalidLoginAttempts=0, LastSuccessfulLogin=#" + DateTime.Now.ToString() + "#  WHERE UserName = '" + UsernameTextBox.Text + "'";
            string connect3 = SqlDataSource1.ConnectionString;
            OleDbConnection conn3 = new OleDbConnection(connect3);
            OleDbCommand cmd3 = new OleDbCommand(query3, conn3);
            conn3.Open();
            cmd3.ExecuteNonQuery();
            conn3.Close();

            FormsAuthentication.RedirectFromLoginPage(UsernameTextBox.Text, PersistCheckBox.Checked);
        }

        protected void InvalidLogin()
        {
            string query0 = "Select InvalidLoginAttempts from tblUsers WHERE UserName = '" + UsernameTextBox.Text + "'";
            string connect0 = SqlDataSource1.ConnectionString;
            OleDbConnection conn0 = new OleDbConnection(connect0);
            OleDbCommand cmd0 = new OleDbCommand(query0, conn0);
            conn0.Open();
            int intResult0;
            try
            {
                intResult0 = Convert.ToInt16(Convert.ToString(cmd0.ExecuteScalar()));
            }
            catch (Exception ex)
            {
                intResult0 = 0;
                LoginMessageLabel.Text = "Invalid username and/or password.";
            }
            conn0.Close();

            if (intResult0 <= 3)
            {
                string query1 = "UPDATE tblUsers SET InvalidLoginAttempts=" + (intResult0 + 1) + " WHERE UserName = '" + UsernameTextBox.Text + "'";
                string connect1 = SqlDataSource1.ConnectionString;
                OleDbConnection conn1 = new OleDbConnection(connect1);
                OleDbCommand cmd1 = new OleDbCommand(query1, conn1);
                conn1.Open();
                cmd1.ExecuteNonQuery();
                conn1.Close();
            }
            else
            {
                string query5 = "UPDATE tblUsers SET Inactive=true WHERE UserName = '" + UsernameTextBox.Text + "'";
                string connect5 = SqlDataSource1.ConnectionString;
                OleDbConnection conn5 = new OleDbConnection(connect5);
                OleDbCommand cmd5 = new OleDbCommand(query5, conn5);
                conn5.Open();
                cmd5.ExecuteNonQuery();
                conn5.Close();
            }

            LoginMessageLabel.Text = "Invalid username and/or password.";
        }

        protected void ResetInvalidLoginAttempts()
        {
            string query4 = "UPDATE tblUsers SET InvalidLoginAttempts=0, Inactive=false WHERE UserName = '" + UsernameTextBox.Text + "'";
            string connect4 = SqlDataSource1.ConnectionString;
            OleDbConnection conn4 = new OleDbConnection(connect4);
            OleDbCommand cmd4 = new OleDbCommand(query4, conn4);
            conn4.Open();
            cmd4.ExecuteNonQuery();
            conn4.Close();
        }
    }
}