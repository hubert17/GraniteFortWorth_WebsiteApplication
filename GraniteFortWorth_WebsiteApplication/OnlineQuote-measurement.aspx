<%@ Page Title="" Language="C#" MasterPageFile="~/SiteClassic.Master" AutoEventWireup="true" CodeBehind="OnlineQuote-measurement.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.OnlineQuote_measurement" ClientIDMode="AutoID" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<meta name="robots" content="noindex" />

<script type="text/javascript" src="http://www.granitesouthlake.com/CountertopMeasure/swfobject.js"></script>
    <style>
	.measure_left-rail {
		width:560px;
		float:left;
	}

    .measure-minimalist-b
    {
	    font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	    font-size: 12px;
	    background: #fff;
	    margin: 10px;
	    width: 360px;
	    border-collapse: collapse;
	    text-align: left;
    }
    .measure-minimalist-b th
    {
	    font-size: 14px;
	    font-weight: normal;
	    color: #039;
	    padding: 0px 0px;
	    border-bottom: 2px solid #6678b1;
        text-align:left;
    }
    .measure-minimalist-b td
    {
	    border-bottom: 1px solid #ccc;
	    color: #669;
	    padding: 2px 0px;
        text-align:left;
    }
    .measure-minimalist-b tbody tr:hover td
    {
	    color: #009;
        background: #eff2ff;
    }


</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form id="form1" runat="server">
   <h2>Enter Your Measurements <em style="font-size:small">[Under&nbsp; construction]</em></h2>
    <div class="wrapper">
            &nbsp;

        		<div class="measure_left-rail">
			
			<div id="video"></div>
		</div>
		
		<script type="text/javascript">
		    $(document).ready(function () {
		        var so = new SWFObject('http://ext.homedepot.com/shopping-tools/countertops/web/flash/player.swf', 'Countertop_Estimator', '540', '440', '9', '#f6f6f6');
		        so.useExpressInstall('http://www.granitesouthlake.com/CountertopMeasure/expressinstall.swf');
		        so.addParam("wmode", "transparent");
		        so.addVariable("rsID", "homedepot");
		        //so.addVariable('imgPath','/images/Our-Brands/qa-lab_play-btn.jpg');
		        so.write('video');
		    });
</script>


<div class="hcform1" style="width:380px;">
        <div class="hcformtitle" style="width:380px;">Enter measurement in inches (whole Numbers)</div>

<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="OnlineQuoteMeasureID" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem" OnItemDeleted="ListView1_ItemDeleted" OnItemInserted="ListView1_ItemInserted" OnItemUpdated="ListView1_ItemUpdated">
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
                            <asp:Label ID="LengthLabel" runat="server" Text='<%# Eval("Length") %>' />
                        </td>
                        <td style="width:50px;">
                            <asp:Label ID="WidthLabel" runat="server" Text='<%# Eval("Width") %>' />
                        </td>
                        <td style="width:50px;">
                            <asp:Label ID="AreaLabel" runat="server" Text='<%# Eval("Area") %>' />
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
                            <br /><asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" CssClass="hcsmallbutton" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />

                        </td>
                        <td style="width:50px;">
                            <asp:TextBox ID="LengthTextBox" runat="server" Text='<%# Bind("Length") %>'  Width="40px"  />
                        </td>
                        <td style="width:50px;">
                            <asp:TextBox ID="WidthTextBox" runat="server" Text='<%# Bind("Width") %>'  Width="40px"  />
                        </td>
                        <td style="width:50px;"></td>
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

                                <br /><asp:Button ID="Button1" runat="server" CommandName="Insert" Text="Add" CssClass="hcsmallbutton" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CommandName="Cancel" Text="Clear" />

                        </td>
                        <td style="width:50px;">
                            <asp:TextBox ID="LengthTextBox" runat="server" Text='<%# Bind("Length") %>' Width="40px" />
                        </td>
                        <td style="width:50px;">
                            <asp:TextBox ID="WidthTextBox" runat="server" Text='<%# Bind("Width") %>'  Width="40px"  />
                        </td>
                        <td style="width:50px;"></td>
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
                            <asp:Label ID="LengthLabel" runat="server" Text='<%# Eval("Length") %>' />
                        </td>
                        <td style="width:50px;">
                            <asp:Label ID="WidthLabel" runat="server" Text='<%# Eval("Width") %>' />
                        </td>
                        <td style="width:50px;">
                            <asp:Label ID="AreaLabel" runat="server" Text='<%# Eval("Area") %>' />
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
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="MeasureLabel" runat="server" Text='<%# Eval("Measure") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LengthLabel" runat="server" Text='<%# Eval("Length") %>' />
                        </td>
                        <td>
                            <asp:Label ID="WidthLabel" runat="server" Text='<%# Eval("Width") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AreaLabel" runat="server" Text='<%# Eval("Area") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <div style="text-align:right;padding-right:10px;">
                <asp:Label ID="Label1" runat="server" Text="Total Square Inches: "></asp:Label><asp:TextBox ID="TotalSquareInchesTextBox" runat="server" style="text-align:right;"  BorderColor="Black" Width="40px"></asp:TextBox> <br />
                <asp:Label ID="Label3" runat="server" Text="Divided by "></asp:Label><asp:Label ID="Label4" runat="server" Text="144"></asp:Label><br />
                <asp:Label ID="Label5" runat="server" Text="Total Square Foot: "></asp:Label><asp:TextBox ID="TotalSquareFootTextBox" runat="server" style="text-align:right" BorderColor="Black" Width="40px"></asp:TextBox><br />
                <asp:Label ID="Label2" runat="server" Text="Total SF + 10%: "></asp:Label><asp:TextBox ID="TotalSquareFootTextBoxPlus10" runat="server" style="text-align:right" BorderColor="Black" Width="40px"></asp:TextBox>

            </div>
</ContentTemplate>
</asp:UpdatePanel>
                    <div class="hcbuttons">
                             <asp:LinkButton ID="NextButton" runat="server" CausesValidation="True" Text="Return to Stone entry" CssClass="hcorangebutton" OnClick="NextButton_Click" />
                                                    &nbsp;<asp:LinkButton ID="BackButton" runat="server" CausesValidation="False" Text="Cancel" CssClass="hcgreybutton" OnClick="BackButton_Click" /></div>
                            

                    </div>
        
        
        
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblOnlineQuotesMeasures] WHERE [OnlineQuoteMeasureID] = ?" InsertCommand="INSERT INTO [tblOnlineQuotesMeasures] ([OnlineQuoteMeasureID], [OnlineQuoteStoneID], [Measure], [Length], [Width]) VALUES (?, ?, ?, ?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteMeasureID, OnlineQuoteStoneID, Measure, Length, Width, Length * Width AS Area FROM tblOnlineQuotesMeasures WHERE (OnlineQuoteStoneID = ?)" UpdateCommand="UPDATE [tblOnlineQuotesMeasures] SET [OnlineQuoteStoneID] = ?, [Measure] = ?, [Length] = ?, [Width] = ? WHERE [OnlineQuoteMeasureID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="OnlineQuoteMeasureID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="OnlineQuoteMeasureIDLabel" Name="OnlineQuoteMeasureID" PropertyName="Text" Type="Int32" />
                    <asp:QueryStringParameter Name="OnlineQuoteStoneID" QueryStringField="OnlineQuoteStoneID" Type="Int32" />
                    <asp:Parameter Name="Measure" Type="String" />
                    <asp:Parameter Name="Length" Type="Int32" />
                    <asp:Parameter Name="Width" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="?" QueryStringField="OnlineQuoteStoneID" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:QueryStringParameter Name="OnlineQuoteStoneID" QueryStringField="OnlineQuoteStoneID" Type="Int32" />
                    <asp:Parameter Name="Measure" Type="String" />
                    <asp:Parameter Name="Length" Type="Int32" />
                    <asp:Parameter Name="Width" Type="Int32" />
                    <asp:Parameter Name="OnlineQuoteMeasureID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        
        
        
        </div>

    </div>
<asp:Label ID="OnlineQuoteMeasureIDLabel" runat="server" Text="Label" Visible="False"></asp:Label>

    </form>
</asp:Content>
