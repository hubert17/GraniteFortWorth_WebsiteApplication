<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactThanks.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.ContactThanks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thank You!</title>
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
</head>
<body id="page4">
    <form id="form1" runat="server">
    <div runat="server"  id="divMessage" visible="false" style="width:600px;margin:10% auto auto auto;">
    
        Thank you for contacting DFW Wholesale Granite.&nbsp; Our customer service staff will get back to you shortly.&nbsp; In the meantime, please feel free to take a look at our <a href="FAQ.aspx">FAQ</a> page if you haven&#39;t already, as your question may already have been answered there.&nbsp; We are also pleased to inform you about our <a href="onlinequote">Online Quote System</a>, a do-it-yourself web-based tool on creating your own Quotation for your project.&nbsp; Use it for free and achieve cost estimates close to final computation!
        <br />
        <br />
        If your concern is urgent, please give us a call (817) 300-3298.<br />
        <br />
        <input type="submit" name="sqlExecute" value="Return to our Homepage..." onclick="ExecuteSQL();" id="btnHomepage" style="visibility:hidden;" />
</div>
    </form>
</body>
</html>
