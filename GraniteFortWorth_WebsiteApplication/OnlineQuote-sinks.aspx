<%@ Page Title="SELECT SINKS" Language="C#" MasterPageFile="~/SiteClassic.Master" AutoEventWireup="true" CodeBehind="OnlineQuote-sinks.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.OnlineQuote_sinks1" ClientIDMode="AutoID" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="robots" content="noindex" />

            <!-- fancyBox -->
        <link rel="stylesheet" href="/FancyBox/css/jquery.fancybox.css?v=2.0.5" type="text/css" media="screen" />
        <script type="text/javascript" src="/FancyBox/js/jquery.fancybox.pack.js?v=2.0.5"></script>

    <style type="text/css">  
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
	        margin: 0px;
	        width: 600px;
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

    </style>


        <script language="javascript">
            function CheckText(e, text) {
                if (e.value == text) {
                    e.value = '';
                }
            }
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form id="form1" runat="server">
    <h2>Online Quote System </h2>
    <div class="wrapper">
            &nbsp;
        <div class="hcform1" style="width:600px;">
        <div class="hcformtitle" style="width:600px;">STEP 3: Select a sink.</div>

<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
<ContentTemplate>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="OnlineQuoteSinkID" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem" OnItemInserting="ListView1_ItemInserting" OnItemCommand="ListView1_ItemCommand">
        <AlternatingItemTemplate>
                    <tr style="">
                        <td style="text-align:center;">
                            <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" ImageUrl="~/Images/delete_icon.gif" OnClientClick='return confirm(&apos;About to delete. Are you sure?&apos;);' ToolTip="Click to remove this Sink." />
                        </td>
                        <td>
                            <asp:LinkButton ID="LinkButton1" CommandName="Edit" runat="server" ToolTip="Click here to edit Sink Info."><asp:Label ID="Label1" runat="server" Text='<%# Eval("CatalogSinkName") %>' /></asp:LinkButton></td><td style="text-align:center;">                            
                               <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' Width="50px" />
                        </td></tr></AlternatingItemTemplate><EditItemTemplate>
                   <tr style="">
                        <td>

                        </td>
                        <td>
                           <asp:DropDownList ID="SlabColorIDDropDownList" runat="server" DataSourceID="SqlDataSource5" DataTextField="SinkName" DataValueField="SinkID" SelectedValue='<%# Bind("SinkID") %>' AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [SinkID], [SinkName] FROM [tblSinks]"></asp:SqlDataSource>

                            <br /><asp:Button ID="UpdateButton" runat="server"  CommandName="Update" Text="Update" CssClass="hcsmallbutton"/>
                            &nbsp;<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                              
                            
                        </td>
                        <td style="text-align:center;">
                            <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' Width="50px" />
                        </td>
                    </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td></tr></table></EmptyDataTemplate><InsertItemTemplate>
 
                 <tr style="">
                        <td></td>
                        <td colspan="2">

                       <div class="hcinput" style="padding-left:2px;margin-left:0px;">
				            <div class="hcinputtext">Sink: </div><div class="hcinputcontent">
                                <div class="styled-select">
                                    <asp:DropDownList ID="SinkIDDropDownList" runat="server" DataSourceID="SqlDataSource2" DataTextField="CatalogSinkName" DataValueField="SinkID" SelectedValue='<%# Bind("SinkID") %>'  AppendDataBoundItems="true" AutoPostBack="True" CausesValidation="True" >
                                         <asp:ListItem Value="-1">-- Choose a Sink --</asp:ListItem></asp:DropDownList></div><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [SinkID], [CatalogSinkName] FROM [SinksNameQry]"></asp:SqlDataSource>                         
				            </div>
			            </div>


                        <div class="hcinput" style="padding-left:2px;margin-left:0px;">
				            <div class="hcinputtext">Quantity: </div><div class="hcinputcontent">
                               <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' Width="50px" />

				            </div>
			            </div>



                         <div class="hcinput"style="padding-left:2px;margin-left:0px;">
				            <div class="hcinputtext">Preview Pic: </div><div class="hcinputcontent" style="height:auto;padding-bottom:20px;">
                                 <asp:Literal ID="SelectStoneRequiredLiteral" runat="server" Visible="false"><span style="color:red;">Please select a sink.<span></asp:Literal><% =ShowSinkImage(((DropDownList)ListView1.InsertItem.FindControl("SinkIDDropDownList")).SelectedValue,((DropDownList)ListView1.InsertItem.FindControl("SinkIDDropDownList")).SelectedItem.Text) %></div></div><div class="hcinputtext" style="padding-left:0px;margin-left:0px;">                                                                   
				            </div>
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Add"  CssClass="hcsmallbutton" />
                                &nbsp;<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                            
			            </div>

                        </td>

                    </tr>
        </InsertItemTemplate>
        <ItemTemplate>
                    <tr style="">
                        <td style="text-align:center;">
                            <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" ImageUrl="~/Images/delete_icon.gif" OnClientClick='return confirm(&apos;About to delete. Are you sure?&apos;);' ToolTip="Click to remove this Sink." />
                        </td>
                        <td>
                            <asp:LinkButton ID="LinkButton1" CommandName="Edit" runat="server" ToolTip="Click here to edit Sink Info."><asp:Label ID="Label1" runat="server" Text='<%# Eval("CatalogSinkName") %>' /></asp:LinkButton></td><td style="text-align:center;">                                                            
                                <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' Width="50px" />
                 </td></tr></ItemTemplate><LayoutTemplate>

            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" class="one-column-emphasis"  summary="Sinks and Quantity">
                                    <colgroup>
    	                                <col class="oce-first" />
                                    </colgroup>
                                    <thead>
                                    <tr id="Tr2" runat="server"  class="oce-first">
                                        <th id="Th1" runat="server" scope="col" style="width:80px;"></th>
                                        <th id="Th2" runat="server" scope="col">Sink</th><th id="Th3" runat="server" scope="col" style="text-align:center;">Quantity</th></tr></thead><tbody>
                                    <tr id="itemPlaceholder" runat="server"></tr>
                                    </tbody>
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
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
        
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblOnlineQuotesSinks] WHERE [OnlineQuoteSinkID] = ?" InsertCommand="INSERT INTO [tblOnlineQuotesSinks] ([OnlineQuoteSinkID], [OnlineQuoteID], [SinkID], [Quantity]) VALUES (?, ?, ?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT tblOnlineQuotesSinks.OnlineQuoteSinkID, tblOnlineQuotesSinks.OnlineQuoteID, tblOnlineQuotesSinks.SinkID, SinksNameQry.CatalogSinkName, tblOnlineQuotesSinks.Quantity FROM (tblOnlineQuotesSinks INNER JOIN SinksNameQry ON tblOnlineQuotesSinks.SinkID = SinksNameQry.SinkID) WHERE (tblOnlineQuotesSinks.OnlineQuoteID = ?)" UpdateCommand="UPDATE [tblOnlineQuotesSinks] SET [OnlineQuoteID] = ?, [SinkID] = ?, [Quantity] = ? WHERE [OnlineQuoteSinkID] = ?"><DeleteParameters>
            <asp:Parameter Name="OnlineQuoteSinkID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="OnlineQuoteSinkIDLabel" Name="OnlineQuoteSinkID" PropertyName="Text" Type="Int32" /><asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="OnlineQuoteID" PropertyName="Text" Type="Int32" /><asp:Parameter Name="SinkID" Type="Int32" /><asp:Parameter Name="Quantity" Type="Int32" />
        </InsertParameters>
        <SelectParameters><asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="?" PropertyName="Text" /></SelectParameters><UpdateParameters>
            <asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="OnlineQuoteID" PropertyName="Text" Type="Int32" /><asp:Parameter Name="SinkID" Type="Int32" /><asp:Parameter Name="Quantity" Type="Int32" /><asp:Parameter Name="OnlineQuoteSinkID" Type="Int32" /></UpdateParameters>
    </asp:SqlDataSource>
        
</ContentTemplate>
</asp:UpdatePanel>


    <div class="hcbuttons">
                             <asp:LinkButton ID="NextButton" runat="server" CausesValidation="True" Text="Next" CssClass="hcorangebutton" OnClick="NextButton_Click"  />&nbsp;<asp:LinkButton ID="BackButton" runat="server" CausesValidation="False" Text="Back" CssClass="hcgreybutton" OnClientClick="JavaScript: window.history.back(1); return false;"  /></div>
</div>
</div>
          



    <asp:Label ID="OnlineQuoteSinkIDLabel" runat="server" Text="Label" Visible="False"></asp:Label><asp:Label ID="OnlineQuoteIDLabel" runat="server" Text="Label" Visible="False"></asp:Label><script type="text/javascript">
                                                                                                                                                                                                   $(document).ready(function () {
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
                            </script></form></asp:Content>