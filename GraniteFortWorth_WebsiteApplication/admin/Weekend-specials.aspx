<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Weekend-specials.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.Weekend_specials" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="robots" content="noindex" />
    <title>Weekend Specials [Admin]</title>
            <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/themes/base/jquery-ui.css" type="text/css" media="all" />
                        <link rel="stylesheet" href="http://static.jquery.com/ui/css/demo-docs-theme/ui.theme.css" type="text/css" media="all" />
                        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script>
                        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js" type="text/javascript"></script>

     <script type="text/javascript">
         $(function () {
             $("#<%= ListView1.InsertItem.FindControl("ScheduleDateFromTextBox").ClientID  %>").datepicker({
                 changeMonth: true,
             });
             $("#<%= ListView1.InsertItem.FindControl("ScheduleDateToTextBox").ClientID  %>").datepicker({
                 changeMonth: true,
             });
             $("#<%= ClientSideEditName("ScheduleDateFromTextBox")  %>").datepicker({
                 changeMonth: true,
             });
             $("#<%= ClientSideEditName("ScheduleDateToTextBox")  %>").datepicker({
                 changeMonth: true,
             });
         });

    </script>

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
	    width: 100%;
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

    input {

    }

       </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
                            <span style="float:right;">
                    <asp:LinkButton ID="LoggedInUserName" runat="server" Text="Hello, " /><strong><asp:LinkButton ID="LogoutLinkButton" runat="server" OnClick="LogoutLinkButton_Click">Logout</asp:LinkButton></strong>
                </span><h2>Weekend Specials Admin Panel</h2>

        <p>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1" DefaultMode="Edit">
                <EditItemTemplate>
                    <asp:CheckBox ID="ShowWeekendSpecialsCheckBox" runat="server" Checked='<%# Bind("ShowWeekendSpecials") %>' OnCheckedChanged="ShowWeekendSpecialsCheckBox_CheckedChanged" Text="Show Weekend Specials" AutoPostBack="True" />
                </EditItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblSETTINGS] WHERE (([ID] = ?) OR ([ID] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO [tblSETTINGS] ([ID], [ShowWeekendSpecials]) VALUES (?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT ID, ShowWeekendSpecials FROM tblSETTINGS WHERE (ID = 1)" UpdateCommand="UPDATE tblSETTINGS SET ShowWeekendSpecials = ? WHERE (ID = 1)">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ShowWeekendSpecials" Type="Boolean" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
    <p>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="TickerTextID" DataSourceID="SqlDataSourceTickerText" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                <tr style="">
                    <td>
                            <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" ImageUrl="~/Images/delete_icon.gif" OnClientClick='return confirm(&apos;About to delete. Are you sure?&apos;);' />
                    </td>
                    <td>
                        <asp:Label ID="TickerTextIDLabel" runat="server" Text='<%# Eval("TickerTextID") %>' />
                    </td>
                    <td>
                        <asp:LinkButton ID="LinkButton1" runat="server"  CommandName="Edit">
                        <asp:Label ID="TickerTextLabel" runat="server" Text='<%# Eval("TickerText") %>' />
                            </asp:LinkButton></td><td>
                        <asp:TextBox ID="TickerLinkLabel" runat="server" Text='<%# Eval("TickerLink") %>' Width="300px" ReadOnly="true" />
                    </td>
                    <td>
                        <asp:Label ID="TickerGroupLabel" runat="server" Text='<%# Eval("TickerGroup") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DisplayLabel" runat="server" Text='<%# Eval("Display") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ScheduleDateLabel" runat="server" Text='<%# Eval("ScheduleDateFrom","{0:MMM/dd/yy}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ScheduleTimeLabel" runat="server" Text='<%# Eval("ScheduleDateTo","{0:MMM/dd/yy}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OrderSequenceLabel" runat="server" Text='<%# Eval("OrderSequence") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="ArchivedCheckBox" runat="server" Checked='<%# Eval("Archived") %>' Enabled="false" />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="TickerTextIDLabel1" runat="server" Text='<%# Eval("TickerTextID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="TickerTextTextBox" runat="server" Text='<%# Bind("TickerText") %>' Width="300px"  TextMode="MultiLine" Rows="3" />
                    </td>
                    <td>
                        <asp:TextBox ID="TickerLinkTextBox" runat="server" Text='<%# Bind("TickerLink") %>' Width="230px"  />
                    </td>
                    <td>
                        <asp:TextBox ID="TickerGroupTextBox" runat="server" Text='<%# Bind("TickerGroup") %>' Width="50px"  />
                    </td>
                    <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("Display") %>' Width="50px" >
                            <asp:ListItem Selected="True" Value="Now">Now</asp:ListItem><asp:ListItem>Sched</asp:ListItem></asp:DropDownList></td><td>
                        <asp:TextBox ID="ScheduleDateFromTextBox" runat="server" Text='<%# Bind("ScheduleDateFrom","{0:MMM/dd/yy}") %>' Width="70px" />
                    </td>
                    <td>
                        <asp:TextBox ID="ScheduleDateToTextBox" runat="server" Text='<%# Bind("ScheduleDateTo","{0:MMM/dd/yy}") %>' Width="70px"  />
                    </td>
                    <td>
                        <asp:TextBox ID="OrderSequenceTextBox" runat="server" Text='<%# Bind("OrderSequence") %>' Width="30px"  />
                    </td>
                    <td>
                        <asp:CheckBox ID="ArchivedCheckBox" runat="server" Checked='<%# Bind("Archived") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table id="Table1" runat="server" style="">
                    <tr>
                        <td>No data was returned.</td></tr></table></EmptyDataTemplate><InsertItemTemplate>
                <tr style="">
                    <td>
                    </td>
                    <td>&nbsp;</td><td>
                        <asp:TextBox ID="TickerTextTextBox" runat="server" Text='<%# Bind("TickerText") %>' Width="300px"  TextMode="MultiLine" Rows="3" />
                    </td>
                    <td>
                        <asp:TextBox ID="TickerLinkTextBox" runat="server" Text='<%# Bind("TickerLink") %>' Width="230px" />
                    </td>
                    <td>
                        <asp:TextBox ID="TickerGroupTextBox" runat="server" Text='<%# Bind("TickerGroup") %>' Width="50px"  />
                    </td>
                    <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("Display") %>' Width="50px" >
                            <asp:ListItem Selected="True" Value="Now">Now</asp:ListItem><asp:ListItem>Sched</asp:ListItem></asp:DropDownList></td><td>
                        <asp:TextBox ID="ScheduleDateFromTextBox" runat="server" Text='<%# Bind("ScheduleDateFrom","{0:MMM/dd/yy}") %>' Width="70px" />
                    </td>
                    <td>
                        <asp:TextBox ID="ScheduleDateToTextBox" runat="server" Text='<%# Bind("ScheduleDateTo","{0:MMM/dd/yy}") %>' Width="70px"  />
                    </td>
                    <td>
                        <asp:TextBox ID="OrderSequenceTextBox" runat="server" Text='<%# Bind("OrderSequence") %>' Width="30px"  />
                    </td>
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                            <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" ImageUrl="~/Images/delete_icon.gif" OnClientClick='return confirm(&apos;About to delete. Are you sure?&apos;);' />
                    </td>
                    <td>
                        <asp:Label ID="TickerTextIDLabel" runat="server" Text='<%# Eval("TickerTextID") %>' />
                    </td>
                    <td>
                        <asp:LinkButton ID="LinkButton1" runat="server"  CommandName="Edit">
                        <asp:Label ID="TickerTextLabel" runat="server" Text='<%# Eval("TickerText") %>' />
                            </asp:LinkButton></td><td>
                        <asp:TextBox ID="TickerLinkLabel" runat="server" Text='<%# Eval("TickerLink") %>' Width="300px" ReadOnly="true" />
                    </td>
                    <td>
                        <asp:Label ID="TickerGroupLabel" runat="server" Text='<%# Eval("TickerGroup") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DisplayLabel" runat="server" Text='<%# Eval("Display") %>' />
                     </td>
                    <td>
                        <asp:Label ID="ScheduleDateLabel" runat="server" Text='<%# Eval("ScheduleDateFrom","{0:MMM/dd/yy}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ScheduleTimeLabel" runat="server" Text='<%# Eval("ScheduleDateTo","{0:MMM/dd/yy}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OrderSequenceLabel" runat="server" Text='<%# Eval("OrderSequence") %>'  />
                    </td>
                    <td>
                        <asp:CheckBox ID="ArchivedCheckBox" runat="server" Checked='<%# Eval("Archived") %>' Enabled="false" />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table id="Table2" runat="server">
                    <tr id="Tr1" runat="server">
                        <td id="Td1" runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style=""  class="measure-minimalist-b" >
                                <tr id="Tr2" runat="server" style="">
                                    <th id="Th1" runat="server" style="width:60px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                    <th id="Th2" runat="server">#</th>
                                    <th id="Th3" runat="server" style="width:30%">TICKER TEXT</th>
                                    <th id="Th4" runat="server" style="width:300px">LINK</th>
                                    <th id="Th5" runat="server">GROUP</th><th id="Th6" runat="server">DISPLAY</th>
                                    <th id="Th7" runat="server">DATE From</th><th id="Th8" runat="server">DATE To</th>
                                    <th id="Th9" runat="server">SEQ</th><th id="Th10" runat="server">ARCHIVED</th></tr><tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="Tr3" runat="server">
                        <td id="Td2" runat="server" style="">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="50">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSourceTickerText" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblTickerText] WHERE [TickerTextID] = ?" InsertCommand="INSERT INTO tblTickerText(TickerTextID, TickerText, TickerLink, TickerGroup, Display, ScheduleDateFrom, ScheduleDateTo, OrderSequence, Archived) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT TickerTextID, TickerText, TickerLink, TickerGroup, Display, OrderSequence, Archived, ScheduleDateFrom, ScheduleDateTo FROM tblTickerText" UpdateCommand="UPDATE tblTickerText SET TickerText = ?, TickerLink = ?, TickerGroup = ?, Display = ?, ScheduleDateFrom = ?, ScheduleDateTo = ?, OrderSequence = ?, Archived = ? WHERE (TickerTextID = ?)"><DeleteParameters>
                <asp:Parameter Name="TickerTextID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TickerTextIDLabel" Name="TickerTextID" PropertyName="Text" Type="Int32" />
                <asp:Parameter Name="TickerText" Type="String" />
                <asp:Parameter Name="TickerLink" Type="String" />
                <asp:Parameter Name="TickerGroup" Type="String" />
                <asp:Parameter Name="Display" Type="String" />
                <asp:Parameter Name="ScheduleDateFrom" Type="DateTime" />
                <asp:Parameter Name="ScheduleDateTo" Type="DateTime" />
                <asp:Parameter Name="OrderSequence" Type="Int32" />
                <asp:Parameter Name="Archived" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TickerText" Type="String" />
                <asp:Parameter Name="TickerLink" Type="String" />
                <asp:Parameter Name="TickerGroup" Type="String" />
                <asp:Parameter Name="Display" Type="String" />
                <asp:Parameter Name="ScheduleDateFrom" Type="DateTime" />
                <asp:Parameter Name="ScheduleDateTo" Type="DateTime" />
                <asp:Parameter Name="OrderSequence" Type="Int32" />
                <asp:Parameter Name="Archived" Type="Boolean" />
                <asp:Parameter Name="TickerTextID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
        <asp:Label ID="TickerTextIDLabel" runat="server" Text="Label" Visible="False"></asp:Label></p></div></form></body></html>