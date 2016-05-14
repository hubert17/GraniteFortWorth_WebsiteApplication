<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="References.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.References" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta name="robots" content="noindex" />

    <title>References from Recent Jobs - DFW Wholesale Granite</title>
    <link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css' />
    
    <style>
        * {
            font-family: 'Droid Sans', sans-serif; 
        }

        .onlyinprint { display: none; }

        h4 {
            font-family: Cambria, Palatino, "Palatino Linotype", "Palatino LT STD", Georgia, serif;
            margin: 0px;
            padding: 0px;
        }
        h2 {
            margin: 0px;
            padding: 0px;
            
        }
        select {
            font-size:large;
            border:solid 1px;
            overflow-x:hidden;
            width: 30%;
        }

        tr { font-size: small; }
        tr th { font-size: medium; }
        tr:hover { font-weight:bold; }
        th, td { text-align: left;        }

    </style>

    <style type="text/css" media="print">
        .onlyonscreen { display:none; }
        .onlyinprint { display:inline;}
    </style>

    <script type="text/javascript">
        function doneyet() { 
              document.body.onmousemove = ""; 
              window.location.reload();
           } 
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h4>DFW Wholesale Granite</h4>
        <div style="width:500px;overflow:hidden;white-space: nowrap;">
        <h2>References from Recent Jobs <asp:Label ID="RecentJobByLabel" runat="server" Text="by Zip" CssClass="onlyinprint"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="onlyonscreen">
            <asp:ListItem Value="ZipCode">by Zip</asp:ListItem>
            <asp:ListItem Value="SlabColorName">by Granite</asp:ListItem>
        </asp:DropDownList></h2>
        </div>

        <div class="onlyonscreen">
            <asp:Button ID="btnPrint" runat="server" Text="Print" OnClientClick="window.print();document.body.onmousemove = doneyet;" />
            &nbsp;&nbsp;
            <asp:Button ID="btnMailingList" runat="server" Text="Create Mailing List" OnClick="btnMailingList_Click" Visible="False" />
            <asp:Label ID="InstructionLabel" runat="server" Font-Italic="True" Font-Size="Small" Text="Just copy and paste to the recepient field of your e-mail composer." Visible="False"></asp:Label>
            <br />
            <asp:TextBox ID="MailingListTextBox" runat="server" Height="200px" TextMode="MultiLine" Width="490px" Visible="False"></asp:TextBox>
            
        </div>

        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="None" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:BoundField DataField="Customer" HeaderText="CUSTOMER" ReadOnly="True" SortExpression="Customer" />
                <asp:BoundField DataField="Phone" HeaderText="PHONE" SortExpression="Phone" >
                <HeaderStyle Width="110px" />
                </asp:BoundField>
                <asp:BoundField DataField="CityStateZip" HeaderText="CITY/STATE/ZIP" ReadOnly="True" SortExpression="CityStateZip" />
                <asp:BoundField DataField="SlabColorName" HeaderText="GRANITE" ReadOnly="True" SortExpression="SlabColorName" />
            </Columns>



        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT tblOnlineQuotes.CustomerFirstName + ' ' + tblOnlineQuotes.CustomerLastName AS Customer, tblOnlineQuotes.Phone, tblOnlineQuotes.City + ', ' + tblOnlineQuotes.State + ', ' + tblOnlineQuotes.ZipCode AS CityStateZip, SlabColorsQry.SlabColorName, tblOnlineQuotes.ZipCode FROM ((tblOnlineQuotes INNER JOIN tblOnlineQuoteStone ON tblOnlineQuotes.OnlineQuoteID = tblOnlineQuoteStone.OnlineQuoteID) INNER JOIN SlabColorsQry ON tblOnlineQuoteStone.SlabColorID = SlabColorsQry.SlabColorID) WHERE (tblOnlineQuotes.StatusID = 8)">
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
