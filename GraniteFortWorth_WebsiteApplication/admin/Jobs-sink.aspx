<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Jobs-sink.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.Jobs_sink" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="robots" content="noindex" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/style_iframe.css" />

    <style>

    * {
        border: none;
    }
	.measure_left-rail {
		width:765px;
		float:left;
	}

    .measure-minimalist-b
    {
	    font-family: "Segoe UI", Verdana, Helvetica, Sans-Serif;
	    font-size: 1em;
	    background: #fff;
	    margin: 10px;
	    width: 765px;
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
        height:200px;
        overflow:scroll;
        overflow-x:hidden;
    }

    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div class="DivToScroll">
        <div class="DivWithScroll">  
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="OnlineQuoteSinkID" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem" OnItemDeleted="ListView1_ItemDeleted" OnItemInserted="ListView1_ItemInserted" OnItemUpdated="ListView1_ItemUpdated" OnItemEditing="ListView1_ItemEditing" OnItemCommand="ListView1_ItemCommand">
            <AlternatingItemTemplate>
                <tr style="">
                    <td>
                            <asp:ImageButton ID="EditButton" runat="server"  CommandName="Edit"  ImageUrl="~/Images/edit_icon.png" />
                            <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" ImageUrl="~/Images/delete_icon.gif" OnClientClick='return confirm(&apos;About to delete. Are you sure?&apos;);' />
                    <td>
                        <asp:Label ID="CatalogIDLabel" runat="server" Text='<%# Eval("CatalogID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SinkNameLabel" runat="server" Text='<%# Eval("SinkName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' Width="50px" />
                    </td>
                    <td>
                        <asp:Label ID="PurchasePriceLabel" runat="server" Text='<%# Eval("PurchasePrice","{0:c}") %>' Width="50px" />
                    </td>
                    <td>
                        <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount","{0:c}") %>' Width="50px" />
                        <asp:Label ID="OnlineQuoteSinkIDLabel" runat="server" Text='<%# Eval("OnlineQuoteSinkID") %>' Visible="false" />
                        <asp:Label ID="OnlineQuoteIDLabel" runat="server" Text='<%# Eval("OnlineQuoteID") %>' Visible="false" />
                        <asp:Label ID="SinkIDLabel" runat="server" Text='<%# Eval("SinkID") %>' Visible="false" />
                    </td>

                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="">
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                                                    <asp:DropDownList ID="SlabColorIDDropDownList" runat="server" DataSourceID="SqlDataSource5" DataTextField="SinkCat" DataValueField="SinkID" SelectedValue='<%# Bind("SinkID") %>' AutoPostBack="true" Width="200px"  >
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [SinkID], CatalogID + ' * ' + SinkName AS SinkCat FROM [tblSinks]"></asp:SqlDataSource>

                    </td>
                    <td>
                        <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' Width="50px" />
                    </td>
                    <td>
                        <asp:Label ID="PurchasePriceTextBox" runat="server" Text='<%# Bind("PurchasePrice","{0:0.00}") %>' Visible="true" Width="50px" />
                    </td>
                   <td>
                                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Save" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        <asp:TextBox ID="OnlineQuoteIDTextBox" runat="server" Text='<%# Bind("OnlineQuoteID") %>' Visible="false" />

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
                    </td>
                    <td></td>
                    <td>
                            <asp:DropDownList ID="SlabColorIDDropDownList" runat="server" DataSourceID="SqlDataSource5" DataTextField="SinkCat" DataValueField="SinkID" SelectedValue='<%# Bind("SinkID") %>' AppendDataBoundItems="true" AutoPostBack="true" Width="200px" >
                                <asp:ListItem Value="-1">
                                           -- Choose a Sink --
                                        </asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [SinkID], CatalogID + ' * ' + SinkName AS SinkCat FROM [tblSinks]"></asp:SqlDataSource>
                    
                    </td>
                    <td>
                        <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' Width="50px" />
                    </td>
                    <td>
                        <asp:Label ID="PurchasePriceTextBox" runat="server" Text='<%# Bind("PurchasePrice") %>' Width="50px" />
                    </td>
                  <td>
                                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Save" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>

                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                     <td>
                            <asp:ImageButton ID="EditButton" runat="server"  CommandName="Edit"  ImageUrl="~/Images/edit_icon.png" />
                            <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" ImageUrl="~/Images/delete_icon.gif" OnClientClick='return confirm(&apos;About to delete. Are you sure?&apos;);' />
                    <td>
                        <asp:Label ID="CatalogIDLabel" runat="server" Text='<%# Eval("CatalogID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SinkNameLabel" runat="server" Text='<%# Eval("SinkName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' Width="50px" />
                    </td>
                    <td>
                        <asp:Label ID="PurchasePriceLabel" runat="server" Text='<%# Eval("PurchasePrice","{0:C}") %>' Width="50px" />
                    </td>
                    <td>
                        <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount","{0:c}") %>' Width="50px" />
                        <asp:Label ID="OnlineQuoteSinkIDLabel" runat="server" Text='<%# Eval("OnlineQuoteSinkID") %>' Visible="false" />
                        <asp:Label ID="OnlineQuoteIDLabel" runat="server" Text='<%# Eval("OnlineQuoteID") %>' Visible="false" />
                        <asp:Label ID="SinkIDLabel" runat="server" Text='<%# Eval("SinkID") %>' Visible="false" />
                    </td>

                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" class="measure-minimalist-b" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server" style="width:50px;" ></th>
                                    <th runat="server" style="width:80px;">Catalog ID</th>
                                    <th runat="server" style="width:300px;">Description</th>
                                    <th runat="server" style="width:50px;">Quantity</th>
                                    <th runat="server" style="width:50px;">Price</th>
                                    <th runat="server" style="width:120px;">Amount</th>
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
                        <asp:Label ID="OnlineQuoteSinkIDLabel" runat="server" Text='<%# Eval("OnlineQuoteSinkID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OnlineQuoteIDLabel" runat="server" Text='<%# Eval("OnlineQuoteID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SinkIDLabel" runat="server" Text='<%# Eval("SinkID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Quantity") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView> 
     </div>
     </div>   
        
              <div style="text-align:right;padding-right:10px;">  
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Subtotal: "></asp:Label><asp:TextBox ID="SinkSubtotal" runat="server" style="text-align:right" BorderColor="Black" Width="100px"></asp:TextBox>
            </div>      
        
           
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblOnlineQuotesSinks] WHERE [OnlineQuoteSinkID] = ?" InsertCommand="INSERT INTO tblOnlineQuotesSinks(OnlineQuoteSinkID, OnlineQuoteID, SinkID, Quantity, PurchasePrice) VALUES (?, ?, ?, ?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteSinkID, OnlineQuoteID, SinkID, CatalogID, SinkName, Quantity, PurchasePrice, Amount FROM JobSinksQry WHERE (OnlineQuoteID = ?)" UpdateCommand="UPDATE tblOnlineQuotesSinks SET OnlineQuoteID = ?, SinkID = ?, Quantity = ?, PurchasePrice = ? WHERE (OnlineQuoteSinkID = ?)">
            <DeleteParameters>
                <asp:Parameter Name="OnlineQuoteSinkID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="OnlineQuoteSinkIDLabel" Name="OnlineQuoteSinkID" PropertyName="Text" Type="Int32" />
                <asp:QueryStringParameter Name="OnlineQuoteID" QueryStringField="OnlineQuoteID" Type="Int32" />
                <asp:Parameter Name="SinkID" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="PurchasePrice" Type="Decimal" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="?" QueryStringField="OnlineQuoteID" />
            </SelectParameters>
            <UpdateParameters>
                <asp:QueryStringParameter Name="OnlineQuoteID" QueryStringField="OnlineQuoteID" Type="Int32" />
                <asp:Parameter Name="SinkID" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:ControlParameter ControlID="PriceEditLabel" Name="PurchasePrice" PropertyName="Text" Type="Decimal" />
                <asp:Parameter Name="OnlineQuoteSinkID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
        
           
        <asp:Label ID="OnlineQuoteSinkIDLabel" runat="server" Text="Label" Visible="False"></asp:Label>
        
        
           
        <asp:Label ID="PriceEditLabel" runat="server" Text="Label"></asp:Label>
        
        
           
    </div>
    </form>
</body>
</html>
