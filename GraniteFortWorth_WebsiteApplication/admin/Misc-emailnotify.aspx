<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Misc-emailnotify.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.Misc_emailnotify" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="robots" content="noindex" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/style_iframe.css" />

    <style>

    *{
        border: none;
    }
	.measure_left-rail
    {
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
            
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="Email" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem" >
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:ImageButton ID="EditButton" runat="server"  CommandName="Edit"  ImageUrl="~/Images/edit_icon.png" />
                            <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" ImageUrl="~/Images/delete_icon.gif" OnClientClick='return confirm(&apos;About to delete. Are you sure?&apos;);' />

                        </td>
                        <td>
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AccountNameLabel" runat="server" Text='<%# Eval("AccountName") %>' />
                        </td>
                        <td>
                            <asp:CheckBox ID="NotifyCustomerQuoteCheckBox" runat="server" Checked='<%# Eval("NotifyCustomerQuote") %>' Enabled="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="NotifyAdminQuoteCheckBox" runat="server" Checked='<%# Eval("NotifyAdminQuote") %>' Enabled="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="NotifyWorkOrderCheckBox" runat="server" Checked='<%# Eval("NotifyWorkOrder") %>' Enabled="false" />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                        <td>
                        </td>
                        <td style="vertical-align:top;">
                            <asp:Label ID="EmailLabel1" runat="server" Text='<%# Eval("Email") %>' />
                                                             <div style="margin-top:4px;margin-bottom:4px;"><asp:Button ID="InsertButton" runat="server" CommandName="Update" Text="Save" />
                                <asp:Button ID="Button1" runat="server" CommandName="Cancel" Text="Cancel" />
                                     </div>
                        </td>
                        <td style="vertical-align:top;">
                            <asp:TextBox ID="AccountNameTextBox" runat="server" Text='<%# Bind("AccountName") %>' />
                        </td>
                        <td style="vertical-align:top;">
                            <asp:CheckBox ID="NotifyCustomerQuoteCheckBox" runat="server" Checked='<%# Bind("NotifyCustomerQuote") %>' />
                        </td>
                        <td style="vertical-align:top;">
                            <asp:CheckBox ID="NotifyAdminQuoteCheckBox" runat="server" Checked='<%# Bind("NotifyAdminQuote") %>' />
                        </td>
                        <td style="vertical-align:top;">
                            <asp:CheckBox ID="NotifyWorkOrderCheckBox" runat="server" Checked='<%# Bind("NotifyWorkOrder") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table id="Table1" runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                        </td>
                        <td style="vertical-align:top;">
                            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                                                         <div style="margin-top:4px;margin-bottom:4px;"><asp:Button ID="Button2" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="Button3" runat="server" CommandName="Cancel" Text="Clear" />
                                 </div>
                        </td>
                        <td style="vertical-align:top;">
                            <asp:TextBox ID="AccountNameTextBox" runat="server" Text='<%# Bind("AccountName") %>' Width="200px" />
                        </td>
                        <td style="vertical-align:top;">
                            <asp:CheckBox ID="NotifyCustomerQuoteCheckBox" runat="server" Checked='<%# Bind("NotifyCustomerQuote") %>' />
                        </td>
                        <td style="vertical-align:top;">
                            <asp:CheckBox ID="NotifyAdminQuoteCheckBox" runat="server" Checked='<%# Bind("NotifyAdminQuote") %>' />
                        </td>
                        <td style="vertical-align:top;">
                            <asp:CheckBox ID="NotifyWorkOrderCheckBox" runat="server" Checked='<%# Bind("NotifyWorkOrder") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:ImageButton ID="EditButton" runat="server"  CommandName="Edit"  ImageUrl="~/Images/edit_icon.png" />
                              <asp:ImageButton ID="DeleteButton" runat="server"  CommandName="Delete" ImageUrl="~/Images/delete_icon.gif" OnClientClick='return confirm(&apos;About to delete. Are you sure?&apos;);' />
                        </td>
                        <td>
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AccountNameLabel" runat="server" Text='<%# Eval("AccountName") %>' />
                        </td>
                        <td>
                            <asp:CheckBox ID="NotifyCustomerQuoteCheckBox" runat="server" Checked='<%# Eval("NotifyCustomerQuote") %>' Enabled="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="NotifyAdminQuoteCheckBox" runat="server" Checked='<%# Eval("NotifyAdminQuote") %>' Enabled="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="NotifyWorkOrderCheckBox" runat="server" Checked='<%# Eval("NotifyWorkOrder") %>' Enabled="false" />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table id="Table2" runat="server">
                        <tr id="Tr1" runat="server">
                            <td id="Td1" runat="server">
                                <table id="itemPlaceholderContainer" runat="server" class="measure-minimalist-b" border="0" style="">
                                    <tr id="Tr2" runat="server" style="">
                                        <th id="Th1" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                        <th id="Th2" runat="server">Email</th>
                                        <th id="Th3" runat="server">Account Name</th>
                                        <th id="Th4" runat="server">Notify Customer Quote</th>
                                        <th id="Th5" runat="server">Notify Admin Quote</th>
                                        <th id="Th6" runat="server">Notify Work Order</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr3" runat="server">
                            <td id="Td2" runat="server" style=""></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AccountNameLabel" runat="server" Text='<%# Eval("AccountName") %>' />
                        </td>
                        <td>
                            <asp:CheckBox ID="NotifyCustomerQuoteCheckBox" runat="server" Checked='<%# Eval("NotifyCustomerQuote") %>' Enabled="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="NotifyAdminQuoteCheckBox" runat="server" Checked='<%# Eval("NotifyAdminQuote") %>' Enabled="false" />
                        </td>
                        <td>
                            <asp:CheckBox ID="NotifyWorkOrderCheckBox" runat="server" Checked='<%# Eval("NotifyWorkOrder") %>' Enabled="false" />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
     </div>
     </div>   
        

           
     <asp:Label ID="IDLabel" runat="server" Text="Label" Visible="False"></asp:Label>
        
    </div>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblEmailNotify] WHERE [Email] = ?" InsertCommand="INSERT INTO [tblEmailNotify] ([Email], [AccountName], [NotifyCustomerQuote], [NotifyAdminQuote], [NotifyWorkOrder]) VALUES (?, ?, ?, ?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT [Email], [AccountName], [NotifyCustomerQuote], [NotifyAdminQuote], [NotifyWorkOrder] FROM [tblEmailNotify]" UpdateCommand="UPDATE tblEmailNotify SET AccountName = ?, NotifyCustomerQuote = ?, NotifyAdminQuote = ?, NotifyWorkOrder = ? WHERE (Email = ?) OR (Email IS NULL)">
            <DeleteParameters>
                <asp:Parameter Name="Email" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="AccountName" Type="String" />
                <asp:Parameter Name="NotifyCustomerQuote" Type="Boolean" />
                <asp:Parameter Name="NotifyAdminQuote" Type="Boolean" />
                <asp:Parameter Name="NotifyWorkOrder" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="AccountName" Type="String" />
                <asp:Parameter Name="NotifyCustomerQuote" Type="Boolean" />
                <asp:Parameter Name="NotifyAdminQuote" Type="Boolean" />
                <asp:Parameter Name="NotifyWorkOrder" Type="Boolean" />
                <asp:Parameter Name="Email" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>


    </form>
</body>
</html>
