<%@ Page Title="Enter Square Feet Quantity and select your Stone" Language="C#" MasterPageFile="~/SiteClassic.Master" AutoEventWireup="true" CodeBehind="OnlineQuote-granite.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.OnlineQuote_granite" ClientIDMode="AutoID" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="robots" content="noindex" />

            <!-- fancyBox -->
        <link rel="stylesheet" href="/FancyBox/css/jquery.fancybox.css?v=2.0.5" type="text/css" media="screen" />
        <script type="text/javascript" src="/FancyBox/js/jquery.fancybox.pack.js?v=2.0.5"></script>
    <style type="text/css">  
          .granite-absolute {


        	        width: 310px;
	        float: left;
	        background: #fff;
	        color: #777;
	        -webkit-box-shadow: 0px 0px 8px 2px #d1d1d1;
	        -moz-box-shadow: 0px 0px 8px 2px #d1d1d1;
	        box-shadow: 0px 0px 8px 2px #d1d1d1; 
	        -webkit-border-top-left-radius: 0px;
	        -webkit-border-top-right-radius: 0px;
	        -webkit-border-bottom-right-radius: 6px;
	        -webkit-border-bottom-left-radius: 6px;
	        -moz-border-radius-topleft: 0px;
	        -moz-border-radius-topright: 0px;
	        -moz-border-radius-bottomright: 6px;
	        -moz-border-radius-bottomleft: 6px;
	        border-top-left-radius: 0px;
	        border-top-right-radius: 0px;
	        border-bottom-right-radius: 6px;
	        border-bottom-left-radius: 6px; 
	        overflow: hidden;
            margin-top:22px;
    }

        .styled-select select {
           background: transparent;
           width: 268px;
           padding: 5px;
           font-size: 14px;
           line-height: 1;
           border: 0;
           border-radius: 0;
           height: 34px;
           -webkit-appearance: none;
         } 
        .styled-select {
           width: 240px;
           height: 34px;
           overflow: hidden;
           background: url(Images/down_arrow_select.jpg) no-repeat right #ddd;
           border: 1px solid #ccc;
         }

        .one-column-emphasis
        {
	        font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	        font-size: 12px;
	        margin-left: 30px;
	        width: 310px;
	        text-align: left;
	        border-collapse: collapse;
        }
        .one-column-emphasis th
        {
	        font-size: 14px;
	        font-weight: normal;
	        padding: 15px 0px;
	        color: #039;
            text-align:left;
        }
        .one-column-emphasis td
        {
	        padding: 5px 0px;
	        color: #669;
	        border-top: 1px solid #e8edff;
        }
        .oce-first
        {
	        background: #d0dafd;
	        border-right: 10px solid transparent;
	        border-left: 10px solid transparent;
        }
        .one-column-emphasis tr:hover td
        {
	        color: #339;
	        background: #eff2ff;
        }




        	.measure_left-rail {
		width:560px;
		position:absolute;
        top: 190px;
        left: 640px
	}

    #measureabsolute {
        display:none;
        position: absolute !important;
	    z-index: 2 !important;
        top: 310px !important;
        left: 380px !important;

        	        width: 450px;
	        float: left;
	        background: #fff;
	        color: #777;
	        -webkit-box-shadow: 0px 0px 8px 2px #d1d1d1;
	        -moz-box-shadow: 0px 0px 8px 2px #d1d1d1;
	        box-shadow: 0px 0px 8px 2px #d1d1d1; 
	        -webkit-border-top-left-radius: 0px;
	        -webkit-border-top-right-radius: 0px;
	        -webkit-border-bottom-right-radius: 6px;
	        -webkit-border-bottom-left-radius: 6px;
	        -moz-border-radius-topleft: 0px;
	        -moz-border-radius-topright: 0px;
	        -moz-border-radius-bottomright: 6px;
	        -moz-border-radius-bottomleft: 6px;
	        border-top-left-radius: 0px;
	        border-top-right-radius: 0px;
	        border-bottom-right-radius: 6px;
	        border-bottom-left-radius: 6px; 
	        overflow: hidden;
            margin-bottom:30px;
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


        <script type="text/javascript">
            var calcsrc = "i";

            function BoxLoader() {
                if (calcsrc == "i") {
                    $("#<%= ((TextBox)ListView0.InsertItem.FindControl("SquareFeetQtyTextBox")).ClientID %>").attr("value", document.getElementById('<%=  TotalSquareFootTextBox.ClientID%>').value);
                    $("#measureabsolute").hide();
                } else {
                        
                }
            }



    </script>

        <script type="text/javascript">
            function failingDivHide() {
                $("#tryHidingMe").hide();
            };

            function reallyHide() {
                $("#tryHidingMe").addClass("alwaysHide");
            };

            function successfulDivHide() {
                $("#iCanHide").hide();
            };

    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form id="form1" runat="server">
        <br />
    <h2>Online Quote System </h2>
    <div class="wrapper">
            &nbsp;
        <div class="granite-absolute" style="width:480px;">
        <div class="hcformtitle" style="width:480px;">STEP 3: Enter SF measure and select stone color.</div>


<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
        <asp:ListView ID="ListView0" runat="server" DataKeyNames="OnlineQuoteStoneID" DataSourceID="SqlDataSource0" InsertItemPosition="LastItem" OnItemCreated="ListView0_ItemCreated" OnItemDataBound="ListView0_ItemDataBound" OnItemInserting="ListView0_ItemInserting" OnItemInserted="ListView0_ItemInserted">
                <EditItemTemplate>
                    <tr style="">
                        <td>

                        </td>
                        <td>
                            <asp:DropDownList ID="SlabColorIDDropDownList" runat="server" DataSourceID="SqlDataSource2" DataTextField="SlabColorNamePrice" DataValueField="SlabColorID" SelectedValue='<%# Bind("SlabColorID") %>' AutoPostBack="True">
                            </asp:DropDownList>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT SlabColorID, SlabColorNamePrice FROM SlabColorNamePriceQry WHERE ((Discontinued = False) AND (SlabColorNamePrice NOT LIKE '$%'))"></asp:SqlDataSource>                            &nbsp;<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                              
                              <% =ShowSlabImage(((DropDownList)ListView0.EditItem.FindControl("SlabColorIDDropDownList")).SelectedValue,((DropDownList)ListView0.EditItem.FindControl("SlabColorIDDropDownList")).SelectedItem.Text) %>
                        </td>
                        <td style="text-align:center;">
                            <asp:TextBox ID="SquareFeetQtyTextBox" runat="server" Text='<%# Bind("SquareFeetQty") %>' Width="50px" />
                          </td></tr></EditItemTemplate>
            
            <InsertItemTemplate>

                  <tr style="">
                        <td></td>
                        <td colspan="2">
                        <div class="hcinput" style="padding-left:2px;margin-left:0px;">
				            <div class="hcinputtext">Square Feet Qty: </div><div class="hcinputcontent" >
                               <asp:TextBox ID="SquareFeetQtyTextBox" runat="server" Text='<%# Bind("SquareFeetQty") %>' Width="50px" /> &nbsp; &nbsp;<button id="show1" class="hcsmallbutton">Show SF Calculator</button></div></div><div class="hcinput" style="padding-left:2px;margin-left:0px;">
				            <div class="hcinputtext">Stone: </div><div class="hcinputcontent">
                                <div class="styled-select">
                                    <asp:DropDownList ID="SlabColorIDDropDownList" runat="server" DataSourceID="SqlDataSource2" DataTextField="SlabColorNamePrice" DataValueField="SlabColorID" SelectedValue='<%# Bind("SlabColorID") %>'  AppendDataBoundItems="true" AutoPostBack="True" CausesValidation="True">
                                         <asp:ListItem Value="-1">
                                           -- Choose a Stone --
                                        </asp:ListItem></asp:DropDownList></div>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT SlabColorID, SlabColorNamePrice FROM SlabColorNamePriceQry WHERE ((Discontinued = False) AND (SlabColorNamePrice NOT LIKE '$%'))"></asp:SqlDataSource>				            </div>
			            </div>

                         <div class="hcinput"style="padding-left:2px;margin-left:0px;">
				            <div class="hcinputtext">Preview Pic: </div><div class="hcinputcontent" style="height:auto;">
                                 <asp:Literal ID="SelectStoneRequiredLiteral" runat="server" Visible="false"><span style="color:red;">Please select a stone.<span></asp:Literal><% =ShowSlabImage(((DropDownList)ListView0.InsertItem.FindControl("SlabColorIDDropDownList")).SelectedValue,((DropDownList)ListView0.InsertItem.FindControl("SlabColorIDDropDownList")).SelectedItem.Text) %></div></div><div class="hcinputtext" style="padding-left:0px;margin-left:0px;">                                                                   
				            </div>
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Add more"  CssClass="hcsmallbutton" Visible="false" />
                                &nbsp;<asp:Button ID="CancelButton" runat="server" CommandName="Discard" Text="Clear" Visible="false" />
                            
			            </div>

                        </td>

                    </tr>

                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td style="text-align:center;">
                            <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" ImageUrl="~/Images/delete_icon.gif" OnClientClick='return confirm(&apos;About to delete. Are you sure?&apos;);' ToolTip="Click to remove this stone." />
                        </td>
                        <td>
                            <asp:LinkButton ID="LinkButton1" CommandName="Edit" runat="server" ToolTip="Click here to edit Stone Info."><asp:Label ID="Label1" runat="server" Text='<%# Eval("SlabColorNamePrice") %>' /></asp:LinkButton></td><td style="text-align:center;">                            
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# String.Format("OnlineQuote-measurement.aspx?OnlineQuoteStoneID={0}&OnlineQuoteID={1}", Eval("OnlineQuoteStoneID"), Request.QueryString["OnlineQuoteID"]) %>' ToolTip="Click here to enter detailed measure for this stone.">
                                <asp:Label ID="SquareFeetQtyLabel" runat="server" Text='<%# Eval("SquareFeetQty") %>' Width="50px" /></asp:HyperLink></td></tr></ItemTemplate><LayoutTemplate>
                    <table id="Table2" runat="server" >
                        <tr id="Tr1" runat="server">
                            <td id="Td1" runat="server">
                                <table id="itemPlaceholderContainer" runat="server" class="one-column-emphasis"  summary="Stone Color and SF Quantity">
                                    <colgroup>
    	                                <col class="oce-first" />
                                    </colgroup>
                                    <tbody>
                                    <tr id="itemPlaceholder" runat="server"></tr>
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
                            <asp:ImageButton ID="EditButton" runat="server"  CommandName="Edit"  ImageUrl="~/Images/edit_icon.png" />
                            <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" ImageUrl="~/Images/delete_icon.gif" />
                        </td>
                        <td>
                            <asp:Label ID="SlabColorIDLabel" runat="server" Text='<%# Eval("SlabColorID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="SquareFeetQtyLabel" runat="server" Text='<%# Eval("SquareFeetQty") %>' />
                        </td>
                        <td>
                            <asp:Label ID="OnlineQuoteStoneIDLabel" runat="server" Text='<%# Eval("OnlineQuoteStoneID") %>' Visible="false" />
                        </td>
                        <td>
                            <asp:Label ID="OnlineQuoteIDLabel" runat="server" Text='<%# Eval("OnlineQuoteID") %>' Visible="false" />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
</ContentTemplate></asp:UpdatePanel>


                        <div class="hcbuttons">
                             <asp:LinkButton ID="NextButton" runat="server" CausesValidation="True" Text="Next" CssClass="hcorangebutton" OnClick="NextButton_Click" />
                            &nbsp;<asp:LinkButton ID="BackButton" runat="server" CausesValidation="False" Text="Back" CssClass="hcgreybutton" OnClick="BackButton_Click"  /></div>
</div>

        <iframe src="OnlineQuote-granite-iframe.html" width="420" height="360" scrolling="no" seamless="seamless" style="padding-left:10px;padding-top:30px;" ></iframe>

</div>



    <div id="measureabsolute" style="width:380px;">
        <div class="hcformtitle" style="width:380px;">Enter measurement in inches (whole Numbers)</div><asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
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
                            <td>No data was returned.</td></tr></table></EmptyDataTemplate><InsertItemTemplate>
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
                                        <th id="Th2" runat="server" style="width:100px">Measure</th><th id="Th3" runat="server" style="width:50px">Length</th><th id="Th4" runat="server" style="width:50px">Width</th><th id="Th5" runat="server" style="width:50px">Area</th></tr></thead><tbody>
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
                <asp:Label ID="Label1" runat="server" Text="Total Square Inches: "></asp:Label><asp:TextBox ID="TotalSquareInchesTextBox" runat="server" style="text-align:right;"  BorderColor="Black" Width="40px"></asp:TextBox><br /><asp:Label ID="Label3" runat="server" Text="Divided by "></asp:Label><asp:Label ID="Label4" runat="server" Text="144"></asp:Label><br /><asp:Label ID="Label5" runat="server" Text="Total Square Foot: ">
                </asp:Label><asp:TextBox ID="TotalSquareFootTextBox" runat="server" style="text-align:right" BorderColor="Black" Width="40px"></asp:TextBox><br /><asp:Label ID="Label2" runat="server" Text="Total SF + 10%: "></asp:Label><asp:TextBox ID="TotalSquareFootTextBoxPlus10" runat="server" style="text-align:right" BorderColor="Black" Width="40px"></asp:TextBox></div></ContentTemplate></asp:UpdatePanel><div class="hcbuttons">
                 
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" Text="Close" CssClass="hcorangebutton" OnClientClick="BoxLoader();" />
                         </div>

</div>


 


       <asp:SqlDataSource ID="SqlDataSourcePromoLookup" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT SlabColorID, SlabColor + ' - $' + str(SlabPromoPrice) AS SlabColorNamePrice, Inactive FROM SlabPromoQry WHERE (Inactive = False) ORDER BY SlabColor + ' - $' + str(SlabPromoPrice)"></asp:SqlDataSource>				            </div>
   
                    
                        
                        
                        <asp:SqlDataSource ID="SqlDataSource0" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblOnlineQuoteStone] WHERE [OnlineQuoteStoneID] = ?" InsertCommand="INSERT INTO tblOnlineQuoteStone(OnlineQuoteStoneID, OnlineQuoteID, SlabColorID, SquareFeetQty, FabPricePrintOveride) VALUES (?, ?, ?, ?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT tblOnlineQuoteStone.OnlineQuoteStoneID, tblOnlineQuoteStone.OnlineQuoteID, tblOnlineQuoteStone.SlabColorID, tblOnlineQuoteStone.SquareFeetQty, SlabColorNamePriceQry.SlabColorNamePrice FROM (tblOnlineQuoteStone LEFT OUTER JOIN SlabColorNamePriceQry ON tblOnlineQuoteStone.SlabColorID = SlabColorNamePriceQry.SlabColorID) WHERE (tblOnlineQuoteStone.OnlineQuoteID = ?)" UpdateCommand="UPDATE [tblOnlineQuoteStone] SET [OnlineQuoteID] = ?, [SlabColorID] = ?, [SquareFeetQty] = ? WHERE [OnlineQuoteStoneID] = ?"><DeleteParameters>
                    <asp:Parameter Name="OnlineQuoteStoneID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="OnlineQuoteStoneIDLabel" Name="OnlineQuoteStoneID" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="OnlineQuoteID" PropertyName="Text" Type="Int32" />
                    <asp:Parameter Name="SlabColorID" Type="String" />
                    <asp:Parameter Name="SquareFeetQty" Type="Int32" />
                    <asp:Parameter DefaultValue="" Name="FabPricePrintOveride" /></InsertParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="?" /></SelectParameters>
                <UpdateParameters>
                    <asp:QueryStringParameter Name="OnlineQuoteID" QueryStringField="OnlineQuoteID" Type="Int32" />
                    <asp:Parameter Name="SlabColorID" Type="String" />
                    <asp:Parameter Name="SquareFeetQty" Type="Int32" />
                    <asp:Parameter Name="OnlineQuoteStoneID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>





        
        
        
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblOnlineQuotesMeasures] WHERE [OnlineQuoteMeasureID] = ?" InsertCommand="INSERT INTO [tblOnlineQuotesMeasures] ([OnlineQuoteMeasureID], [OnlineQuoteStoneID], [Measure], [Length], [Width]) VALUES (?, ?, ?, ?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteMeasureID, OnlineQuoteStoneID, Measure, Length, Width, Length * Width AS Area FROM tblOnlineQuotesMeasures WHERE (OnlineQuoteStoneID = ?)" UpdateCommand="UPDATE [tblOnlineQuotesMeasures] SET [OnlineQuoteStoneID] = ?, [Measure] = ?, [Length] = ?, [Width] = ? WHERE [OnlineQuoteMeasureID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="OnlineQuoteMeasureID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="OnlineQuoteMeasureIDLabel" Name="OnlineQuoteMeasureID" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="OnlineQuoteStoneIDLabel" Name="OnlineQuoteStoneID" PropertyName="Text" Type="Int32" /><asp:Parameter Name="Measure" Type="String" />
                    <asp:Parameter Name="Length" Type="Int32" />
                    <asp:Parameter Name="Width" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="OnlineQuoteStoneIDLabel" Name="?" PropertyName="Text" /></SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="OnlineQuoteStoneIDLabel" Name="OnlineQuoteStoneID" PropertyName="Text" Type="Int32" /><asp:Parameter Name="Measure" Type="String" />
                    <asp:Parameter Name="Length" Type="Int32" />
                    <asp:Parameter Name="Width" Type="Int32" />
                    <asp:Parameter Name="OnlineQuoteMeasureID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        





                                    

        
            

 





        <asp:Label ID="OnlineQuoteMeasureIDLabel" runat="server" Text="Label" Visible="False"></asp:Label><asp:Label ID="OnlineQuoteStoneIDLabel" runat="server" Text="Label" Visible="False"></asp:Label><asp:Label ID="OnlineQuoteIDLabel" runat="server" Text="Label" Visible="False"></asp:Label><script type="text/javascript">
            function getParameterByName(name) {
                name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
                var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                    results = regex.exec(location.search);
                return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
            }

            $(document).ready(function () {
                if (getParameterByName('SlabColorID') != 'null') {
                    var ddlSlabColorID = document.getElementById('<%= ((DropDownList)ListView0.InsertItem.FindControl("SlabColorIDDropDownList")).ClientID %>');
                    ddlSlabColorID.value = getParameterByName('SlabColorID');
                    //ddlSlabColorID.disabled = true;
                    var SlabImage = document.getElementById('imgSlab');
                    SlabImage.setAttribute('src', 'images/Slabs/thumb/' + getParameterByName('img'));
                }

                $("#hide").click(function () {
                    $("#measureabsolute").hide();
                });
                $("#show1").click(function () {
                    $("#measureabsolute").css({
                        top: event.pageY + 5 + "px",
                        left: event.pageX + 20 + "px"
                    }).fadeIn('slow');
                    calcsrc = "i";
                });
                $("#show2").click(function () {
                    $("#measureabsolute").css({
                        top: event.pageY + 5 + "px",
                        left: event.pageX + 20 + "px"
                    }).fadeIn('slow');
                    calcsrc = "e";
                });

            $(".fancybox").fancybox({
                openEffect: 'fade',
                closeEffect: 'fade',
                nextEffect: 'elastic',
                prevEffect: 'elastic',
                helpers: {
                    title: {
                        type: 'float'
                    }
                }
            });
        });
                            </script><script>
            $(window).load(function () {
                // executes when complete page is fully loaded, including all frames, objects and images
            });
        </script></form></asp:Content>