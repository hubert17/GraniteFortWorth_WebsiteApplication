<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Jobs-Summary.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.Jobs_Summary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="robots" content="noindex" />
    <title></title>
            <link rel="stylesheet" type="text/css" href="css/style_iframe.css" />
    <style type="text/css">
        .auto-style1 {
            font-size:1.2em;
            width: 250px;
        }

   td input{
        width:120px;
        font-size:1.3em;
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
    
        <table class="auto-style1">
            <tr>
                <td>Total Job:</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Total Payment:</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Balance Due:</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Gross Profit:</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
