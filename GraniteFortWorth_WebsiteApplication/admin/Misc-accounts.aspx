<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Misc-accounts.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.Misc_accounts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="robots" content="noindex" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/style_iframe.css" />


<style>
    * {
        border: none;
    }
	.measure_left-rail {
		width:765px;
		float:left;
	}

    .measure-minimalist-b
    {
	    font-family: "Segoe UI", Verdana, Helvetica, Sans-Serif;
	    font-size: 1em;
	    background: #fff;
	    margin: 10px;
	    width: 765px;
	    border-collapse: collapse;
	    text-align: left;        
    }
    .measure-minimalist-b th
    {
	    font-size: 13px;
	    font-weight: normal;
	    color: #039;
	    padding: 0px 7px;
	    border-bottom: 2px solid #6678b1;
        text-align:left;
        background: #eff2ff;
    }
    .measure-minimalist-b td
    {
	    border-bottom: 1px solid #ccc;
	    color: #669;
	    padding: 0px 7px;
        text-align:left;
        height: 25px;
    }
    .measure-minimalist-b tbody tr:hover td
    {
	    color: #009;
        background: #eff2ff;
    }

        td input{
        width:207px;
    }
        td select {
        width:210px;
    }

     td span {
        color: #009;
        color: #333;
    }


    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="UserName" DataSourceID="SqlDataSource1" AllowPaging="True">
            <EditItemTemplate>
                <table class="measure-minimalist-b">
                    <tr>
                        <td>Username:</td>
                        <td>
                            <asp:Label ID="UserNameLabel1" runat="server" Text='<%# Eval("UserName") %>' />
                        </td>
                        <td>&nbsp;</td>
                        <td>Password:
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserPasswordTextBox" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="UserPasswordTextBox" runat="server" Text='<%# Bind("UserPassword") %>' TextMode="Password"  />
                        </td>
                    </tr>
                    <tr>
                        <td>Access Rights:</td>
                        <td style="margin-left: 40px">
                            <asp:DropDownList ID="AccessRightsTextBox" runat="server" SelectedValue='<%# Bind("AccessRights") %>' >
                                <asp:ListItem Value=""></asp:ListItem>
                                <asp:ListItem Value="u">User</asp:ListItem>
                                <asp:ListItem Value="s">Super User</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>&nbsp;</td>
                        <td>Retype Password:
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="RetypePasswordTextBox" ControlToValidate="UserPasswordTextBox" ErrorMessage="*" ForeColor="Red">*</asp:CompareValidator>
                        </td>
                        <td style="margin-left: 40px">
                                <asp:TextBox ID="RetypePasswordTextBox" runat="server" TextMode="Password"  />
                        </td>
                    </tr>
                    <tr>
                        <td>Last Successful Login:</td>
                        <td style="margin-left: 40px">
                            <asp:TextBox ID="LastSuccessfulLoginTextBox" runat="server" Enabled="false" Text='<%# Bind("LastSuccessfulLogin") %>' />
                        </td>
                        <td>&nbsp;</td>
                        <td>Invalid Login Attempts: </td>
                        <td style="margin-left: 40px">
                            <asp:TextBox ID="InvalidLoginAttemptsTextBox" runat="server" Enabled="false" Text='<%# Bind("InvalidLoginAttempts") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>First Name:</td>
                        <td style="margin-left: 40px">
                            <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                        </td>
                        <td>&nbsp;</td>
                        <td>Last Name:</td>
                        <td style="margin-left: 80px">
                            <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>Email:
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="EmailTextBox" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="EmailTextBox" ErrorMessage="*" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                        </td>
                        <td style="margin-left: 40px">
                            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                        </td>
                        <td>&nbsp;</td>
                        <td>Inactive: </td>
                        <td style="margin-left: 80px">&nbsp;<asp:CheckBox ID="InactiveCheckBox" runat="server" Checked='<%# Bind("Inactive") %>' />
                        </td>
                    </tr>
                </table>
                &nbsp;&nbsp;&nbsp;<asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Save" />
                &nbsp;<asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                <br />
            </EditItemTemplate>
            <InsertItemTemplate>
            <table class="measure-minimalist-b">
                    <tr>
                        <td>Username:
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="UserNameTextBox" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                        </td>
                        <td>&nbsp;</td>
                        <td>Password:
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="UserPasswordTextBox" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="UserPasswordTextBox" runat="server" Text='<%# Bind("UserPassword") %>' TextMode="Password"  />
                        </td>
                    </tr>
                    <tr>
                        <td>Access Rights:</td>
                        <td style="margin-left: 40px">
                            <asp:DropDownList ID="AccessRightsTextBox" runat="server" SelectedValue='<%# Bind("AccessRights") %>' >
                                <asp:ListItem Value=""></asp:ListItem>
                                <asp:ListItem Value="u">User</asp:ListItem>
                                <asp:ListItem Value="s">Super User</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>&nbsp;</td>
                        <td>Retype Password:
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="RetypePasswordTextBox" ControlToValidate="UserPasswordTextBox" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True">*</asp:CompareValidator>
                        </td>
                        <td style="margin-left: 40px">
                                <asp:TextBox ID="RetypePasswordTextBox" runat="server" TextMode="Password"  />
                        </td>
                    </tr>
                    <tr>
                        <td>Last Successful Login:</td>
                        <td style="margin-left: 40px">
                            <asp:TextBox ID="LastSuccessfulLoginTextBox" runat="server" Enabled="false" Text='<%# Bind("LastSuccessfulLogin") %>' />
                        </td>
                        <td>&nbsp;</td>
                        <td>Invalid Login Attempts: </td>
                        <td style="margin-left: 40px">
                            <asp:TextBox ID="InvalidLoginAttemptsTextBox" runat="server" Enabled="false" Text='<%# Bind("InvalidLoginAttempts") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>First Name:</td>
                        <td style="margin-left: 40px">
                            <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                        </td>
                        <td>&nbsp;</td>
                        <td>Last Name:</td>
                        <td style="margin-left: 80px">
                            <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>Email:
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="EmailTextBox" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="EmailTextBox" ErrorMessage="*" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                        </td>
                        <td style="margin-left: 40px">
                            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td style="margin-left: 80px">
                        </td>
                    </tr>
                </table>
                &nbsp;&nbsp;&nbsp;<asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Save" />
                &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                    <table class="measure-minimalist-b">
                    <tr>
                        <td>Username:</td>
                        <td>
                            <strong><asp:Label ID="UserNameLabel1" runat="server" Enabled="false" Text='<%# Eval("UserName") %>' /></strong>
                        </td>
                        <td>&nbsp;</td>
                         <td>Password:</td>
                        <td>
                            <asp:TextBox ID="UserPasswordTextBox" runat="server" Enabled="false" Text='<%# Bind("UserPassword") %>' TextMode="Password" />
                        </td>
                    </tr>
                    <tr>
                        <td>Access Rights:</td>
                        <td style="margin-left: 40px">
                            <asp:DropDownList ID="AccessRightsTextBox" runat="server" Enabled="false" SelectedValue='<%# Bind("AccessRights") %>' >
                                <asp:ListItem Value=""></asp:ListItem>
                                <asp:ListItem Value="u">User</asp:ListItem>
                                <asp:ListItem Value="s">Super User</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td style="margin-left: 40px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Last Successful Login:</td>
                        <td style="margin-left: 40px">
                            <asp:TextBox ID="LastSuccessfulLoginTextBox" runat="server" Enabled="false" Text='<%# Bind("LastSuccessfulLogin") %>' />
                        </td>
                        <td>&nbsp;</td>
                        <td>Invalid Login Attempts: </td>
                        <td style="margin-left: 40px">
                            <asp:TextBox ID="InvalidLoginAttemptsTextBox" runat="server" Enabled="false" Text='<%# Bind("InvalidLoginAttempts") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>First Name:</td>
                        <td style="margin-left: 40px">
                            <asp:TextBox ID="FirstNameTextBox" runat="server" Enabled="false" Text='<%# Bind("FirstName") %>' />
                        </td>
                        <td>&nbsp;</td>
                        <td>Last Name:</td>
                        <td style="margin-left: 80px">
                            <asp:TextBox ID="LastNameTextBox" runat="server" Enabled="false" Text='<%# Bind("LastName") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td style="margin-left: 40px">
                            <asp:TextBox ID="EmailTextBox" runat="server" Enabled="false" Text='<%# Bind("Email") %>' />
                        </td>
                        <td>&nbsp;</td>
                        <td>Inactive: </td>
                        <td style="margin-left: 80px">&nbsp;<asp:CheckBox ID="InactiveCheckBox" runat="server" Enabled="false" Checked='<%# Bind("Inactive") %>' />
                        </td>
                    </tr>
                </table>
                &nbsp;&nbsp;&nbsp;<asp:Button ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                <asp:Button ID="DeleteButton" runat="server" Visible="false" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:Button ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Create New" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblUsers] WHERE (([UserName] = ?) OR ([UserName] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO [tblUsers] ([UserName], [UserPassword], [AccessRights], [LastSuccessfulLogin], [InvalidLoginAttempts], [FirstName], [LastName], [Email], [Inactive]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT UserName, UserPassword, AccessRights, LastSuccessfulLogin, InvalidLoginAttempts, FirstName, LastName, Email, Inactive FROM tblUsers WHERE (UserName &lt;&gt; 'hubert17')" UpdateCommand="UPDATE tblUsers SET UserPassword = ?, AccessRights = ?, LastSuccessfulLogin = ?, InvalidLoginAttempts = ?, FirstName = ?, LastName = ?, Email = ?, Inactive = ? WHERE (UserName = ?)">
            <DeleteParameters>
                <asp:Parameter Name="UserName" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="UserPassword" Type="String" />
                <asp:Parameter Name="AccessRights" Type="String" />
                <asp:Parameter Name="LastSuccessfulLogin" Type="DateTime" />
                <asp:Parameter Name="InvalidLoginAttempts" Type="Int16" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Inactive" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserPassword" Type="String" />
                <asp:Parameter Name="AccessRights" Type="String" />
                <asp:Parameter Name="LastSuccessfulLogin" Type="DateTime" />
                <asp:Parameter Name="InvalidLoginAttempts" Type="Int16" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Inactive" Type="Boolean" />
                <asp:Parameter Name="UserName" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
