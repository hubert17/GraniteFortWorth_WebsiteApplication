<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StatusQuoteReport.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.StatusQuoteReport" %>

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
        tr td { font-size: small; vertical-align:top; }
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
                <a href="/admin/StatusReport.aspx">Job Status Report</a>

                <span class="right">
                    <asp:LinkButton ID="LoggedInUserName" runat="server" Text="Hello, " /><strong><asp:LinkButton ID="LogoutLinkButton" runat="server" OnClick="LogoutLinkButton_Click">Logout</asp:LinkButton></strong>
                </span>
                <div class="clr"></div>
            </div>      
        
        <div class="marginwrap";>
        <div class="onlyonscreen" style="width:500px;overflow:hidden;white-space: nowrap;clear:both;">
        <h4>DFW Wholesale Granite</h4>
        <div style="width:500px;overflow:hidden;white-space: nowrap;">
        <h2>Job Quote Report 
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="onlyonscreen">
            <asp:ListItem Value="Measure">Measure</asp:ListItem>
             <asp:ListItem Value="TaskDate" Selected="True">Quote</asp:ListItem>
            <asp:ListItem Value="Template">Template</asp:ListItem>
           <asp:ListItem Value="Install">Install</asp:ListItem>
            <asp:ListItem Value="Repair">Repair</asp:ListItem>
            <asp:ListItem Value="Summary">Summary</asp:ListItem>


        </asp:DropDownList></h2>
        </div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DFWGraniteDBConnectionString %>" ProviderName="<%$ ConnectionStrings:DFWGraniteDBConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT tblOnlineQuotes.StatusID, tblStatus.Status, tblOnlineQuotes.InitiatedBy FROM (tblStatus INNER JOIN tblOnlineQuotes ON tblStatus.StatusID = tblOnlineQuotes.StatusID) WHERE (tblOnlineQuotes.InitiatedBy = 'admin')"></asp:SqlDataSource>
            <asp:Button ID="btnPrint" runat="server" Text="Print" OnClientClick="window.print();document.body.onmousemove = doneyet;" />
        </div>

        <div class="onlyinprint">
        <h4>DFW Wholesale Granite</h4>        
        <h2 style="margin-bottom:20px;">Job Quote Report </h2>
            <span runat="server" id="SpanCategory" style="font-size:medium;font-weight:bold;color:black;"><asp:Label ID="CategoryLabel" runat="server" Text="" ></asp:Label></span>
        </div>


        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="None" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:BoundField DataField="TaskTime" HeaderText="TASK TIME" ReadOnly="True" DataFormatString="{0:MM/dd/yyyy}" >
                <HeaderStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="Status" HeaderText="STATUS" Visible="False" >
                <HeaderStyle Width="75px" />
                </asp:BoundField>
                <asp:BoundField DataField="SalesManName" HeaderText="ASS. TO" ReadOnly="True" >
                <HeaderStyle Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="OnlineQuoteID" HeaderText="JOB #" ReadOnly="True" >
                <HeaderStyle Width="50px" Wrap="True" />
                </asp:BoundField>
                <asp:BoundField DataField="CustomerName" HeaderText="CUSTOMER [SINKS]" ReadOnly="True" >
                <HeaderStyle Width="170px" Wrap="True" />
                </asp:BoundField>
                <asp:BoundField DataField="EdgeName" HeaderText="EDGE" ReadOnly="True" >
                <HeaderStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField HeaderText="GRANITE" ReadOnly="True" />
                <asp:BoundField DataField="TaskDate" HeaderText="TASK DATE" Visible="False" />
                <asp:BoundField DataField="StatusNz" HeaderText="STATUSnz" Visible="False" />
                <asp:BoundField DataField="SalesManNameNz" HeaderText="SALESMAN" Visible="False" />

            </Columns>



        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteID, UCASE(CustomerFirstName + ' ' + CustomerLastName) AS CustomerName, StatusID, Status, iif(isnull(StatusID), 'Unknown Status', Status) AS StatusNz, EdgeName, InstallDate, InstallTime, Format(TaskDate, 'dd-MMM-yyyy') AS TaskDate, TaskTime, SalesManID, SalesManName, iif(isnull(SalesManID), 'No Salesman', SalesManName) AS SalesManNameNz FROM StatusReportNoGraniteQry WHERE (StatusID = 2) AND (NOT (TaskDate IS NULL)) ORDER BY TaskDate">
        </asp:SqlDataSource>
 
    </div>
    </form>
</body>
</html>
