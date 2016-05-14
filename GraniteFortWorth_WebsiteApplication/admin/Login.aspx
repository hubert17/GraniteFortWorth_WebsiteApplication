<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <meta name="robots" content="noindex" />
    <style>
        label {
                display:inline;
                font-size:initial;
                font-weight:normal;
            }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h2>DFW Granite WebApp Login</h2>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Username:"></asp:Label>
        <br />
        <asp:TextBox ID="UsernameTextBox" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label>
        <br />
        <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
    </p>
    <p>
        <asp:CheckBox ID="PersistCheckBox" runat="server" Text="Remember me next time" /><br />
        <asp:Button ID="LoginButton" runat="server" OnClick="LoginButton_Click" Text="Sign In" /><br />
        <asp:Label ID="LoginMessageLabel" runat="server" ForeColor="Red"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [UserName], [UserPassword] FROM [tblUsers] WHERE (([UserName] = ?) AND ([UserPassword] = ?))">
            <SelectParameters>
                <asp:ControlParameter ControlID="UsernameTextBox" Name="UserName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="PasswordTextBox" Name="UserPassword" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                <asp:HiddenField ID="hfRP" runat="server" Value="reset" />
    </p>
</asp:Content>
