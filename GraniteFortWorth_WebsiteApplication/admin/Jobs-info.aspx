<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Jobs-info.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.Jobs_info" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="robots" content="noindex" />
    <title>Jobs Info</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <!-- jQuery Version 1.11.0 -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

    <!-- Timepicker -->       
      <link rel="stylesheet" type="text/css" href="/admin2014/css/bootstrap-datetimepicker.css">
    <script type='text/javascript' src="/admin2014/Scripts/moment.js"></script>  
    <script type='text/javascript' src="/admin2014/Scripts/bootstrap-datetimepicker.min.js"></script>

        <!-- Bootstrap Native Datepicker --> 
      <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />       
      <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>


     <script type="text/javascript">
         $(function () {
             $("#DateCreatedPicker").datepicker({
                 autoclose: true,
                 todayHighlight: true,
             });
             $("#TaskDatePicker").datepicker({
                 autoclose: true,
                 todayHighlight: true,
             });
             $('#TaskTimePicker').datetimepicker({
                 pickDate: false,
                 useCurrent: false,
                 useSeconds: false,
                 minuteStepping: 30,
                 showToday: false,
             });
             $('#InstallDatePicker').datepicker({
                 autoclose: true,
                 clearBtn: true,
                 todayHighlight: true,
             });
             $('#InstallTimePicker').datetimepicker({
                 pickDate: false,
                 useCurrent: false,
                 useSeconds: false,
                 minuteStepping: 30,
                 showToday: false,
             });

             if (window.top == window.self) {
                 document.getElementById('jobinfo-auth').style.display = 'block';
             }
         });

    </script>

    <script type="text/javascript">
        function showProgress() {
            var e = document.getElementById('<%= FindEditControl("DropDownList5") %>');
            if (e.options[e.selectedIndex].value === "6") {
                var confirm_value = document.createElement("INPUT");
                confirm_value.type = "hidden";
                confirm_value.name = "confirm_value";
                if (confirm("Do you want to also send Install Job Verification email to this customer? \n\nClicking 'Cancel' will just update the task status and calendar entry of this job and will not send a verification email.")) {
                    confirm_value.value = "Yes";
                } 
                document.forms[0].appendChild(confirm_value);
            }
            else if (e.options[e.selectedIndex].value === "8") {
                var confirm_value = document.createElement("INPUT");
                confirm_value.type = "hidden";
                confirm_value.name = "confirm_value";
                if (confirm("Would you like to ask this customer to write us a review in Angies List?")) {
                    confirm_value.value = "Yes";
                } 
                document.forms[0].appendChild(confirm_value);
            }

            document.getElementById('divImageProgress').style.display = 'block';
        }
    </script>

    <style>
        body {
            background-color: transparent;
            overflow:hidden;
        }

        #jobinfo-auth { display: none;}

        .field-group { 
            padding-top: 15px;            
        }
          .field {
            padding: 0px 0px 10px 0px;
          }
          .field label {
            float: left;
            width: 35%;
            text-align: right;
            padding-right: 10px;
            margin: 5px 0px 5px 0px;
          }
          .field input, .field select {
            width: 65%;
            margin: 0px;
          }

		.row{
            padding-top: 10px;
            min-width: 360px;
		}
        .list-group {
            padding-top: 15px;
        }
        .list-group-item {
          position: relative;
          display: block;
          padding: 10px 15px;
          margin-bottom: -1px;
          background-color: #fff;
          border: 1px solid #ddd;
        }
        .list-group-item:hover {
            -webkit-box-shadow: inset 0px 0px 40px -10px rgba(123,183,235,1);
            -moz-box-shadow: inset 0px 0px 40px -10px rgba(123,183,235,1);
            box-shadow: inset 0px 0px 40px -10px rgba(123,183,235,1);
        }
        .list-group-item:first-child {
          border-top-left-radius: 0px;
          border-top-right-radius: 0px;
        }
        .list-group-item:last-child {
          margin-bottom: 0;
          border-bottom-right-radius: 0px;
          border-bottom-left-radius: 0px;
        }
        .list-group-item input[type=checkbox]{
            padding:0px;
            margin:0px;
        }
    </style>  
</head>
<body>
<form id="form1" runat="server">

<div class="container">
<asp:FormView ID="FormView2" runat="server" DataKeyNames="OnlineQuoteID" DataSourceID="SqlDataSource2" OnItemUpdated="FormView2_ItemUpdated" RenderOuterTable="False">
    <EditItemTemplate>
        <div class="row">
  		    <div>           
              <div class="field-group">
                <div class="field col-sm-6"><label>Job #:</label><asp:TextBox cssClass="form-control" ReadOnly="true" ID="OnlineQuoteIDLabel1" runat="server" Text='<%# Eval("OnlineQuoteID") %>' /></div>
                <div class="field col-sm-6"><label>User Job No:</label><asp:TextBox cssClass="form-control"  ID="UserJobNoTextBox" runat="server" Text='<%# Bind("UserJobNo") %>' /></div>
                <div class="field col-sm-6"><label>Edge:</label>
                    <asp:DropDownList cssClass="form-control"  ID="EdgeDropDownList1" runat="server" DataSourceID="SqlDataSourceEdge" DataTextField="EdgeName" DataValueField="EdgeID" SelectedValue='<%# Bind("Edge") %>' AppendDataBoundItems="true" >
                        <asp:ListItem Value=""></asp:ListItem> 
                        <asp:ListItem Value="-1">&nbsp;</asp:ListItem>   
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceEdge" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [EdgeID], [EdgeName] FROM [EdgesQry]"></asp:SqlDataSource>
                </div>   
                <div class="field col-sm-6"><label>Has:</label>
                    <asp:DropDownList cssClass="form-control"  ID="DropDownListHasDeposited" runat="server" SelectedValue='<%# Bind("HasDeposited") %>' AppendDataBoundItems="true"  >
                        <asp:ListItem Value=""></asp:ListItem>    
                        <asp:ListItem Value="N">None</asp:ListItem>    
                        <asp:ListItem Value="D">Deposited</asp:ListItem>    
                        <asp:ListItem Value="DV">Deposited and Verified</asp:ListItem>  
                        <asp:ListItem Value="F">Fully Paid</asp:ListItem>   
                    </asp:DropDownList>

                </div>
                <div class="field col-sm-6"><label>Backsplash:</label>
                     <asp:DropDownList cssClass="form-control"  ID="DropDownList3" runat="server" SelectedValue='<%# Bind("Backsplash") %>' >
                        <asp:ListItem Value="-1">_</asp:ListItem> 
                            <asp:ListItem Value=""></asp:ListItem>  
                        <asp:ListItem>Owner Provide Tile</asp:ListItem>
                        <asp:ListItem>Standard 4&quot;</asp:ListItem>
                        <asp:ListItem>Tile backsplash</asp:ListItem>
                        <asp:ListItem>Full Height (aprox. 18&quot;)</asp:ListItem>
                        <asp:ListItem>None</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="field col-sm-6"><label>Lead:</label>
                    <asp:DropDownList cssClass="form-control"  ID="DropDownList2" runat="server" DataSourceID="SqlDataSourceLead" DataTextField="Lead" DataValueField="LeadID" SelectedValue='<%# Bind("LeadID") %>' AppendDataBoundItems="true" >
                        <asp:ListItem Value=""></asp:ListItem>  
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceLead" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT LeadID, Lead, Inactive FROM tblLeads WHERE (Inactive = false) ORDER BY Lead DESC"></asp:SqlDataSource>
                </div>      
                <div class="field col-sm-6"><label>Date Created:</label>
                    <div class="input-group date" id="DateCreatedPicker">
                        <asp:TextBox cssClass="form-control"  ID="DateCreatedTextBox" runat="server" Text='<%# Bind("DateCreated","{0:MMM/dd/yyyy}") %>' />
                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                    </div>
                </div>                                
                <div class="field col-sm-6"><label>Salesman:</label>
                    <asp:DropDownList cssClass="form-control"  ID="DropDownList4" runat="server" DataSourceID="SqlDataSourceAssign" DataTextField="AssignedToName" DataValueField="AssignedToID" SelectedValue='<%# Bind("AssignedToID") %>' AppendDataBoundItems="true" >
                        <asp:ListItem Value=""></asp:ListItem>  
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceAssign" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [AssignedToID], [AssignedToName] FROM [tblAssignedTos] WHERE Inactive = False"></asp:SqlDataSource>
                </div>
                <div class="field col-sm-6"><label>Task Date:</label>                    
                     <div class="input-group date" id="TaskDatePicker">
                        <asp:TextBox cssClass="form-control"  ID="TaskDateTextBox" runat="server" Text='<%# Bind("TaskDate","{0:MMM/dd/yyyy}") %>' />
                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                    </div>
                </div>
                <div class="field col-sm-6"><label>Task Time:</label>
                    <div class="input-group date" id="TaskTimePicker">
                    <asp:TextBox cssClass="form-control"  ID="TaskTimeTextBox" runat="server" Text='<%# Bind("TaskTime") %>' />
                        <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                    </div>
                </div>   
                <div class="field col-sm-6"><label>Task/Status:</label>
                    <asp:DropDownList cssClass="form-control"  ID="DropDownList5" runat="server" DataSourceID="SqlDataSourceStatus" DataTextField="Status" DataValueField="StatusID" SelectedValue='<%# Bind("StatusID") %>' AppendDataBoundItems="true" >
                        <asp:ListItem Value=""></asp:ListItem>  
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceStatus" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [StatusID], [Status] FROM [tblStatus]"></asp:SqlDataSource>
                </div>
                <div class="field col-sm-6"><label>Assigned To:</label>
                    <asp:DropDownList cssClass="form-control"  ID="DropDownList6" runat="server" DataSourceID="SqlDataSourceSalesman" DataTextField="SalesManName" DataValueField="SalesManID" SelectedValue='<%# Bind("SalesManID") %>' AppendDataBoundItems="true" >
                        <asp:ListItem Value=""></asp:ListItem>  
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceSalesman" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [SalesManID], [SalesManName] FROM [tblSalesMen] WHERE Inactive = False"></asp:SqlDataSource>
                </div>
                <div class="field col-sm-6"><label>Install Date:</label>                    
                    <div class="input-group date" id="InstallDatePicker">
                        <asp:TextBox cssClass="form-control"  ID="InstallDateTextBox" runat="server" Text='<%# Bind("InstallDate","{0:MMM/dd/yyyy}") %>' />
                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                    </div>
                </div>       
                <div class="field col-sm-6"><label>Install Time:</label>
                    <div class="input-group date" id="InstallTimePicker">
                        <asp:TextBox cssClass="form-control"  ID="InstallTimeTextBox" runat="server" Text='<%# Bind("InstallTime") %>' />
                        <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                    </div>
                </div>                 
              </div>                                                                                         
            </div>  		
        </div>
        <div class="row">
            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Save" OnClick="UpdateButton_Click" OnClientClick="showProgress();" CssClass="btn btn-primary" />
            <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default" />
            <div id="divImageProgress" class="pull-right" style="display:none;"><asp:Image ID="ImageProgress" runat="server" ImageUrl="~/admin/images/progress.gif" ClientIDMode="Inherit" /></div>
        </div>
    </EditItemTemplate>
    <ItemTemplate>
    <div class="row">          
          <ul class="list-group">
            <li class="list-group-item text-right col-sm-6"><span class="pull-left"><strong>Job #:</strong></span> &nbsp;<asp:Literal ID="OnlineQuoteIDLabel" runat="server" Text='<%# Eval("OnlineQuoteID") %>' /></li>
            <li class="list-group-item text-right col-sm-6"><span class="pull-left"><strong>User Job No:</strong></span> &nbsp;<asp:Literal ID="UserJobNoLabel" runat="server" Text='<%# Bind("UserJobNo") %>' /></li>
            <li class="list-group-item text-right col-sm-6"><span class="pull-left"><strong>Edge:</strong></span> &nbsp;<asp:Literal ID="EdgeLabel" runat="server" Text='<%# Bind("EdgeName") %>' /></li>   
            <li class="list-group-item text-right col-sm-6"><span class="pull-left"><strong>Has:</strong></span> &nbsp;<asp:Literal ID="HasDepositedLabel" runat="server" Text='<%# Bind("HDLabel") %>' /></li>
            <li class="list-group-item text-right col-sm-6"><span class="pull-left"><strong>Backsplash:</strong></span> &nbsp;<asp:Literal ID="BacksplashLabel" runat="server" Text='<%# Bind("Backsplash") %>' /></li>
            <li class="list-group-item text-right col-sm-6"><span class="pull-left"><strong>Lead:</strong></span> &nbsp;<asp:Literal ID="LeadIDLabel" runat="server" Text='<%# Bind("Lead") %>' /></li>      
            <li class="list-group-item text-right col-sm-6"><span class="pull-left"><strong>Date Created:</strong></span> &nbsp;<asp:Literal ID="DateCreatedLabel" runat="server" Text='<%# Bind("DateCreated","{0:MMM/dd/yyyy}") %>' /></li>                                
            <li class="list-group-item text-right col-sm-6"><span class="pull-left"><strong>Salesman:</strong></span> &nbsp;<asp:Literal ID="AssignedToIDLabel" runat="server" Text='<%# Bind("AssignedToName") %>' /></li>
            <li class="list-group-item text-right col-sm-6"><span class="pull-left"><strong>Task Date:</strong></span> &nbsp;<asp:Literal ID="TaskDateLabel" runat="server" Text='<%# Bind("TaskDate","{0:MMM/dd/yyyy}") %>' /></li>
            <li class="list-group-item text-right col-sm-6"><span class="pull-left"><strong>Task Time:</strong></span> &nbsp;<asp:Literal ID="TaskTimeLabel" runat="server" Text='<%# Bind("TaskTime") %>' /></li>   
            <li class="list-group-item text-right col-sm-6"><span class="pull-left"><strong>Task/Status:</strong></span> &nbsp;<asp:Literal ID="StatusIDLabel" runat="server" Text='<%# Bind("Status") %>' /></li>
            <li class="list-group-item text-right col-sm-6"><span class="pull-left"><strong>Assigned To:</strong></span> &nbsp;<asp:Literal ID="SalesManIDLabel" runat="server" Text='<%# Bind("SalesManName") %>' /></li>
            <li class="list-group-item text-right col-sm-6"><span class="pull-left"><strong>Install Date:</strong></span> &nbsp;<asp:Literal ID="InstallDateLabel" runat="server" Text='<%# Bind("InstallDate","{0:MMM/dd/yyyy}") %>' /></li>      
            <li class="list-group-item text-right col-sm-6"><span class="pull-left"><strong>Install Time:</strong></span> &nbsp;<asp:Literal ID="InstallTimeLabel" runat="server" Text='<%# Bind("InstallTime") %>' /></li>                                 
          </ul>                                                                                         
      </div>  
        <div class="row">
            <asp:Button ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" OnClick="EditButton_Click" CssClass="btn btn-primary" />
            <asp:TextBox ID="TrushControlTextBox" runat="server" CssClass="hidden"></asp:TextBox>
        </div>	    
    </ItemTemplate>
</asp:FormView>	

        <div id="jobinfo-auth" class="row">
            <h3><i>You have just been authenticated to Google for Calendar V3. Please redo your most recent action right in <b>this browser window tab</b>. Please repeat until the changes you wish to make reflects on Google Install Calendar. When you already see the changes and updates in Google Calendar, click the green button below to go back to the Job Quote editing page.</i></h3>
            <a class=" btn btn-info btn-sm" href="/admin2014/admin/install-calendar.aspx" target="_blank">See the Install Calendar here</a>
            <asp:Button ID="btnReturnToQuote" runat="server" Text="Return to JOB QOUTE editing page"  CssClass="btn btn-success btn-sm" OnClick="btnReturnToQuote_Click"/>

             <br /><br />Note: This is a ONE TIME ONLY requirement for every successful Google Authentication.
        </div>	

</div>

<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblOnlineQuotes] WHERE [OnlineQuoteID] = ?" InsertCommand="INSERT INTO [tblOnlineQuotes] ([OnlineQuoteID], [Edge], [LinearFeet], [Backsplash], [UserJobNo], [AssignedToID], [LeadID], [DateCreated], [TaskDate], [TaskTime], [StatusID], [SalesManID], [InstallDate], [InstallTime]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT Edge, EdgeName, LinearFeet, Backsplash, UserJobNo, AssignedToID, AssignedToName, LeadID, Lead, DateCreated, TaskDate, TaskTime, StatusID, Status, SalesManID, SalesManName, InstallDate, InstallTime, OnlineQuoteID, HasDeposited, iif(HasDeposited = 'D', 'Deposited', iif(HasDeposited = 'V', 'Been Verified', iif(HasDeposited = 'DV', 'Deposited and Verified', iif(HasDeposited = 'F', 'Fully Paid', 'N/A')))) AS HDLabel FROM JobInfoQry WHERE (OnlineQuoteID = ?)" UpdateCommand="UPDATE tblOnlineQuotes SET Edge = ?, Backsplash = ?, UserJobNo = ?, AssignedToID = ?, LeadID = ?, DateCreated = ?, TaskDate = ?, TaskTime = ?, StatusID = ?, SalesManID = ?, InstallDate = ?, InstallTime = ?, HasDeposited = ? WHERE (OnlineQuoteID = ?)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="?" SessionField="OnlineQuoteID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Edge" Type="Int32" />
            <asp:Parameter Name="Backsplash" Type="String" />
            <asp:Parameter Name="UserJobNo" Type="String" />
            <asp:Parameter Name="AssignedToID" Type="Int32" />
            <asp:Parameter Name="LeadID" Type="Int32" />
            <asp:Parameter Name="DateCreated" Type="DateTime" />
            <asp:Parameter Name="TaskDate" Type="DateTime" />
            <asp:Parameter Name="TaskTime" Type="String" />
            <asp:Parameter Name="StatusID" Type="Int32" />
            <asp:Parameter Name="SalesManID" Type="Int32" />
            <asp:Parameter Name="InstallDate" Type="DateTime" />
            <asp:Parameter Name="InstallTime" Type="String" />
            <asp:Parameter Name="HasDeposited" Type="String" />
            <asp:Parameter Name="OnlineQuoteID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</form>
     <!-- Bootstrap Core JavaScript -->
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <script>
        function AddRemoveCompleted() {
            if ($("#<%= FindEditControl("DropDownListHasDeposited") %>").val() == 'F')
                $("#<%= FindEditControl("DropDownList5") %>").append("<option value='7'>Completed</option>");
            else
                $("#<%= FindEditControl("DropDownList5") %> option[value='7']").remove();
        }

        $(document).ready(function () {
            AddRemoveCompleted();
        });

        $("#<%= FindEditControl("DropDownListHasDeposited") %>").change(function () {
            AddRemoveCompleted();
        });

    </script>

</body>
</html>
