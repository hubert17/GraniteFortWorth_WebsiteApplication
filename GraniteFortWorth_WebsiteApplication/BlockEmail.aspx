<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlockEmail.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.BlockEmail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="robots" content="noindex" />
    <title>Email Blocked.</title>
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
</head>
<body id="page4">
    <form id="form1" runat="server">
    <div runat="server"  id="divMessage" visible="false" style="width:600px;margin:10% auto auto auto;font-size:14pt;">
    
        <asp:Label ID="EmailLabel" runat="server" Text="Label"></asp:Label>
&nbsp;has been blocked!<br /><br />
        From now on, you will no longer receive any message from
        <asp:Label ID="NameLabel" runat="server" Text="Label"></asp:Label>
        &nbsp;email address.<br />
        <input type="submit" name="sqlExecute" value="Return to our Homepage..." onclick="ExecuteSQL();" id="btnHomepage" style="visibility:hidden;" />
</div>
    </form>
</body>
</html>
