<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manage-JobStatus.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.Manage_JobStatus" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Manage Jobs Status - DFW Wholesale Granite</title>
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
        tr th {  font-size: small; border-bottom:solid 1px; border-top:solid 1px; }
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


        <div class="onlyonscreen">
        <h4>DFW Wholesale Granite</h4>
        <div style="width:500px;overflow:hidden;white-space: nowrap;">
        <h2>Job Status Manager 
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="onlyonscreen">
            <asp:ListItem Value="StatusNz">by Status</asp:ListItem>
            <asp:ListItem Value="SalesManNameNz">by Salesman</asp:ListItem>
        </asp:DropDownList></h2>
        </div>
            <asp:DropDownList ID="DropDownStatus" runat="server" Width="150px" DataSourceID="SqlDataSource2" DataTextField="Status" DataValueField="StatusID" OnSelectedIndexChanged="DropDownStatus_SelectedIndexChanged" AutoPostBack="True" AppendDataBoundItems="true" >
                <asp:ListItem Value="sa">Show All</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DFWGraniteDBConnectionString %>" ProviderName="<%$ ConnectionStrings:DFWGraniteDBConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT tblOnlineQuotes.StatusID, tblStatus.Status, tblOnlineQuotes.InitiatedBy FROM (tblStatus INNER JOIN tblOnlineQuotes ON tblStatus.StatusID = tblOnlineQuotes.StatusID) WHERE (tblOnlineQuotes.InitiatedBy = 'admin')"></asp:SqlDataSource>
            <asp:DropDownList ID="DropDownSalesMan" runat="server" Width="150px" DataSourceID="SqlDataSource4" DataTextField="SalesManName" DataValueField="SalesManID" OnSelectedIndexChanged="DropDownSalesMan_SelectedIndexChanged" AutoPostBack="True" AppendDataBoundItems="True" >
                <asp:ListItem Value="sa">Show All</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DFWGraniteDBConnectionString %>" ProviderName="<%$ ConnectionStrings:DFWGraniteDBConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT tblOnlineQuotes.SalesManID, tblSalesMen.SalesManName FROM (tblSalesMen LEFT OUTER JOIN tblOnlineQuotes ON tblSalesMen.SalesManID = tblOnlineQuotes.SalesManID)"></asp:SqlDataSource>
            <asp:Button ID="btnPrint" runat="server" Text="Print" OnClientClick="window.print();document.body.onmousemove = doneyet;" />
        </div>

        <br />

<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="None" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:HyperLinkField DataNavigateUrlFields="OnlineQuoteID" DataNavigateUrlFormatString="EditJob.aspx?OnlineQuoteID={0}" DataTextField="OnlineQuoteID" HeaderText="JOB #" Target="_blank" >
                <HeaderStyle Width="50px" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="CustomerName" HeaderText="CUSTOMER" ReadOnly="True" >
                <HeaderStyle Width="170px" Wrap="True" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="STATUS">
                    <ItemTemplate>
                        <asp:DropDownList ID="StatusDropDownList" runat="server" DataSourceID="SqlDataSourceStatus" DataTextField="Status" DataValueField="StatusID" Text='<%# Eval("StatusID") %>' Width="100px" AutoPostBack="True" AppendDataBoundItems="true" OnSelectedIndexChanged="StatusDropDownList_SelectedIndexChanged" >
                            <asp:ListItem Value=""> </asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceStatus" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [StatusID], [Status] FROM [tblStatus]"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="InstallDate" HeaderText="INSTALL DATE" ReadOnly="True" DataFormatString="{0:MM/dd/yyyy}" >
                <HeaderStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="SalesManID" HeaderText="SALESMAN" ReadOnly="True" >
                <HeaderStyle Width="80px" />
                </asp:BoundField>

            </Columns>
        </asp:GridView>
</ContentTemplate>
</asp:UpdatePanel>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteID, CustomerFirstName + ' ' + CustomerLastName AS CustomerName, StatusID, InstallDate, SalesManID FROM tblOnlineQuotes">
        </asp:SqlDataSource>
 
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString8 %>" ProviderName="<%$ ConnectionStrings:ConnectionString8.ProviderName %>" SelectCommand="SELECT OnlineQuoteID, CustomerFirstName + ' ' + CustomerLastName AS CustomerName, StatusID, Status, iif(isnull(StatusID), 'Unknown Status', Status) AS StatusNz, EdgeName, SlabColor, InstallDate, SalesManID, SalesManName, iif(isnull(SalesManID), 'No Salesman', SalesManName) AS SalesManNameNz FROM StatusReportQry WHERE (StatusID = ?) ORDER BY InstallDate DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownStatus" Name="?" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString8 %>" ProviderName="<%$ ConnectionStrings:ConnectionString8.ProviderName %>" SelectCommand="SELECT OnlineQuoteID, CustomerFirstName + ' ' + CustomerLastName AS CustomerName, StatusID, Status, iif(isnull(StatusID), 'Unknown Status', Status) AS StatusNz, EdgeName, SlabColor, InstallDate, SalesManID, SalesManName, iif(isnull(SalesManID), 'No Salesman', SalesManName) AS SalesManNameNz FROM StatusReportQry WHERE (SalesManID = ?) ORDER BY InstallDate DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownSalesMan" Name="?" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
           
    </div>
    </form>
</body>
</html>