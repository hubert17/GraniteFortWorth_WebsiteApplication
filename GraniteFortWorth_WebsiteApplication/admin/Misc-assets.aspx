<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Misc-assets.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.Misc_assets" %>

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

            <asp:ListView ID="ListView2" runat="server" DataKeyNames="MeasureAssetID" DataSourceID="SqlDataSource2" InsertItemPosition="LastItem" OnItemInserted="ListView2_ItemInserted">
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:ImageButton ID="EditButton" runat="server"  CommandName="Edit"  ImageUrl="~/Images/edit_icon.png" />
                            <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" ImageUrl="~/Images/delete_icon.gif" OnClientClick='return confirm(&apos;About to delete. Are you sure?&apos;);' />
                        </td>
                    <td>
                        <asp:Label ID="AssetNameLabel" runat="server" Text='<%# Eval("AssetName") %>' />
                    </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                        <td>
                        </td>
                        <td style="vertical-align:top;">
                        <asp:TextBox ID="AssetNameTextBox" runat="server" Text='<%# Bind("AssetName") %>' />

                             <div style="margin-top:4px;margin-bottom:4px;"><asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Save" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                 </div>

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
                        <asp:TextBox ID="AssetNameTextBox" runat="server" Text='<%# Bind("AssetName") %>' />

                             <div style="margin-top:4px;margin-bottom:4px;"><asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Save" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                 </div>

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
                        <asp:Label ID="AssetNameLabel" runat="server" Text='<%# Eval("AssetName") %>' />
                    </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table id="Table2" runat="server">
                        <tr id="Tr1" runat="server">
                            <td id="Td1" runat="server">
                                <table id="itemPlaceholderContainer" runat="server" class="measure-minimalist-b" border="0" style="">
                                    <tr id="Tr2" runat="server" style="">
                                        <th id="Th1" runat="server" style="width:50px;"></th>
                                        <th id="Th2" runat="server" style="width:150px;">Asset Name</th>
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
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="MeasureAssetIDLabel" runat="server" Text='<%# Eval("MeasureAssetID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AssetNameLabel" runat="server" Text='<%# Eval("AssetName") %>' />
                    </td>
                </tr>
                </SelectedItemTemplate>
            </asp:ListView>

            
     
     </div>
     </div>   
        

           
        <asp:Label ID="IDLabel" runat="server" Text="Label" Visible="False"></asp:Label>
        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM tblMeasureAssets WHERE (MeasureAssetID = ?)" InsertCommand="INSERT INTO [tblMeasureAssets] ([MeasureAssetID], [AssetName]) VALUES (?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT [MeasureAssetID], [AssetName] FROM [tblMeasureAssets] WHERE Inactive=False" UpdateCommand="UPDATE [tblMeasureAssets] SET [AssetName] = ? WHERE (([MeasureAssetID] = ?) OR ([MeasureAssetID] IS NULL AND ? IS NULL))" OnInserted="SqlDataSource2_Inserted">
            <DeleteParameters>
                <asp:Parameter Name="MeasureAssetID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="IDLabel" Name="MeasureAssetID" PropertyName="Text" Type="Int32" />
                <asp:Parameter Name="AssetName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="AssetName" Type="String" />
                <asp:Parameter Name="MeasureAssetID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
           
    </div>
    </form>
</body>
</html>

