<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Jobs-service.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.Jobs_service" %>

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
        height:220px;
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
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="OnlineQuoteServiceID" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem" OnItemDeleted="ListView1_ItemDeleted" OnItemInserted="ListView1_ItemInserted" OnItemUpdated="ListView1_ItemUpdated">
            <AlternatingItemTemplate>
                <tr style="">
                    <td>
                            <asp:ImageButton ID="EditButton" runat="server"  CommandName="Edit"  ImageUrl="~/Images/edit_icon.png" />
                            <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" ImageUrl="~/Images/delete_icon.gif" OnClientClick='return confirm(&apos;About to delete. Are you sure?&apos;);' />
                    </td>
                    <td>
                        <asp:Label ID="ServicesIDLabel" runat="server" Text='<%# Eval("ServiceName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity","{0:0.#}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price","{0:c}") %>' />
                    </td>
                   <td>
                        <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount","{0:c}") %>' />
                        <asp:Label ID="OnlineQuoteServiceIDLabel" runat="server" Text='<%# Eval("OnlineQuoteServiceID") %>' Visible="false" />
                        <asp:Label ID="OnlineQuoteIDLabel" runat="server" Text='<%# Eval("OnlineQuoteID") %>' Visible="false" />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="">
                    <td>&nbsp;</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" Text='<%# Bind("ServicesID") %>' DataSourceID="SqlDataSource2" DataTextField="ServiceName" DataValueField="ServicesID" Width="250px" >
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT ServicesID, ServiceName FROM tblServices WHERE (Inactive = false) ORDER BY ServiceName"></asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:Label ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' Width="80px" Visible="false" />
                    </td>
                    <td>
                        <asp:Label ID="PriceTextBox" runat="server" Text='<%# Bind("Price","{0:0.00}") %>' />
                    </td>
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Save" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
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
                    <td>&nbsp;</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" Text='<%# Bind("ServicesID") %>' DataSourceID="SqlDataSource2" DataTextField="ServiceName" DataValueField="ServicesID" AppendDataBoundItems="true" Width="250px" AutoPostBack="true" >
                        <asp:ListItem Value="-1">
                                           -- Choose a Service --
                                        </asp:ListItem></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT ServicesID, ServiceName FROM tblServices WHERE (Inactive = false) ORDER BY ServiceName"></asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' Width="80px" Visible="false" />                        
                    </td>
                    <td>
                        <asp:Label ID="PriceTextBox" runat="server" Text='<%# Bind("Price","{0:0.00}") %>' />
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
                    </td>
                    <td>
                        <asp:Label ID="ServicesIDLabel" runat="server" Text='<%# Eval("ServiceName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity","{0:0.#}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price","{0:c}") %>' />
                    </td>
                   <td>
                        <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount","{0:c}") %>' />
                        <asp:Label ID="OnlineQuoteServiceIDLabel" runat="server" Text='<%# Eval("OnlineQuoteServiceID") %>' Visible="false" />
                        <asp:Label ID="OnlineQuoteIDLabel" runat="server" Text='<%# Eval("OnlineQuoteID") %>' Visible="false" />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" class="measure-minimalist-b" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server"></th>
                                    <th runat="server">Service</th>
                                    <th runat="server">Quantity</th>
                                    <th runat="server">Price</th>
                                    <th runat="server">Amount</th>
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
                        <asp:Label ID="OnlineQuoteServiceIDLabel" runat="server" Text='<%# Eval("OnlineQuoteServiceID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OnlineQuoteIDLabel" runat="server" Text='<%# Eval("OnlineQuoteID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ServicesIDLabel" runat="server" Text='<%# Eval("ServicesID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>  
        </div>
     </div>
             <div style="text-align:left;padding-left:10px;width:250px;float:left">  
                 <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Add New Service Item</asp:LinkButton>
            </div>  
              <div style="text-align:right;padding-right:10px;width:250px;float:right">  
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Subtotal: "></asp:Label><asp:TextBox ID="ServiceSubtotal" runat="server" style="text-align:right" BorderColor="Black" Width="100px"></asp:TextBox>
            </div>  
                  
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblOnlineQuotesServices] WHERE [OnlineQuoteServiceID] = ?" InsertCommand="INSERT INTO [tblOnlineQuotesServices] ([OnlineQuoteServiceID], [OnlineQuoteID], [ServicesID], [Quantity], [Price]) VALUES (?, ?, ?, ?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteServiceID, OnlineQuoteID, ServicesID, ServiceName, Quantity, IIf([ServiceType]=&quot;E&quot;,ServicePrice, Price) AS Price, IIf(IsNull(Quantity), 1, Quantity) * IIf(IsNull(Price) Or ServiceType='E', ServicePrice, Price) AS Amount, ServicePrice, ServiceType FROM JobServiceQry WHERE (OnlineQuoteID = ?)" UpdateCommand="UPDATE [tblOnlineQuotesServices] SET [OnlineQuoteID] = ?, [ServicesID] = ?, [Quantity] = ?, [Price] = ? WHERE [OnlineQuoteServiceID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="OnlineQuoteServiceID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="OnlineQuoteServiceIDLabel" Name="OnlineQuoteServiceID" PropertyName="Text" Type="Int32" />
                <asp:QueryStringParameter Name="OnlineQuoteID" QueryStringField="OnlineQuoteID" Type="Int32" />
                <asp:Parameter Name="ServicesID" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Int16" DefaultValue="1" />
                <asp:Parameter Name="Price" Type="Decimal" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="?" QueryStringField="OnlineQuoteID" />
            </SelectParameters>
            <UpdateParameters>
                <asp:QueryStringParameter Name="OnlineQuoteID" QueryStringField="OnlineQuoteID" Type="Int32" />
                <asp:Parameter Name="ServicesID" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Int16" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:Parameter Name="OnlineQuoteServiceID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
          
        <asp:Label ID="OnlineQuoteServiceIDLabel" runat="server" Text="Label" Visible="False"></asp:Label>
        
        <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource3" DataTextField="ServicesID" DataValueField="ServicesID" Height="1px" Width="1px"></asp:ListBox>
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT ServicesID FROM tblServices WHERE (ServiceType = 'D')"></asp:SqlDataSource>
    </div>

                        


    </form>
</body>
</html>
