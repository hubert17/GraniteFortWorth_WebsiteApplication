<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StatusReport.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.StatusReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Jobs Status Report - DFW Wholesale Granite</title>
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

        a {
            text-decoration: none; 
        }

        a:hover {
            text-decoration:underline; 
        }

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
        <h2>Job Status Report <asp:Label ID="RecentJobByLabel" runat="server" Text="by Zip" CssClass="onlyinprint"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="onlyonscreen">
            <asp:ListItem Value="StatusNz">by Status</asp:ListItem>
            <asp:ListItem Value="SalesManNameNz">by Salesman</asp:ListItem>
        </asp:DropDownList></h2>
        </div>

        <div class="onlyonscreen">
            <asp:Button ID="btnPrint" runat="server" Text="Print" OnClientClick="window.print();document.body.onmousemove = doneyet;" />
        </div>

        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="None" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:BoundField DataField="InstallDate" HeaderText="INSTALL DATE" ReadOnly="True" DataFormatString="{0:MM/dd/yyyy}" >
                <HeaderStyle Width="120px" />
                </asp:BoundField>
                <asp:BoundField DataField="Status" HeaderText="STATUS" Visible="False" >
                <HeaderStyle Width="110px" />
                </asp:BoundField>
                <asp:BoundField DataField="SalesManName" HeaderText="SALESMAN" ReadOnly="True" >
                <HeaderStyle Width="110px" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="OnlineQuoteID" DataNavigateUrlFormatString="EditJob.aspx?OnlineQuoteID={0}" DataTextField="OnlineQuoteID" HeaderText="JOB #" Target="_blank" >
                <HeaderStyle Width="60px" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="CustomerName" HeaderText="CUSTOMER" ReadOnly="True" >
                <HeaderStyle Width="200px" Wrap="True" />
                </asp:BoundField>
                <asp:BoundField DataField="EdgeName" HeaderText="EDGE" ReadOnly="True" />
                <asp:BoundField DataField="SlabColor" HeaderText="GRANITE" ReadOnly="True" />
                <asp:BoundField DataField="StatusNz" HeaderText="STATUSnz" Visible="False" />
                <asp:BoundField DataField="SalesManNameNz" HeaderText="SALESMAN" Visible="false" />

            </Columns>



        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteID, CustomerFirstName + ' ' + CustomerLastName AS CustomerName, StatusID, Status, iif(isnull(StatusID), 'Unknown Status', Status) AS StatusNz, EdgeName, SlabColor, InstallDate, SalesManID, SalesManName, iif(isnull(SalesManID),'No Salesman',SalesManName) AS SalesManNameNz FROM StatusReportQry">
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
