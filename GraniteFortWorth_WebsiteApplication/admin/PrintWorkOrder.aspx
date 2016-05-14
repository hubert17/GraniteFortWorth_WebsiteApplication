<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintWorkOrder.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.PrintWorkOrder" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>WORK ORDER</title>

    <meta name="robots" content="noindex" />
    <link rel="stylesheet" href="~/css/printstyle.css" type="text/css" media="print" />
        <link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css' />

    <style media="screen">
           html {color: #777 !important;}

           .centerHeader {
               width:600px;
               margin-left:auto;
               margin-right:auto;
               text-align:center;
           }

          .hcform1 {
	        width: 450px;
	        overflow: hidden;
            margin-bottom:30px;
            margin-left:auto;
            margin-right:auto;
            text-align:left;
        }

          .hcformtitle {
              padding-left:10px;
	        line-height: 16px;
	        font-size: 13px;
	        font-weight: bold;
	        width: 430px;
            font-family: 'Droid Sans', 'Lucida Sans Unicode', 'Lucida Grande', Sans-Serif;
            text-align:left;
        }


        .one-column-emphasis
        {
            font-family: 'Droid Sans', 'Lucida Sans Unicode', 'Lucida Grande', Sans-Serif;
	        font-size: 12px;
	        margin-left: 0px;
	        width: 600px;
	        border-collapse: collapse;
        }
        .one-column-emphasis th
        {
	        font-size: 14px;
	        font-weight:bold;
	        padding-left:5px;
            padding-right:5px;
        }
        .one-column-emphasis td
        {
	        padding-left:5px;
            padding-right:5px;
	        border-top: 1px solid #696969;
        }
        .oce-first
        {
	        border-right: 1px solid transparent;
	        border-left: 1px solid transparent;
        }



         .hor-minimalist-b
    {
        font-family: 'Droid Sans', 'Lucida Sans Unicode', 'Lucida Grande', Sans-Serif;
	    font-size: 12px;
	    margin-left: 10px;
	    width: 360px;
        border-collapse: collapse;
        border-bottom: 1px solid ;
        border-top: 1px solid #696969;
        border-right: 1px solid #696969;
        border-left:1px solid #696969;
    }

    .hor-minimalist-b th
    {
	    font-size: 14px;
	    font-weight: normal;
	    color: #039;
	    padding-left:5px;
        padding-right:5px;
    }
    .hor-minimalist-b td
    {
	    border-bottom: 1px solid #696969;
	    padding-left:5px;
        padding-right:5px;
    }

             .onlyinprint {
            display:none;
        }



        .billToTable {
        font-family: 'Droid Sans', 'Lucida Sans Unicode', 'Lucida Grande', Sans-Serif;
	        font-size: 12px;
	        margin-left: 5px;
            padding-left: 0px;
	        width: 580px;
	        border-collapse: collapse;
        }



        .auto-style4 {
            width: 376px;
        }



    </style>
</head>
<body>
    <form id="form1" runat="server">

<div class="centerHeader">

<div class="onlyinscreen">

    <asp:Button ID="btnPrint" runat="server" Text="Print Work Order" OnClientClick="window.print()" />

&nbsp;&nbsp;
    <asp:Button ID="btnEmail" runat="server" Text="Email Work Order" OnClick="btnEmail_Click" OnClientClick='alert(&apos;This may take a few seconds. Please bear with us.&apos;);' />
&nbsp;&nbsp;
    <asp:Button ID="btnHome" runat="server" Text="Return to Job" OnClick="btnHome_Click" Visible="False" />

</div>

<div class="onlyinprint" >

        <asp:FormView ID="FormView3" runat="server" DataSourceID="SqlDataSource4" HorizontalAlign="Center">             
        <ItemTemplate>
<h2 style="margin-bottom:0px;"><asp:Label ID="WOCompanyNameLabel" runat="server" Text='<%# Bind("WOCompanyName") %>' /></h2>
        <p style="margin-top:0px;"><em><asp:Literal ID="WOCompanyAddressLabel" runat="server" Text='<%# Bind("WOCompanyAddress") %>' /></em></p>
            <asp:Label ID="WOEmailLabel" runat="server" Text='<%# Bind("WORecepientEmail") %>' Visible="false" />
        </ItemTemplate>
    </asp:FormView>
   </div> 




    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [WOCompanyName], [WOCompanyAddress], [WORecepientEmail] FROM [dfwDefaults]"></asp:SqlDataSource>




    <h2 style="margin-bottom:0px;font-family:Impact,  Haettenschweiler,  'Arial Narrow Bold',  sans-serif;font-weight:normal;">Invoice</h2><br />



<div class="wrapper">

<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [OnlineQuoteID], [UserJobNo], [InstallDate] FROM [tblOnlineQuotes] WHERE ([OnlineQuoteID] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="OnlineQuoteID" QueryStringField="OnlineQuoteID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


<div class="hcform1" style="width:580px;">
<div class="hcformtitle" style="width:600px;padding-left:5px;">Bill To:</div>
<div style="margin-right:auto;margin-left:auto; margin-bottom:5px; width:580px">
<asp:FormView ID="FormView2" runat="server" DataKeyNames="OnlineQuoteID" DataSourceID="SqlDataSource2">
     <ItemTemplate>
    <table class="billToTable" >
        <tr>
            <td class="auto-style4">DFW Wholesale Granite</td>
            <td>INVOICE NO: </td>
            <td>
                <asp:Label ID="UserJobNoLabel" runat="server" Text='<%# Bind("UserJobNo") %>' style="text-align: right" />
            </td>
        </tr>
        <tr>
            <td class="auto-style4">10011 Harmon Road</td>
            <td>INSTALL DATE:</td>
            <td>
                <asp:Label ID="InstallDateLabel" runat="server" Text='<%# Bind("InstallDate","{0:MMM/dd/yyyy}") %>' style="text-align: right" />
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Unit 101</td>
            <td>&nbsp;</td>
            <td><asp:Label ID="OnlineQuoteIDLabel" runat="server" Text='<%# Eval("OnlineQuoteID") %>' Visible="false" /></td>
        </tr>
        <tr>
            <td class="auto-style4">Fort Worth Texas 76177</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </ItemTemplate>
</asp:FormView>
    </div>
</div>

<div class="hcform1" style="width:600px;">
<div class="hcformtitle" style="width:600px;">Job Address:</div>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="580px" AutoGenerateRows="False" DataKeyNames="OnlineQuoteID" DataSourceID="SqlDataSource1" CssClass="hor-minimalist-b" GridLines="None">
        <FieldHeaderStyle Width="160px" />
        <Fields>
            <asp:BoundField DataField="OnlineQuoteID" HeaderText="ONLINE QUOTE#" InsertVisible="False" ReadOnly="True" SortExpression="OnlineQuoteID" Visible="false" />
            <asp:BoundField DataField="CustomerName" HeaderText="NAME:" ReadOnly="True" SortExpression="CustomerName" />
            <asp:BoundField DataField="Address" HeaderText="ADDRESS:" SortExpression="Address" />
            <asp:BoundField DataField="Address2" ReadOnly="True" SortExpression="Address2" />
            <asp:BoundField DataField="Phone" HeaderText="PHONE:" SortExpression="Phone" />
            <asp:BoundField DataField="Email" HeaderText="E-MAIL:" SortExpression="Email" />
        </Fields>
    </asp:DetailsView>
</div>

<div class="hcform1" style="width:600px;">
<div class="hcformtitle" style="width:600px;"></div>
    <div style="margin-right:auto;margin-left:auto; margin-bottom:5px; width:580px">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="one-column-emphasis" DataSourceID="SqlDataSource3" Width="580px" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="OnlineQuoteStoneID" HeaderText="OnlineQuoteStoneID" InsertVisible="False" SortExpression="OnlineQuoteStoneID" Visible="False" />
            <asp:BoundField DataField="OnlineQuoteID" HeaderText="OnlineQuoteID" SortExpression="OnlineQuoteID" Visible="False" />
            <asp:BoundField DataField="SlabColorName" HeaderText="GRANITE" ReadOnly="True" SortExpression="SlabColorName" >
            <HeaderStyle HorizontalAlign="Left" Width="280px" />
            <ItemStyle HorizontalAlign="Left" Width="280px" />
            </asp:BoundField>
            <asp:BoundField DataField="SF" HeaderText="SF" SortExpression="SF" DataFormatString="{0:0.#}" Visible="false" >
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="SFplus10" HeaderText="QTY" ReadOnly="True" SortExpression="SFplus10" DataFormatString="{0:0.##}" >
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="WebsiteFabPrice" HeaderText="PRICE" ReadOnly="True" SortExpression="WebsiteFabPrice" DataFormatString="{0:C}" FooterText="SUBTOTAL:" >
            <FooterStyle HorizontalAlign="Right" />
            <HeaderStyle HorizontalAlign="Right" />
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Total" DataFormatString="{0:C}" HeaderText="TOTAL" ReadOnly="True" SortExpression="Total">
            <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
            <HeaderStyle HorizontalAlign="Right" />
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteStoneID, OnlineQuoteID, SlabColorName, Quantity AS SF, WOPrice AS WebsiteFabPrice, Quantity AS SFplus10, Total FROM SummarySlabWorkOrderQry WHERE (OnlineQuoteID = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="OnlineQuoteID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
</div>
</div>


<div class="hcform1" style="width:600px;">
    <div style="margin-right:auto;margin-left:auto; margin-bottom:5px; width:580px">
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CssClass="one-column-emphasis" DataSourceID="SqlDataSource5" Width="580px" OnRowDataBound="GridView3_RowDataBound" ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="OnlineQuoteServiceID" HeaderText="OnlineQuoteServiceID" InsertVisible="False" SortExpression="OnlineQuoteServiceID" Visible="False" />
                <asp:BoundField DataField="OnlineQuoteID" HeaderText="OnlineQuoteID" SortExpression="OnlineQuoteID" Visible="False" />
                <asp:BoundField DataField="ServiceName" HeaderText="SERVICE" SortExpression="ServiceName">
                <HeaderStyle HorizontalAlign="Left" Width="280px" />
                <ItemStyle HorizontalAlign="Left" Width="280px" />
                </asp:BoundField>
                <asp:BoundField DataField="QTY" HeaderText="QTY" SortExpression="QTY" ReadOnly="True" DataFormatString="{0:0.##}" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ServicePrice" DataFormatString="{0:C}" HeaderText="PRICE" SortExpression="ServicePrice" FooterText="SUBTOTAL:">
                <FooterStyle HorizontalAlign="Right" />
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="Total" DataFormatString="{0:C}" HeaderText="TOTAL" ReadOnly="True" SortExpression="Total">
                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <EmptyDataTemplate>
                No services availed.
            </EmptyDataTemplate>
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteServiceID, OnlineQuoteID, ServiceName, WOPrice AS ServicePrice, iif(isnull(Quantity), 1, Quantity) AS QTY, WOPrice * QTY AS Total FROM SummaryServicesWorkOrderQry WHERE (OnlineQuoteID = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="OnlineQuoteID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>        
</div>
</div>

<div class="hcform1" style="width:600px;margin-top:0px;">
    <div style="margin-right:auto;margin-left:auto;width:580px;">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="OnlineQuoteID" DataSourceID="SqlDataSource6" Width="580px" Font-Italic="False" Font-Names="'Droid Sans','Lucida Sans Unicode','Lucida Grande',Sans-Serif" Font-Size="Small">
            <ItemTemplate>
                <div style="float:left;width:300px;">
                    <div class="hcformtitle" style="margin-left:0px;padding-left:0px;">Notes:</div>                     
                    <asp:Label ID="NotesLabel" runat="server" Text='<%# Bind("Notes") %>' Width="300px" />
                </div>

                <div style="float:right;font-family:'Droid Sans', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', 'DejaVu Sans Condensed', sans-serif;font-size:medium;text-align:right;width:250px;">
                    <% DisplayTotalCost(); %>
                </div>
            </ItemTemplate>
        </asp:FormView>   
    </div>


 <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblOnlineQuotes] WHERE [OnlineQuoteID] = ?" InsertCommand="INSERT INTO [tblOnlineQuotes] ([OnlineQuoteID], [Notes]) VALUES (?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT [OnlineQuoteID], [Notes] FROM [tblOnlineQuotes] WHERE ([OnlineQuoteID] = ?)" UpdateCommand="UPDATE [tblOnlineQuotes] SET [Notes] = ? WHERE [OnlineQuoteID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="OnlineQuoteID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="OnlineQuoteID" Type="Int32" />
                <asp:Parameter Name="Notes" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="OnlineQuoteID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="OnlineQuoteID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>       
</div>


</div>





    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteID, CustomerName, Address, Address2, Phone, Email FROM SummaryInfoQry WHERE (OnlineQuoteID = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="?" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>


        <div class="onlyinprint" style="text-align:left;font-family:Arial, 'DejaVu Sans', 'Liberation Sans', Freesans, sans-serif;font-size:x-small;margin-left:10px;">
            <p><em>Granite is a natural product and varies in color and patterns. We do not do plumbing, electrical or carpentry work. This quote  includes cost of stone. If you elect to keep existing tile we are not responsible for damage to existing tile or fit to finished granite countertops.</em></p>
        </div>


</div>



<asp:Label ID="OnlineQuoteIDLabel" runat="server" Text="2" Visible="False"></asp:Label>


    </form>
</body>
</html>
