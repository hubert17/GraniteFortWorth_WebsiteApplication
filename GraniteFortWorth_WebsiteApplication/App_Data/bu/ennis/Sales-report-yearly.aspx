﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sales-report-yearly.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.Sales_report_yearly" %>

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

    <style type="text/css" media="print">
        .onlyonscreen { display:none; }
        .onlyinprint { display:inline; text-align:center; }
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
    <div>
        <div class="onlyonscreen" style="width:500px;overflow:hidden;white-space: nowrap;">
        <h4>DFW Wholesale Granite</h4>        
        <h2>Sales Report 
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="onlyonscreen" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Value="Yearly">by Year</asp:ListItem>            
            <asp:ListItem Value="Monthly">by Month</asp:ListItem>
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
                <asp:BoundField DataField="Total_SF" HeaderText="SF" SortExpression="Total_SF" DataFormatString="{0:0.#}"  >
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