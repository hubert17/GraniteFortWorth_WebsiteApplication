<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StatusReport.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.StatusReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Jobs Status Report - DFW Wholesale Granite</title>
    <link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css' />
    
    <link href="css/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/Scripts/jquery-1.7.1.js" ></script>
    <script src="js/jquery.autocomplete.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=txtSearch.ClientID%>").autocomplete('HandlerTaskDateSearch.ashx');
        });
    </script>

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

    <style type="text/css" media="screen">
         body {
            margin: 0px;
            padding: 0px;
        }

        .marginwrap {
            margin-left:10px;
        }
        
                    /* Header Style */
            .codrops-top {
	            line-height: 24px;
	            font-size: 11px;
	            background: #fff;
	            background: rgba(255, 255, 255, 0.8);
	            text-transform: uppercase;
	            z-index: 9999;
	            position: relative;
	            font-family: Cambria, Georgia, serif;
	            box-shadow: 1px 0px 2px rgba(0,0,0,0.2);
            }

            /* Clearfix hack by Nicolas Gallagher: http://nicolasgallagher.com/micro-clearfix-hack/ */

            .codrops-top:before,
            .codrops-top:after {
                content: " "; /* 1 */
                display: table; /* 2 */
            }

            .codrops-top:after {
                clear: both
            }

            .codrops-top a {
	            padding: 0px 10px;
	            letter-spacing: 1px;
	            color: #808080;
	            display: inline-block;
            }

            .codrops-top a:hover {
	            background: rgba(255,255,255,0.6);
                color:#fff;
            }

            .codrops-top span.right {
	            float: right;
            }

            .codrops-top span.right a {
	            float: left;
	            display: block;
            }
    </style>

    <style type="text/css" media="print">
        .onlyonscreen { display:none;margin-top:20px; }
        .onlyinprint { display:inline; text-align:center; }
        .codrops-top {
            display: none;
        }

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
		<!-- Codrops top bar -->
            <div class="codrops-top" style="background-color:black;margin-bottom:20px;">
                <a href="Default.aspx"><strong>Return to Admin Home</strong></a>
                <a href="/admin/References.aspx?AdminView=true">References</a>
                <a href="/admin/Sales-report-monthly.aspx">Sales Report</a>
                <a href="/admin/TaskReportByDate.aspx">Show Task by Date: </a>
                <asp:TextBox ID="txtSearch" runat="server" AutoPostBack="True" OnTextChanged="txtSearch_TextChanged" Width="80px" ></asp:TextBox>
                <span class="right">
                    <asp:LinkButton ID="LoggedInUserName" runat="server" Text="Hello, " /><strong><asp:LinkButton ID="LogoutLinkButton" runat="server" OnClick="LogoutLinkButton_Click">Logout</asp:LinkButton></strong>
                </span>
                <div class="clr"></div>
            </div>      
        
        <div class="marginwrap";>
        <div class="onlyonscreen" style="width:500px;overflow:hidden;white-space: nowrap;clear:both;">
        <h4>DFW Wholesale Granite</h4>
        <div style="width:500px;overflow:hidden;white-space: nowrap;">
        <h2>Task Report 
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="onlyonscreen">
            <asp:ListItem Value="StatusNz">by Status</asp:ListItem>
            <asp:ListItem Value="SalesManNameNz">by Assignment</asp:ListItem>
            <asp:ListItem Value="InstallDate">Install</asp:ListItem>
            <asp:ListItem Value="Measure">Measure</asp:ListItem>
            <asp:ListItem Value="Quote">Quote</asp:ListItem>
            <asp:ListItem Value="Template">Template</asp:ListItem>
            <asp:ListItem Value="Repair">Repair</asp:ListItem>

        </asp:DropDownList></h2>
        </div>
            <asp:DropDownList ID="DropDownStatus" runat="server" Width="150px" DataSourceID="SqlDataSource2" DataTextField="Status" DataValueField="StatusID" OnSelectedIndexChanged="DropDownStatus_SelectedIndexChanged" AutoPostBack="True" AppendDataBoundItems="true" >
                <asp:ListItem Value="sa">Show All</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DFWGraniteDBConnectionString %>" ProviderName="<%$ ConnectionStrings:DFWGraniteDBConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT StatusID, Status FROM tblStatus WHERE (StatusID = 1) OR (StatusID = 2) OR (StatusID = 6) OR (StatusID = 4) OR (StatusID = 3) OR (StatusID = 10)"></asp:SqlDataSource>
            <asp:DropDownList ID="DropDownSalesMan" runat="server" Width="150px" DataSourceID="SqlDataSource4" DataTextField="SalesManName" DataValueField="SalesManID" OnSelectedIndexChanged="DropDownSalesMan_SelectedIndexChanged" AutoPostBack="True" AppendDataBoundItems="True" >
                <asp:ListItem Value="sa">Show All</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DFWGraniteDBConnectionString %>" ProviderName="<%$ ConnectionStrings:DFWGraniteDBConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT tblOnlineQuotes.SalesManID, tblSalesMen.SalesManName FROM (tblSalesMen LEFT OUTER JOIN tblOnlineQuotes ON tblSalesMen.SalesManID = tblOnlineQuotes.SalesManID)"></asp:SqlDataSource>
            <asp:Button ID="btnPrint" runat="server" Text="Print" OnClientClick="window.print();document.body.onmousemove = doneyet;" />
        </div>

        <div class="onlyinprint">
        <h4>DFW Wholesale Granite</h4>        
        <h2 style="margin-bottom:20px;">Task Report <asp:Label ID="RecentJobByLabel" runat="server" Text="by Zip" ></asp:Label></h2>
            <span runat="server" id="SpanCategory" style="font-size:medium;font-weight:bold;color:black;"><asp:Label ID="CategoryLabel" runat="server" Text="" ></asp:Label></span>
        </div>


        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="None" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:BoundField DataField="TaskDate" HeaderText="DATE" ReadOnly="True" DataFormatString="{0:MM/dd/yyyy}" >
                <HeaderStyle Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="Status" HeaderText="STATUS" Visible="False" >
                <HeaderStyle Width="75px" />
                </asp:BoundField>
                <asp:BoundField DataField="SalesManName" HeaderText="ASS. TO" ReadOnly="True" >
                <HeaderStyle Width="60px" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="OnlineQuoteID" DataNavigateUrlFormatString="EditJob.aspx?OnlineQuoteID={0}" DataTextField="OnlineQuoteID" HeaderText="JOB #" Target="_blank" >
                <HeaderStyle Width="50px" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="CustomerName" HeaderText="CUSTOMER" ReadOnly="True" >
                <HeaderStyle Width="150px" Wrap="True" />
                </asp:BoundField>
                <asp:BoundField DataField="Phone" HeaderText="PHONE" ReadOnly="True" >
                <HeaderStyle Width="100px" Wrap="True" />
                </asp:BoundField>
                <asp:BoundField DataField="EdgeName" HeaderText="EDGE" ReadOnly="True" >
                <HeaderStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="SlabColor" HeaderText="GRANITE" ReadOnly="True" />
                <asp:BoundField DataField="StatusNz" HeaderText="STATUSnz" Visible="False" />
                <asp:BoundField DataField="SalesManNameNz" HeaderText="SALESMAN" Visible="False" />

            </Columns>



        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteID, CustomerFirstName + ' ' + CustomerLastName AS CustomerName, Phone, StatusID, Status, iif(isnull(StatusID), 'Unknown Status', Status) AS StatusNz, EdgeName, SlabColor, InstallDate, Format(TaskDateIns, 'Medium Date') AS TaskDate, SalesManID, SalesManName, iif(isnull(SalesManID), 'No Salesman', SalesManName) AS SalesManNameNz FROM StatusReportQry WHERE (StatusID = 1) OR (StatusID = 2) OR (StatusID = 6) OR (StatusID = 4) OR (StatusID = 3) OR (StatusID = 10)">
        </asp:SqlDataSource>
 
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString8 %>" ProviderName="<%$ ConnectionStrings:ConnectionString8.ProviderName %>" SelectCommand="SELECT OnlineQuoteID, CustomerFirstName + ' ' + CustomerLastName AS CustomerName, Phone, StatusID, Status, iif(isnull(StatusID), 'Unknown Status', Status) AS StatusNz, EdgeName, SlabColor, InstallDate, Format(TaskDateIns, 'Medium Date') AS TaskDate, SalesManID, SalesManName, iif(isnull(SalesManID), 'No Salesman', SalesManName) AS SalesManNameNz FROM StatusReportQry WHERE (StatusID = ?) ORDER BY TaskDateIns">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownStatus" Name="?" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString8 %>" ProviderName="<%$ ConnectionStrings:ConnectionString8.ProviderName %>" SelectCommand="SELECT OnlineQuoteID, CustomerFirstName + ' ' + CustomerLastName AS CustomerName, Phone, StatusID, Status, iif(isnull(StatusID), 'Unknown Status', Status) AS StatusNz, EdgeName, SlabColor, InstallDate, Format(TaskDateIns, 'Medium Date') AS TaskDate, SalesManID, SalesManName, iif(isnull(SalesManID), 'No Salesman', SalesManName) AS SalesManNameNz FROM StatusReportQry WHERE (SalesManID = ?) AND (StatusID = 1 OR StatusID = 2 OR StatusID = 6 OR StatusID = 4 OR StatusID = 3 OR StatusID = 10) ORDER BY TaskDateIns">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownSalesMan" Name="?" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
           
    </div>
    </form>
</body>
</html>
