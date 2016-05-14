<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel</title>
        <link rel="stylesheet" type="text/css" href="css/demo_acc.css" />
        <script type="text/javascript" src="/Scripts/jquery-1.7.1.js" ></script>
        <link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css' />

    <script type="text/javascript">
        /*
         * Image preview script
         * powered by jQuery (http://www.jquery.com)
         *
         * written by Alen Grakalic (http://cssglobe.com)
         *
         * for more info visit http://cssglobe.com/post/1695/easiest-tooltip-and-image-preview-using-jquery
         *
         */

        this.imagePreview = function () { /* CONFIG */

            xOffset = 10;
            yOffset = 30;

            // these 2 variable determine popup's distance from the cursor
            // you might want to adjust to get the right result
            /* END CONFIG */
            $("a.preview").hover(function (e) {
                var t = $(this).attr('data-initiatedby');
                var c = (t != "") ? "<br/>Initiated by " + t : "";
                var insT = $(this).attr('data-installdate');
                var insC = (insT.trim() != "") ? "<br /><span style=\"color: #7FD2FF\">Install/Task Date:</span>&nbsp;&nbsp;&nbsp;&nbsp;" + insT : "";
                $("body").append("<p id='preview'><span style=\"color: #7FD2FF\">Date Created:</span>&nbsp;&nbsp;&nbsp;&nbsp;" + $(this).attr('data-createddate') + insC + "<br /><span style=\"color: #7FD2FF\">Granite:</span>&nbsp;&nbsp;&nbsp;&nbsp;" + $(this).attr('data-granitename') + "<em>" + c + "</em></p>");
                $("#preview").css("top", (e.pageY - xOffset) + "px").css("left", (e.pageX + yOffset) + "px").fadeIn("fast");
            }, function () {
                $("#preview").remove();
            });
            $("a.preview").mousemove(function (e) {
                $("#preview").css("top", (e.pageY - xOffset) + "px").css("left", (e.pageX + yOffset) + "px");
            });
        };


        // starting the script on page load
        $(document).ready(function () {
            imagePreview();
        });
    </script>

        <style type="text/css">
            
 /* Table 3 Style */
table.table3{
    font-family: 'Droid Sans', Arial, sans-serif; 
    font-size: 18px;
    font-style: normal;
    font-weight: bold;
    text-transform: uppercase;
    letter-spacing: -1px;
    line-height: 1.7em;
    border-collapse:collapse;
    width:480px;
}
.th{
    padding:6px 10px;
    text-transform:uppercase;
    color:#444;
    font-weight:bold;
    text-shadow:1px 1px 1px #fff;
    border-bottom:5px solid #444;
    background-color: #7FD2FF;
}

.th2{
    padding:6px 10px;
    text-transform:uppercase;
    color:#444;
    font-weight:bold;
    text-shadow:1px 1px 1px #fff;
    border-bottom:5px solid #444;
    background-color: #45A8DF;
    width:300px;
    text-align:center;
}
.thempty{
    background:transparent;
    border:none;
}

.table3 thead :nth-child(2),
.table3 tfoot :nth-child(2){
    background-color: #7FD2FF;
}
.table3 tfoot :nth-child(2){
    -moz-border-radius:0px 0px 0px 5px;
    -webkit-border-bottom-left-radius:5px;
    border-bottom-left-radius:5px;
}
.table3 thead :nth-child(2){
    -moz-border-radius:5px 0px 0px 0px;
    -webkit-border-top-left-radius:5px;
    border-top-left-radius:5px;
}


.table3 thead :nth-child(3),
.table3 tfoot :nth-child(3){
    background-color: #45A8DF;
}
.table3 thead :nth-child(4),
.table3 tfoot :nth-child(4){
    background-color: #2388BF;
}
.table3 thead :nth-child(5),
.table3 tfoot :nth-child(5){
    background-color: #096A9F;
}
.table3 thead :nth-child(5){
    -moz-border-radius:0px 5px 0px 0px;
    -webkit-border-top-right-radius:5px;
    border-top-right-radius:5px;
}
.table3 tfoot :nth-child(5){
    -moz-border-radius:0px 0px 5px 0px;
    -webkit-border-bottom-right-radius:5px;
    border-bottom-right-radius:5px;
}
.table3 tfoot td{
    font-size:38px;
    font-weight:bold;
    padding:15px 0px;
    text-shadow:1px 1px 1px #fff;
}
.table3 tbody td{
    padding:10px;
}
.table3 tbody tr:hover td{
    font-size:26px;
    font-weight:bold;
}
.table3 tbody td:nth-child(even){
    background-color:#444;
    color:#444;
    border-bottom:1px solid #444;
    background:-webkit-gradient(
        linear,
        left bottom,
        left top,
        color-stop(0.39, rgb(189,189,189)),
        color-stop(0.7, rgb(224,224,224))
        );
    background:-moz-linear-gradient(
        center bottom,
        rgb(189,189,189) 39%,
        rgb(224,224,224) 70%
        );
    text-shadow:1px 1px 1px #fff;
}
.table3 tbody td:nth-child(odd){
    background-color:#555;
    color:#f0f0f0;
    border-bottom:1px solid #444;
    background:-webkit-gradient(
        linear,
        left bottom,
        left top,
        color-stop(0.39, rgb(85,85,85)),
        color-stop(0.7, rgb(105,105,105))
        );
    background:-moz-linear-gradient(
        center bottom,
        rgb(85,85,85) 39%,
        rgb(105,105,105) 70%
        );
    text-shadow:1px 1px 1px #000;
}
.table3 tbody td:nth-last-child(1){
    border-right:1px solid #222;
}
.table3 tbody th{
    color:#696969;
    padding:0px 10px;
    border-right:1px solid #aaa;
}
.table3 tbody span.check::before{
    content : url(../images/check2.png)
}
 
input[type=submit]{
            margin: 8px 1px;
            padding: 5px 15px;
		}	
 input[type=text]{
            font-size:large;
            margin: 5px;
		}	
 
 #preview{
    position:absolute;
    border:1px solid #ccc;
    background:#333;
    padding:5px;
    display:none;
    color:#fff;
}                                      
    </style>

<script type = "text/javascript">
    var defaultText = "Enter Customer Name or Quote #...";
    function WaterMark(txt, evt) {
        if (txt.value.length == 0 && evt.type == "blur") {
            txt.style.color = "gray";
            //txt.value = defaultText;
        }
        if (txt.value == defaultText && evt.type == "focus") {
            txt.style.color = "black";
            //txt.value = "";
        }
    }
</script>

</head>
<body>
<form id="form1" runat="server">
       <div class="container">
			<!-- Codrops top bar -->
            <div class="codrops-top">
                <a href="/admin/Manage-granite.aspx">Granite</a>
                <a href="/admin/Manage-services.aspx">Services</a>
                <a href="/admin/Manage-sink.aspx">Sinks</a>
                <a href="/admin/Weekend-specials.aspx"><strong>Weekend Specials</strong></a>
	            <a href="/admin/CalendarInstall.aspx"><strong>DFW Install Calendar</strong></a>
                <a href="Misc.aspx">Misc</a>
                <a href="/admin/Settings.aspx">Defaults</a>
                <a href="/admin/References.aspx?AdminView=true">References</a>
                <a href="/admin/Sales-report-monthly.aspx">Sales Report</a>
                <a href="/admin/StatusReport.aspx">Job Status Report <span style="color:red;">NEW!</span></a>

                <span class="right">
                </span>
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->
			<header>
				<h1>DFW <span>Wholesale Granite</span></h1>
				<h2>Admin Panel</h2>


                <asp:Panel ID="Panel1" DefaultButton="SearchButton" runat="server">
				<p class="codrops-demos">
					               <asp:Label ID="Label1" runat="server" Text="Search Job:"></asp:Label>
                <asp:TextBox ID="JobSearchTextBox" runat="server" Width="200px" ForeColor="Gray" onblur="WaterMark(this, event);" onfocus="WaterMark(this, event);"></asp:TextBox>
                <asp:LinkButton ID="SearchButton" runat="server" Text="Search" OnClick="RecentCheckBox_CheckedChanged"  />
               <asp:LinkButton ID="CreateJobButton" runat="server" CssClass="current-demo" Text="Create Job Quote" OnClick="CreateJobButton_Click" />
				<br />
                    <asp:CheckBox ID="RecentCheckBox" runat="server" Text=" Show Recent Quotes" AutoPostBack="True" OnCheckedChanged="RecentCheckBox_CheckedChanged" />
                                   &nbsp;&nbsp;
                    <asp:CheckBox ID="AdminInitCheckBox" runat="server" Text=" Admin Initiated Only" AutoPostBack="True" OnCheckedChanged="AdminInitCheckBox_CheckedChanged" Checked="True" />

                </p>

                </asp:Panel>

			</header>
			<section>
                <div style="width:480px;margin-left:auto;margin-right:auto;">



                <asp:ListView ID="ListView1" runat="server" DataKeyNames="OnlineQuoteID" DataSourceID="SqlDataSource2">
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="OnlineQuoteIDLabel" runat="server" Text='<%# Eval("OnlineQuoteID") %>' />
                        </td>
                        <td>
                            <a class="preview" href='<%# Eval("OnlineQuoteID", "EditJob.aspx?OnlineQuoteID={0}") %>' data-createddate='<%# Eval("DateCreated","{0:MMM/dd/yyyy}") %>' data-installdate='<%# Eval("InstallDate","{0:MMM/dd/yyyy}") + " " + Eval("InstallTime")  %>' data-initiatedby='<%# Eval("InitiatedBy") %>' data-granitename='<%# Eval("SlabColorName") %>' ><asp:Label ID="CustomerNameLabel" runat="server" Text='<%# Eval("CustomerName") %>' /></a>
                        </td></tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="OnlineQuoteIDLabel1" runat="server" Text='<%# Eval("OnlineQuoteID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CustomerNameTextBox" runat="server" Text='<%# Bind("CustomerName") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table id="Table1" runat="server" style="" >
                        <tr>
                            <td>Quote does not exist.<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/admin/CreateJob.aspx"> Create Job Quote.</asp:HyperLink></td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="CustomerNameTextBox" runat="server" Text='<%# Bind("CustomerName") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="OnlineQuoteIDLabel" runat="server" Text='<%# Eval("OnlineQuoteID") %>' />
                        </td>
                        <td>
                            <a class="preview" href='<%# Eval("OnlineQuoteID", "EditJob.aspx?OnlineQuoteID={0}") %>' data-createddate='<%# Eval("DateCreated","{0:MMM/dd/yyyy}") %>' data-installdate='<%# Eval("InstallDate","{0:MMM/dd/yyyy}") + " " + Eval("InstallTime")  %>' data-initiatedby='<%# Eval("InitiatedBy") %>' data-granitename='<%# Eval("SlabColorName") %>' ><asp:Label ID="CustomerNameLabel" runat="server" Text='<%# Eval("CustomerName") %>' /></a>
                        </td></tr></ItemTemplate>
                 <LayoutTemplate>
                    <table id="Table2" runat="server">
                        <tr id="Tr1" runat="server">
                            <td id="Td1" runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table3">
                                <thead>
                                    <tr id="Tr2" runat="server" >
                                        <th id="Th1" runat="server" style="width:30px;" class="th">Quote #</th>
                                        <th id="Th2" runat="server" class="th2">Customer Name</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr3" runat="server" style="text-align:right;" class="th" >
                            <td id="Td2" runat="server" style="" >
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="20"  >
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True"  />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="OnlineQuoteIDLabel" runat="server" Text='<%# Eval("OnlineQuoteID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustomerNameLabel" runat="server" Text='<%# Eval("CustomerName") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
               </asp:ListView>


                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT tblOnlineQuotes.OnlineQuoteID, tblOnlineQuotes.CustomerFirstName + ' ' + tblOnlineQuotes.CustomerLastName AS CustomerName, tblOnlineQuotes.Email, tblOnlineQuotes.DateCreated, iif(ISNULL(tblOnlineQuotes.InstallDate), tblOnlineQuotes.TaskDate, tblOnlineQuotes.InstallDate) AS InstallDate, iif(ISNULL(tblOnlineQuotes.InstallTime), tblOnlineQuotes.TaskTime, tblOnlineQuotes.InstallTime) AS InstallTime, tblOnlineQuotes.InitiatedBy, SlabColorsQry.SlabColorName FROM ((SlabColorsQry INNER JOIN tblOnlineQuoteStone ON SlabColorsQry.SlabColorID = tblOnlineQuoteStone.SlabColorID) INNER JOIN tblOnlineQuotes ON tblOnlineQuoteStone.OnlineQuoteID = tblOnlineQuotes.OnlineQuoteID) WHERE (tblOnlineQuotes.CustomerFirstName + ' ' + tblOnlineQuotes.CustomerLastName LIKE '%' + ? + '%') AND (tblOnlineQuotes.Email IS NOT NULL) ORDER BY tblOnlineQuotes.OnlineQuoteID DESC">
                   <SelectParameters>
                       <asp:ControlParameter ControlID="JobSearchTextBox" DefaultValue="%" Name="?" PropertyName="Text" />
                   </SelectParameters>
               </asp:SqlDataSource>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT tblOnlineQuotes.OnlineQuoteID, tblOnlineQuotes.CustomerFirstName + ' ' + tblOnlineQuotes.CustomerLastName AS CustomerName, tblOnlineQuotes.Email, tblOnlineQuotes.DateCreated, iif(ISNULL(tblOnlineQuotes.InstallDate), tblOnlineQuotes.TaskDate, tblOnlineQuotes.InstallDate) AS InstallDate, iif(ISNULL(tblOnlineQuotes.InstallTime), tblOnlineQuotes.TaskTime, tblOnlineQuotes.InstallTime) AS InstallTime, tblOnlineQuotes.InitiatedBy, SlabColorsQry.SlabColorName FROM ((SlabColorsQry INNER JOIN tblOnlineQuoteStone ON SlabColorsQry.SlabColorID = tblOnlineQuoteStone.SlabColorID) INNER JOIN tblOnlineQuotes ON tblOnlineQuoteStone.OnlineQuoteID = tblOnlineQuotes.OnlineQuoteID) WHERE (tblOnlineQuotes.CustomerFirstName + ' ' + tblOnlineQuotes.CustomerLastName LIKE '%' + ? + '%') AND (tblOnlineQuotes.Email IS NOT NULL) AND (tblOnlineQuotes.InitiatedBy = 'admin') ORDER BY tblOnlineQuotes.OnlineQuoteID DESC">
                   <SelectParameters>
                       <asp:ControlParameter ControlID="JobSearchTextBox" DefaultValue="%" Name="?" PropertyName="Text" />
                   </SelectParameters>
               </asp:SqlDataSource>

                </div>
            </section>
        </div>

    </form>
</body>
</html>
