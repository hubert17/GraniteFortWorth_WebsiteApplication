<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Jobs-measure.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.Jobs_measure" %>

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
        height:250px;
        overflow:scroll;
        overflow-x:hidden;
    }

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
            Granite:&nbsp; <asp:DropDownList ID="SlabColorIDDropDownList" runat="server" DataSourceID="SqlDataSource2" DataTextField="SlabColorNamePrice" DataValueField="OnlineQuoteStoneID"  AppendDataBoundItems="True" AutoPostBack="True" CausesValidation="True" Width="200px" OnSelectedIndexChanged="SlabColorIDDropDownList_SelectedIndexChanged">
                            <asp:ListItem Value="-1">
                            -- New Measurement set --
                        </asp:ListItem>
                            </asp:DropDownList></div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT tblOnlineQuoteStone.OnlineQuoteStoneID, SlabColorNamePriceQry.SlabColorNamePrice, tblOnlineQuoteStone.OnlineQuoteID FROM (SlabColorNamePriceQry INNER JOIN tblOnlineQuoteStone ON SlabColorNamePriceQry.SlabColorID = tblOnlineQuoteStone.SlabColorID) WHERE (tblOnlineQuoteStone.OnlineQuoteID = ?)">
            <SelectParameters>
                <asp:QueryStringParameter Name="?" QueryStringField="OnlineQuoteID" />
            </SelectParameters>
        </asp:SqlDataSource>   
        
        <div class="DivToScroll">
        <div class="DivWithScroll">  
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="OnlineQuoteMeasureID" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem" OnItemDeleted="ListView1_ItemDeleted" OnItemInserted="ListView1_ItemInserted" OnItemUpdated="ListView1_ItemUpdated" OnItemInserting="ListView1_ItemInserting" >
                <AlternatingItemTemplate>
                    <tr style="">
                        <td style="width:50px;text-align:center">
                            <asp:ImageButton ID="EditButton" runat="server"  CommandName="Edit"  ImageUrl="~/Images/edit_icon.png" />
                            <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" ImageUrl="~/Images/delete_icon.gif" OnClientClick='return confirm(&apos;About to delete. Are you sure?&apos;);' />
                        </td>
                        <td style="width:100px;">
                            <asp:Label ID="MeasureLabel" runat="server" Text='<%# Eval("Measure") %>' />
                        </td>
                        <td style="width:50px;">
                            <asp:Label ID="LengthLabel" runat="server" Text='<%# Eval("LengthFT","{0:0.###}") %>' />
                        </td>
                        <td style="width:50px;">
                            <asp:Label ID="WidthLabel" runat="server" Text='<%# Eval("WidthFT","{0:0.###}") %>' />
                        </td>
                        <td style="width:50px;">
                            <asp:Label ID="AreaLabel" runat="server" Text='<%# Eval("Area","{0:0.###}") %>'  />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                        <td style="width:50px;">
                        </td>
                        <td style="width:100px;">
                            <asp:DropDownList ID="MeasureTextBox" runat="server" DataSourceID="SqlDataSource2" DataTextField="AssetName" DataValueField="AssetName" SelectedValue='<%# Bind("Measure") %>' ></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [AssetName] FROM [tblMeasureAssets]"></asp:SqlDataSource>


                        </td>
                        <td style="width:50px;">
                            <asp:TextBox ID="LengthTextBox" runat="server" Text='<%# Bind("LengthFT","{0:0.###}") %>'  Width="60px"  />
                        </td>
                        <td style="width:50px;">
                            <asp:TextBox ID="WidthTextBox" runat="server" Text='<%# Bind("WidthFT","{0:0.###}") %>'  Width="60px"  />
                        </td>
                        <td style="width:50px;">
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" CssClass="hcsmallbutton" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
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
                        <td style="width:50px;"></td>
                        <td style="width:100px;">
                            <asp:DropDownList ID="MeasureTextBox" runat="server" DataSourceID="SqlDataSource2" DataTextField="AssetName" DataValueField="AssetName" SelectedValue='<%# Bind("Measure") %>' ></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [AssetName] FROM [tblMeasureAssets]"></asp:SqlDataSource>



                        </td>
                        <td style="width:50px;">
                            <asp:TextBox ID="LengthTextBox" runat="server" Text='<%# Bind("Length") %>' Width="60px" />
                        </td>
                        <td style="width:50px;">
                            <asp:TextBox ID="WidthTextBox" runat="server" Text='<%# Bind("Width") %>'  Width="60px"  />
                        </td>
                        <td style="width:50px;">
                                 <asp:Button ID="Button1" runat="server" CommandName="Insert" Text="Save" CssClass="hcsmallbutton" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td style="width:50px;text-align:center">
                            <asp:ImageButton ID="EditButton" runat="server"  CommandName="Edit"  ImageUrl="~/Images/edit_icon.png" />
                            <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" ImageUrl="~/Images/delete_icon.gif" OnClientClick='return confirm(&apos;About to delete. Are you sure?&apos;);' />
                        </td>
                        <td style="width:100px;">
                            <asp:Label ID="MeasureLabel" runat="server" Text='<%# Eval("Measure") %>' />
                        </td>
                        <td style="width:50px;">
                            <asp:Label ID="LengthLabel" runat="server" Text='<%# Eval("LengthFT","{0:0.###}") %>' />
                        </td>
                        <td style="width:50px;">
                            <asp:Label ID="WidthLabel" runat="server" Text='<%# Eval("WidthFT","{0:0.###}") %>' />
                        </td>
                        <td style="width:50px;">
                            <asp:Label ID="AreaLabel" runat="server" Text='<%# Eval("Area","{0:0.###}") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table id="Table2" runat="server">
                        <tr id="Tr1" runat="server">
                            <td id="Td1" runat="server">
                                <table id="itemPlaceholderContainer" class="measure-minimalist-b" runat="server" border="0" style="">
                                <thead>
                                    <tr id="Tr2" runat="server" style="">
                                        <th id="Th1" runat="server" style="width:50px"></th>
                                        <th id="Th2" runat="server" style="width:100px">Measure</th>
                                        <th id="Th3" runat="server" style="width:50px">Length</th>
                                        <th id="Th4" runat="server" style="width:50px">Width</th>
                                        <th id="Th5" runat="server" style="width:50px">Area</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr3" runat="server">
                            <td id="Td2" runat="server" style=""></td>
                        </tr>
                    </table>
                </LayoutTemplate>                
            </asp:ListView>
        </div>
        </div>

        <br />
            <div style="text-align:right;padding-right:10px;">
                
                
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Text="Total SF: "></asp:Label><asp:TextBox ID="TotalSquareFootTextBox" runat="server" style="text-align:right" BorderColor="Black" Width="60px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="Total SF + 10%: "></asp:Label><asp:TextBox ID="TotalSquareFootTextBoxPlus10" runat="server" style="text-align:right" BorderColor="Black" Width="60px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Grand Total SF: "></asp:Label><asp:TextBox ID="GrandTotalSquareFootTextBox" runat="server" style="text-align:right" BorderColor="Black" Width="60px"></asp:TextBox>
            </div>
        
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblOnlineQuotesMeasures] WHERE [OnlineQuoteMeasureID] = ?" InsertCommand="INSERT INTO tblOnlineQuotesMeasures(OnlineQuoteMeasureID, OnlineQuoteStoneID, Measure, Length, Width, OnlineQuoteID) VALUES (?, ?, ?, ? * 144, ? * 144, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteMeasureID, OnlineQuoteStoneID, Measure, Length / 144 AS LengthFT, Width / 144 AS WidthFT, LengthFT * WidthFT / 144 AS Area, Length, Width, OnlineQuoteID FROM tblOnlineQuotesMeasures WHERE (OnlineQuoteStoneID = ?) AND (OnlineQuoteID = ?)" UpdateCommand="UPDATE tblOnlineQuotesMeasures SET OnlineQuoteStoneID = ?, Measure = ?, Length = ? * 144, Width = ? * 144 WHERE (OnlineQuoteMeasureID = ?)">
                <DeleteParameters>
                    <asp:Parameter Name="OnlineQuoteMeasureID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="OnlineQuoteMeasureID" Type="Int32" />
                    <asp:ControlParameter ControlID="SlabColorIDDropDownList" Name="OnlineQuoteStoneID" PropertyName="SelectedValue" Type="Int32" />
                    <asp:Parameter Name="Measure" Type="String" />
                    <asp:Parameter Name="Length" Type="Single" />
                    <asp:Parameter Name="Width" Type="Single" />
                    <asp:QueryStringParameter Name="?" QueryStringField="OnlineQuoteID" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="SlabColorIDDropDownList" Name="?" PropertyName="SelectedValue" />
                    <asp:QueryStringParameter Name="?" QueryStringField="OnlineQuoteID" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="SlabColorIDDropDownList" Name="OnlineQuoteStoneID" PropertyName="SelectedValue" Type="Int32" />
                    <asp:Parameter Name="Measure" Type="String" />
                    <asp:Parameter Name="LengthFT" Type="Single" />
                    <asp:Parameter Name="WidthFT" Type="Single" />
                    <asp:Parameter Name="OnlineQuoteMeasureID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>           



    </form>
</body>
</html>
