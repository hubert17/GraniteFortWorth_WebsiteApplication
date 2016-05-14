<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Misc-salesman.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.Misc_salesman" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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

            <asp:ListView ID="ListView2" runat="server" DataKeyNames="SalesManID" DataSourceID="SqlDataSource2" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:ImageButton ID="EditButton" runat="server"  CommandName="Edit"  ImageUrl="~/Images/edit_icon.png" />
                            <asp:ImageButton ID="DeleteButton" runat="server" Visible="false" CommandName="Delete" ImageUrl="~/Images/delete_icon.gif" OnClientClick='return confirm(&apos;About to delete. Are you sure?&apos;);' />
                        </td>

                    <td>
                        <asp:Label ID="SalesManNameLabel" runat="server" Text='<%# Eval("SalesManName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NotesLabel" runat="server" Text='<%# Eval("Notes") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="InactiveCheckBox" runat="server" Checked='<%# Eval("Inactive") %>' Enabled="false" />
                    </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                        <td>
                        </td>


                    <td style="vertical-align:top;">
                        <asp:TextBox ID="SalesManNameTextBox" runat="server" Text='<%# Bind("SalesManName") %>' />
                             <div style="margin-top:4px;margin-bottom:4px;"><asp:Button ID="InsertButton" runat="server" CommandName="Update" Text="Save" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                 </div>
                    </td>
                    <td style="vertical-align:top;">
                        <asp:TextBox ID="NotesTextBox" runat="server" Text='<%# Bind("Notes") %>' />
                    </td>
                        <td style="vertical-align:top;">
                            <asp:CheckBox ID="InactiveCheckBox" runat="server" Checked='<%# Bind("Inactive") %>' />
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
                        <asp:TextBox ID="SalesManNameTextBox" runat="server" Text='<%# Bind("SalesManName") %>' />
                             <div style="margin-top:4px;margin-bottom:4px;"><asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Save" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                 </div>
                    </td>
                    <td style="vertical-align:top;">
                        <asp:TextBox ID="NotesTextBox" runat="server" Text='<%# Bind("Notes") %>' />
                    </td>
                    <td style="vertical-align:top;">
                        <asp:CheckBox ID="InactiveCheckBox" runat="server" Visible="false"  />
                    </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:ImageButton ID="EditButton" runat="server"  CommandName="Edit"  ImageUrl="~/Images/edit_icon.png" />
                            <asp:ImageButton ID="DeleteButton" runat="server" Visible="false" CommandName="Delete" ImageUrl="~/Images/delete_icon.gif" OnClientClick='return confirm(&apos;About to delete. Are you sure?&apos;);' />
                        </td>
                    <td>
                        <asp:Label ID="SalesManNameLabel" runat="server" Text='<%# Eval("SalesManName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NotesLabel" runat="server" Text='<%# Eval("Notes") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="InactiveCheckBox" runat="server" Checked='<%# Eval("Inactive") %>' Enabled="false" />
                    </td>

                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table id="Table2" runat="server">
                        <tr id="Tr1" runat="server">
                            <td id="Td1" runat="server">
                                <table id="itemPlaceholderContainer" runat="server" class="measure-minimalist-b" border="0" style="">
                                    <tr id="Tr2" runat="server" style="">
                                        <th id="Th1" runat="server" style="width:150px;"></th>
                                        <th id="Th2" runat="server" style="width:150px;">Person Assigned Name</th>
                                        <th id="Th3" runat="server">Notes</th>
                                        <th id="Th4" runat="server" style="width:50px;">Inactive?</th>
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
                        <asp:Label ID="SalesManNameLabel" runat="server" Text='<%# Eval("SalesManName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NotesLabel" runat="server" Text='<%# Eval("Notes") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="InactiveCheckBox" runat="server" Checked='<%# Eval("Inactive") %>' Enabled="false" />
                    </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>

            

     
     </div>
     </div>   
        

           
        <asp:Label ID="IDLabel" runat="server" Text="Label" Visible="False"></asp:Label>
        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblSalesMen] WHERE [SalesManID] = ?" InsertCommand="INSERT INTO tblSalesMen(SalesManID, SalesManName, Notes) VALUES (?, ?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT SalesManID, SalesManName, Notes, Inactive FROM tblSalesMen" UpdateCommand="UPDATE tblSalesMen SET SalesManName = ?, Notes = ?, Inactive = ? WHERE (SalesManID = ?)">
            <DeleteParameters>
                <asp:Parameter Name="SalesManID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="IDLabel" Name="SalesManID" PropertyName="Text" Type="Int32" />
                <asp:Parameter Name="SalesManName" Type="String" />
                <asp:Parameter Name="Notes" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="SalesManName" Type="String" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="Inactive" Type="Boolean" />
                <asp:ControlParameter ControlID="ListView2" Name="SalesManID" PropertyName="SelectedValue" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
           
    </div>
    </form>
</body>
</html>
