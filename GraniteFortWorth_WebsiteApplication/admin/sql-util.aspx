<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sql-util.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.sql_util" %>


<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<!-- Basic Page Needs
  ================================================== -->
	<meta charset="utf-8">
	<title>DFW Database NonQuery SQL Utility</title>
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- Mobile Specific Metas
  ================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- CSS
  ================================================== -->
	<link rel="stylesheet" href="stylesheets/base.css">
	<link rel="stylesheet" href="stylesheets/skeleton.css">
	<link rel="stylesheet" href="stylesheets/layout.css">

	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- Favicons
	================================================== -->
	<link rel="shortcut icon" href="images/favicon.ico">
	<link rel="apple-touch-icon" href="images/apple-touch-icon.png">
	<link rel="apple-touch-icon" sizes="72x72" href="images/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="114x114" href="images/apple-touch-icon-114x114.png">
    
    <style>
        textarea {
            width:100%;
            height:100px;
        }
    </style>

    <script type="text/javascript">
        function PageLoad() {
            document.getElementById('sqlWhereText').style.width = "100%"
            document.getElementById('sqlType').setAttribute("onchange", "sqlTypeChange()");
            document.getElementById('sqlWhere').setAttribute("onchange", "sqlWhereChange()");
            document.getElementById('sqlWhereText').value = "";
            document.getElementById('sqlWhereText').style.visibility = "hidden";
            sqlTypeChange();
        }

        function ExecuteSQL() {
            var e = document.getElementById('sqlWhere');
            if (e.options[e.selectedIndex].value === "WHERE" && (document.getElementById('sqlWhereText').value).trim() === "")
                alert("Please enter SQL WHERE clause.");
            else
                confirm(document.getElementById('sqlType').value + " " + document.getElementById('sqlText').value + " " + document.getElementById('sqlWhere').value + " " + document.getElementById('sqlWhereText').value);


        }

        function sqlTypeChange() {
            var e = document.getElementById('sqlType');
            var ee = document.getElementById('sqlWhere');
            ee.disabled = false;
            ee.value = "WHERE";
            
            if (e.options[e.selectedIndex].value === "UPDATE")
                document.getElementById('sqlText').value = "table_name SET column1=value1, column2=value2,...";
            else if (e.options[e.selectedIndex].value === "INSERT INTO") {
                document.getElementById('sqlText').value = "table_name (column1, column2, column3,...) VALUES (value1, value2, value3,...)";                
                ee.value = "";
                ee.disabled = true;
            }
            else if (e.options[e.selectedIndex].value === "DELETE")
                document.getElementById('sqlText').value = "* FROM table_name";

            sqlWhereChange();
        }

        function sqlWhereChange() {
            var e = document.getElementById('sqlWhere');
            if (e.options[e.selectedIndex].value === "WHERE")
                document.getElementById('sqlWhereText').style.visibility = "visible";
            else {
                document.getElementById('sqlWhereText').value = "";
                document.getElementById('sqlWhereText').style.visibility = "hidden";
            }
        }

    </script>

</head>
<body onload="PageLoad()">
    <form id="form1" runat="server">
	<!-- Primary Page Layout
	================================================== -->

	<!-- Delete everything in this .container and get started on your own site! -->

	<div class="container">
		<div class="sixteen columns">
			<h1 class="remove-bottom" style="margin-top: 40px">DFW Database NonQuery SQL Utility</h1>
			<h5>Version 1.0</h5>
            <asp:Button ID="LogoutButton" runat="server" Text="Logout" OnClick="LogoutButton_Click" />
			<hr />
		</div>
		<div class="one-third column">
			<h3>SQL Type:</h3>
			<p>
                <asp:DropDownList ID="sqlType" runat="server" ClientIDMode="Static">
                    <asp:ListItem>UPDATE</asp:ListItem>
                    <asp:ListItem>DELETE</asp:ListItem>
                    <asp:ListItem>INSERT INTO</asp:ListItem>
                </asp:DropDownList>
			</p>
		</div>
		<div class="one-third column">
			<h3>SQL Command Text:</h3>
			<p>
                <asp:TextBox ID="sqlText" runat="server" TextMode="MultiLine" ClientIDMode="Static"></asp:TextBox>
			</p>
		</div>
		<div class="one-third column">
			<h3>SQL Where</h3>
			<p>
                 <asp:DropDownList ID="sqlWhere" runat="server" ClientIDMode="Static" >
                    <asp:ListItem Value="WHERE">WHERE</asp:ListItem>
                    <asp:ListItem Value="">No Where</asp:ListItem>
                </asp:DropDownList>  
                <asp:TextBox ID="sqlWhereText" runat="server" ClientIDMode="Static" ></asp:TextBox>
              
               <asp:Button ID="sqlExecute" runat="server" Text="Execute!" ClientIDMode="Static" OnClientClick="ExecuteSQL()" OnClick="sqlExecute_Click" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" ></asp:SqlDataSource>
			</p>
		</div>

	</div><!-- container -->

            <div>
        <asp:Button ID="AuthButton" runat="server" Text="Authenticate" OnClick="AuthButton_Click" />
    </div>
    </form>
</body>
</html>
