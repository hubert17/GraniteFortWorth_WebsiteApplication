<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sales-report-yearly.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.Sales_report_yearly" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ANNUAL SALES REPORT - DFW Wholesale Granite</title>
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
        tr th { font-size: small; }
         th { border-bottom:solid 1px; border-top:solid 1px; }
        tr:hover { font-weight:bold; }
        th, td {      }

        .SubTotalRowStyle {
            font-weight:bold;
        }

        .GrandTotalRowStyle {
            font-weight:bold;
            font-size:medium;
            height: 50px;
            vertical-align:central;

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

    <script type="text/javascript">
        function disablePrint() {
            document.getElementById('<% =btnPrint.ClientID %>').style.visibility = "hidden";
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
        <div class="onlyonscreen" style="width:500px;overflow:hidden;white-space: nowrap;">
        <h4>DFW Wholesale Granite</h4>        
        <h2>Sales Report 
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="onlyonscreen" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Value="Yearly">by Year</asp:ListItem>            
            <asp:ListItem Value="Monthly">by Month</asp:ListItem>
            <asp:ListItem Value="Date">by Date</asp:ListItem>
        </asp:DropDownList></h2>
        <br />           
            <asp:DropDownList ID="DropDownListYear" runat="server" Width="100px" onchange="disablePrint();" AutoPostBack="True" ></asp:DropDownList>            
            <asp:CheckBox ID="GroupCheckBox" runat="server" AutoPostBack="True" Text="Group by Month" />
            <asp:Button ID="btnPrint" runat="server" Text="Print" OnClientClick="window.print();" />

        </div>
        <div class="onlyinprint">
        <h4>DFW Wholesale Granite</h4>        
        <h2><asp:Label ID="YearLabel" runat="server" Text="Label" ></asp:Label> Annual Sales Report</h2>
        </div>

        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="None"  DataSourceID="SqlDataSource2" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True" OnRowCreated="GridView1_RowCreated">
            <Columns>
                <asp:BoundField DataField="OnlineQuoteID" HeaderText="OnlineQuoteID" InsertVisible="False" SortExpression="OnlineQuoteID" Visible="False" />
                <asp:BoundField DataField="CustomerName" HeaderText="CUSTOMER" SortExpression="CustomerName" >
                <FooterStyle Font-Bold="True" Font-Italic="False" />
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Wrap="False" HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:TemplateField>
                    <HeaderStyle Width="20px" />
                </asp:TemplateField>
                <asp:BoundField DataField="Lead" HeaderText="LEAD" SortExpression="Lead" >
                <FooterStyle Font-Bold="True" Font-Italic="False" HorizontalAlign="Left" />
                <HeaderStyle HorizontalAlign="Left" Width="100px" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Total_SF" HeaderText="SF" SortExpression="Total_SF" DataFormatString="{0:0.##}"  >
                <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Center" Width="50px" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TotalSales" HeaderText="SALES" SortExpression="TotalSales" DataFormatString="{0:#,0.00}"  >
                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                <HeaderStyle HorizontalAlign="Right" Width="100px" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="TotalGranite" HeaderText="GRANITE" SortExpression="TotalGranite" DataFormatString="{0:#,0.00}" >
                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                <HeaderStyle HorizontalAlign="Right" Width="100px" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="TotalWorkOrder" HeaderText="WORK ORDER" SortExpression="TotalWorkOrder" DataFormatString="{0:#,0.00}" >
                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                <HeaderStyle HorizontalAlign="Right" Width="100px" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="TotalGrossProfit" HeaderText="GROSS PROFIT" SortExpression="TotalGrossProfit" DataFormatString="{0:#,0.00}" >
                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                <HeaderStyle HorizontalAlign="Right" Width="100px" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <EmptyDataTemplate>
                <em style="color:red;">Sorry. We do not have sales information on year specified. Please try with other year.</em>
            </EmptyDataTemplate>
            <FooterStyle Font-Size="Medium" />
            <HeaderStyle BorderColor="Black" BorderStyle="None" />
        </asp:GridView>


    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT DISTINCT OnlineQuoteID, CustomerName, Lead, TotalSF AS Total_SF, TotalJob AS TotalSales, IIF(ISNULL(TotSlabsSum), 0, TotSlabsSum) AS TotalGranite, WorkOrderSum AS TotalWorkOrder, IIF(ISNULL(TotalSales - GrossProfit), 0, TotalSales - GrossProfit) AS TotalGrossProfit, InstallMonth, InstallMonthName FROM SalesTotalJobsQry WHERE (InstallYear = ?) ORDER BY InstallMonth, TotalJob DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownListYear" Name="Year" PropertyName="SelectedValue" Type="Int16" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT DISTINCT OnlineQuoteID, CustomerName, Lead, TotalSF AS Total_SF, TotalJob AS TotalSales, IIF(ISNULL(TotSlabsSum), 0, TotSlabsSum) AS TotalGranite, WorkOrderSum AS TotalWorkOrder, IIF(ISNULL(TotalSales - GrossProfit), 0, TotalSales - GrossProfit) AS TotalGrossProfit FROM SalesTotalJobsQry WHERE (InstallYear = ?) ORDER BY TotalJob DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownListYear" Name="Year" PropertyName="SelectedValue" Type="Int16" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>