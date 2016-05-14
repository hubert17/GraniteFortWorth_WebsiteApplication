<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Misc-leads.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.Misc_leads" %>

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

            <asp:ListView ID="ListView2" runat="server" DataKeyNames="LeadID" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:ImageButton ID="EditButton" runat="server"  CommandName="Edit"  ImageUrl="~/Images/edit_icon.png" />
                            <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" ImageUrl="~/Images/delete_icon.gif" OnClientClick='return confirm(&apos;About to delete. Are you sure?&apos;);' />
                        </td>
                        <td>
                            <asp:Label ID="LeadLabel" runat="server" Text='<%# Eval("Lead") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                        <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Save" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>

                        <td>
                            <asp:TextBox ID="LeadTextBox" runat="server" Text='<%# Bind("Lead") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
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
                        <td style="vertical-align:top;">
                            <asp:TextBox ID="LeadTextBox" runat="server" Text='<%# Bind("Lead") %>' />

                             <div style="margin-top:4px;margin-bottom:4px;"><asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Save" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                 </div>

                        </td>
                        <td style="vertical-align:top;">
                            <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
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
                            <asp:Label ID="LeadLabel" runat="server" Text='<%# Eval("Lead") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" class="measure-minimalist-b" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server" style="width:150px;"></th>
                                        <th runat="server" style="width:150px;">Lead</th>
                                        <th runat="server">Description</th>
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
                            <asp:Label ID="LeadLabel" runat="server" Text='<%# Eval("Lead") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblLeads] WHERE [LeadID] = ?" InsertCommand="INSERT INTO [tblLeads] ([LeadID], [Lead], [Description]) VALUES (?, ?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT [LeadID], [Lead], [Description] FROM [tblLeads]" UpdateCommand="UPDATE [tblLeads] SET [Lead] = ?, [Description] = ? WHERE [LeadID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="LeadID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="IDLabel" Name="LeadID" PropertyName="Text" Type="Int32" />
                    <asp:Parameter Name="Lead" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Lead" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:ControlParameter ControlID="ListView2" Name="LeadID" PropertyName="SelectedValue" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

     
     </div>
     </div>   
        

           
        <asp:Label ID="IDLabel" runat="server" Text="Label" Visible="False"></asp:Label>
        
   
           
    </div>
    </form>
</body>
</html>
