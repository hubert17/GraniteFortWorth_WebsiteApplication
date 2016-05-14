<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CalendarInstall.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.CalendarInstall" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DFW Install CAlendar</title>
        <link rel="stylesheet" type="text/css" href="css/demo_acc.css" />
</head>
<body>
    <form id="form1" runat="server">
       <div class="container">
			<!-- Codrops top bar -->
            <div class="codrops-top">
                <a href="Default.aspx"><strong>Return to Admin Home</strong></a>
                <a href="/admin/Manage-granite.aspx">Granite</a>
                <a href="/admin/Manage-services.aspx">Services</a>
                <a href="/admin/Manage-sink.aspx">Sinks</a>
                <a href="/admin/Weekend-specials.aspx">Weekend Specials</a>
	            <a href="/admin/CalendarInstall.aspx">DFW Install Calendar</a>
                <a href="/admin/References.aspx?AdminView=true">References</a>
                <a href="/admin/Sales-report-monthly.aspx">Sales Report</a>
                <a href="/admin/StatusReport.aspx">Job Status Report <span style="color:red;">NEW!</span></a>

                <span class="right">
                    <asp:LinkButton ID="LoggedInUserName" runat="server" Text="Hello, " /><strong><asp:LinkButton ID="LogoutLinkButton" runat="server" OnClick="LogoutLinkButton_Click">Logout</asp:LinkButton></strong>
                </span>
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->
			<header>
				<h1>DFW <span>Wholesale Granite</span></h1>
				<h2>DFW Install Calendar</h2>
            </header>
           <section>
                <div style="width:1024px;margin-left:auto;margin-right:auto;">
                    <iframe src="https://www.google.com/calendar/embed?src=60ngsfs8erai9mep5blrh49skc%40group.calendar.google.com&ctz=America/Chicago" style="border: 0" width="1024" height="480" frameborder="0" scrolling="no"></iframe>
                </div>
           </section>

</div>
    </form>
</body>
</html>
