<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Jobs-payment.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.Jobs_payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="robots" content="noindex" />
    <title></title>
        <link rel="stylesheet" type="text/css" href="css/style_iframe.css" />
            <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/themes/base/jquery-ui.css" type="text/css" media="all" />
            <link rel="stylesheet" href="http://static.jquery.com/ui/css/demo-docs-theme/ui.theme.css" type="text/css" media="all" />
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script>
            <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js" type="text/javascript"></script>


    <script type="text/javascript">
         $(function () {
             $("#<%= ListView1.InsertItem.FindControl("PaymentDateTextBox").ClientID %>").datepicker({
                 changeMonth: true,
             });
         });

    </script>

    <style>


    * {
        border: none;
    }
	.measure_left-rail {
		width:300px;
		float:left;
	}

    .measure-minimalist-b
    {
	    font-family: "Segoe UI", Verdana, Helvetica, Sans-Serif;
	    font-size: 1em;
	    background: #fff;
	    margin: 10px;
	    width: 300px;
	    border-collapse: collapse;
	    text-align: left;        
    }
    .measure-minimalist-b th
    {
	    font-size: 13px;
	    font-weight: normal;
	    color: #039;
	    padding: 0px 7px;
	    border-bottom: 2px solid #6678b1;
        text-align:left;
        background: #eff2ff;
    }
    .measure-minimalist-b td
    {
	    border-bottom: 1px solid #ccc;
	    color: #669;
	    padding: 0px 7px;
        text-align:left;
        height: 25px;
    }
    .measure-minimalist-b tbody tr:hover td
    {
	    color: #009;
        background: #eff2ff;
    }

    .DivToScroll{   
        border: 1px solid #DDDDDD;
        border-radius: 4px 0 4px 0;
        left: -1px;
        padding: 0px 0px 0px 0px;
    }

    .DivWithScroll{
        width:340px;
        height:150px;
        overflow:scroll;
        overflow-x:hidden;
    }

  .auto-style1 {
            font-size:1.2em;
            width: 250px;
        }

   .auto-style1 td input{
        width:120px;
        font-size:1.1em;
        text-align:right;
        padding-right:3px;
    }
     .auto-style1 td span {
        color: #009;
        color: #333;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="float:left;margin-left:8px;margin-bottom:10px;">
             <div class="DivToScroll">
        <div class="DivWithScroll"> 
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="PaymentID" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem" OnItemDeleted="ListView1_ItemDeleted" OnItemInserted="ListView1_ItemInserted">
            <AlternatingItemTemplate>
                                <tr style="">
                    
                    <td>
                        <asp:Label ID="PaymentDateLabel" runat="server" Text='<%# Eval("PaymentDate","{0:M/dd/yyyy}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount","{0:c}") %>' />
                        <asp:Label ID="PaymentIDLabel" runat="server" Text='<%# Eval("PaymentID") %>' Visible="false" />
                        <asp:Label ID="OnlineQuoteIDLabel" runat="server" Text='<%# Eval("OnlineQuoteID") %>' Visible="false" />
                    </td>
                                    <td>
                            <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Delete" ImageUrl="~/Images/delete_icon.gif" OnClientClick='return confirm(&apos;About to delete. Are you sure?&apos;);' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="PaymentIDLabel1" runat="server" Text='<%# Eval("PaymentID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PaymentDateTextBox" runat="server" Text='<%# Bind("PaymentDate") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="OnlineQuoteIDTextBox" runat="server" Text='<%# Bind("OnlineQuoteID") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">

                    <td>
                        <asp:TextBox ID="PaymentDateTextBox" runat="server" Text='<%# Bind("PaymentDate") %>' Width="80px"  />
                    </td>
                    <td>
                        <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>'  Width="80px" />
                       <asp:TextBox ID="OnlineQuoteIDTextBox" runat="server" Text='<%# Bind("OnlineQuoteID") %>' Visible="false" />

                    </td>
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Save" />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                                <tr style="">
                    
                    <td>
                        <asp:Label ID="PaymentDateLabel" runat="server" Text='<%# Eval("PaymentDate","{0:M/dd/yyyy}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount","{0:c}") %>' />
                        <asp:Label ID="PaymentIDLabel" runat="server" Text='<%# Eval("PaymentID") %>' Visible="false" />
                        <asp:Label ID="OnlineQuoteIDLabel" runat="server" Text='<%# Eval("OnlineQuoteID") %>' Visible="false" />
                    </td>
                                    <td>
                            <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Delete" ImageUrl="~/Images/delete_icon.gif" OnClientClick='return confirm(&apos;About to delete. Are you sure?&apos;);' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" class="measure-minimalist-b" runat="server" border="0" style="">
                                <tr runat="server" style="">                                   
                                    <th runat="server">Payment Date</th>
                                    <th runat="server">Amount</th>
                                    <th id="Th1" runat="server"></th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style=""></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                       
                    </td>
                    <td>
                        <asp:Label ID="PaymentDateLabel" runat="server" Text='<%# Eval("PaymentDate","{0:M/dd/yyyy}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>' />
                         <asp:Label ID="PaymentIDLabel" runat="server" Text='<%# Eval("PaymentID") %>' />
                        <asp:Label ID="OnlineQuoteIDLabel" runat="server" Text='<%# Eval("OnlineQuoteID") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
            </div></div></div>
        <br />
        <div style="float:right;">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="TotalPayment" DataSourceID="SqlDataSource2">
              <ItemTemplate>
                    <table class="auto-style1">

                        <tr>
                            <td>Total Job:</td>
                            <td>
                                <asp:TextBox ID="TotalJobLabel" runat="server" Text='<%# Bind("TotalJob","{0:0.00}") %>' ReadOnly="true" />
                            </td>
                        </tr>
                        <tr>
                            <td>Total Payment:</td>
                            <td>
                                <asp:TextBox ID="TotalPaymentLabel" runat="server" Text='<%# Eval("TotalPayment","{0:0.00}") %>' ReadOnly="true"  />
                            </td>
                        </tr>
                        <tr>
                            <td>Balance Due:</td>
                            <td>
                                <asp:TextBox ID="BalanceDueLabel" runat="server" ReadOnly="true"  />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:TextBox ID="GrossProfitLabel" runat="server" Text='<%# Bind("GrossProfit") %>' ReadOnly="true" Visible="false"  />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>



            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT TFab + TGran + IIF(ISNULL(TotalSinks), 0, TotalSinks) AS TotalJob, TotalPayment, QuoteWithGranite, OnlineQuoteID, GrossProfit FROM TotalSummaryQry WHERE (OnlineQuoteID = ?)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="?" QueryStringField="OnlineQuoteID" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:Label ID="PaymentIDLabel2" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:Label ID="ServiceTotalLabel" runat="server" Text="Label" Visible="False"></asp:Label>
    </div>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblPayments] WHERE [PaymentID] = ?" InsertCommand="INSERT INTO [tblPayments] ([PaymentID], [PaymentDate], [Amount], [OnlineQuoteID]) VALUES (?, ?, ?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT [PaymentID], [PaymentDate], [Amount], [OnlineQuoteID] FROM [tblPayments] WHERE ([OnlineQuoteID] = ?)" UpdateCommand="UPDATE [tblPayments] SET [PaymentDate] = ?, [Amount] = ?, [OnlineQuoteID] = ? WHERE [PaymentID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="PaymentID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="PaymentIDLabel2" Name="PaymentID" PropertyName="Text" Type="Int32" />
                <asp:Parameter Name="PaymentDate" Type="DateTime" />
                <asp:Parameter Name="Amount" Type="Decimal" />
                <asp:QueryStringParameter Name="OnlineQuoteID" QueryStringField="OnlineQuoteID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="OnlineQuoteID" QueryStringField="OnlineQuoteID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="PaymentDate" Type="DateTime" />
                <asp:Parameter Name="Amount" Type="Decimal" />
                <asp:Parameter Name="OnlineQuoteID" Type="Int32" />
                <asp:Parameter Name="PaymentID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <div>
    
    </div>
    </form>
</body>
</html>
