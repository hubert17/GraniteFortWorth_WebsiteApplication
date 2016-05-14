<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Jobs-quote.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.Jobs_quote" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="float:left;width:170px;">
        <asp:CheckBox ID="chkCust" runat="server" Text="Customer Info" AutoPostBack="True" Checked="True" OnCheckedChanged="chkCust_CheckedChanged" /><br />
        <asp:CheckBox ID="chkJobs" runat="server" Text="Job Info" Checked="True" AutoPostBack="True" OnCheckedChanged="chkJobs_CheckedChanged" /><br />
        <asp:CheckBox ID="chkGran" runat="server" Text="Granite & Measures" Checked="True" AutoPostBack="True" OnCheckedChanged="chkGran_CheckedChanged" />
    </div>
    <div style="float:left;width:110px">
        <asp:CheckBox ID="chkSink" runat="server" Text="Sinks" AutoPostBack="True" Checked="True" OnCheckedChanged="chkSink_CheckedChanged" /><br />
        <asp:CheckBox ID="chkServ" runat="server" Text="Services" Checked="True" AutoPostBack="True" OnCheckedChanged="chkServ_CheckedChanged" />
    </div>
    </form>
</body>
</html>
