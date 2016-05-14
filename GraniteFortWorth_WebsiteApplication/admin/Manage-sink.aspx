<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manage-sink.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.Manage_sink" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Sinks - Online Quote Webapp</title>
    <link rel="stylesheet" href="css/hcforms.css" type="text/css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/demo_acc.css" />
    <link rel="stylesheet" type="text/css" href="css/style_acc.css" />
    <link rel="stylesheet" type="text/css" href="css/style_form.css" />
	<script type="text/javascript" src="js/modernizr.custom.29473.js"></script>


		<!--[if lt IE 9]>
			<style>
				.content{
					height: auto;
					margin: 0;
				}
				.content div {
					position: relative;
				}
			    </style>
		<![endif]-->
       <style>
            input[type=submit]{
                    margin: 2px;
                    padding: 4px;
		        }	
    </style>  


</head>
<body>
    <form id="form1" runat="server">
       <div class="container">
			<!-- Codrops top bar -->
            <div class="codrops-top">
                <a href="Default.aspx"><strong>Return to Admin Home</strong></a>
                <a href="/admin/Manage-granite.aspx">Granite</a>
                <a href="/admin/Manage-services.aspx">Services</a>
                <a href="/admin/Manage-sink.aspx">Sinks</a>
                <a href="/admin/Weekend-specials.aspx">Weekend Specials</a>
	            <a href="/admin/CalendarInstall.aspx">DFW Install Calendar</a>
                <a href="/admin/References.aspx?AdminView=true">References</a>
                <a href="/admin/Sales-report-monthly.aspx">Sales Report</a>
                <a href="/admin/StatusReport.aspx">Job Status Report <span style="color:red;">NEW!</span></a>

                <span class="right">
                    <asp:LinkButton ID="LoggedInUserName" runat="server" Text="Hello, " /><strong><asp:LinkButton ID="LogoutLinkButton" runat="server" OnClick="LogoutLinkButton_Click">Logout</asp:LinkButton></strong>
                </span>
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->
			<header>
				<h1>DFW <span>Wholesale Granite</span></h1>
				<h2>Add/Edit Sinks</h2>
				<p class="codrops-demos">
					<asp:LinkButton ID="EditJobButton" runat="server" Text="Granite" OnClick="EditJobButton_Click" />
					<asp:LinkButton ID="ServicesButton" runat="server" Text="Services" OnClick="ServicesButton_Click" />
					<asp:LinkButton ID="MiscButton" runat="server" Text="Misc" CssClass="current-demo"  />
				</p>
			</header>
			<section style="width:800px;margin-left:auto;margin-right:auto;">


            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <script type="text/javascript">
                    var prm = Sys.WebForms.PageRequestManager.getInstance();
                    prm.add_beginRequest(beginRequest);
                    function beginRequest() {
                        prm._scrollPosition = null;
                    }
                </script>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server"  >
            <ContentTemplate>
			<div style="width:390px;float:left;padding-top:0px;">
                <h3>Select an item to Edit</h3>

                <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="CatalogSinkName" DataValueField="SinkID" Height="260px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
                <br />
                <asp:Label ID="IDPrimaryKeyLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                <asp:Button ID="AddNewButton" runat="server" Text="Add New" OnClick="AddNewButton_Click" />
                <br />
			    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [SinkID], [CatalogSinkName] FROM [SinksNameNoPriceQry]"></asp:SqlDataSource>
			</div>
            </ContentTemplate>
            </asp:UpdatePanel>

            <div id="form4" style="width:400px;float:right;padding-top:0px;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
            <ContentTemplate>

                <asp:FormView ID="FormView1" runat="server" DataKeyNames="SinkID" DataSourceID="SqlDataSource1" DefaultMode="Edit" OnItemDeleted="FormView1_ItemDeleted" OnItemInserted="FormView1_ItemInserted" OnItemUpdated="FormView1_ItemUpdated">
                    <EditItemTemplate>
                        Catalog ID:<br />
                        <asp:TextBox ID="CatalogIDTextBox" runat="server" Text='<%# Bind("CatalogID") %>' />
                        <br />
                        Sink Name:<br />
                        <asp:TextBox ID="SinkNameTextBox" runat="server" Text='<%# Bind("SinkName") %>' />
                        <br />
                        Short Sink Name:<br />
                        <asp:TextBox ID="SinkShortNameTextBox" runat="server" Text='<%# Bind("SinkShortName") %>' />
                        <br />
                        Price:<br />
                        <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price","{0:0.00}") %>' />
                        <br />
                        Type:<br />
                        <asp:DropDownList ID="DropDownList1" runat="server" Text='<%# Bind("Type") %>' >
                            <asp:ListItem Value=""></asp:ListItem>
                            <asp:ListItem Value="K">Kitchen Sink</asp:ListItem>
                            <asp:ListItem Value="V">Vanity Sink</asp:ListItem>
                            <asp:ListItem Value="O">Owner Provide</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        Image Filename:<br />
                        <asp:HyperLink ID="ImageFilenameTextBox" runat="server" Text='<%# Eval("ImageFilenameEdit") %>' NavigateURL='<%# Eval("SinkID", "SinkImageUploader.aspx?SinkID={0}") %>' />
                        <br />
                        <p class="submit">
                        <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Save" />
                        &nbsp;<asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            &nbsp;<asp:Button ID="DeleteButton" runat="server" Visible="false" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick='return confirm(&apos;Deleting this item may affect Job Quote which uses this Sink. Delete anyway?&apos;);' OnClick="DeleteButton_Click" Enabled="False"  />

                       </p>
                        <asp:Label ID="SinkIDLabel1" runat="server" Text='<%# Eval("SinkID") %>' Visible="false" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        Catalog ID:<br />
                        <asp:TextBox ID="CatalogIDTextBox" runat="server" Text='<%# Bind("CatalogID") %>' />
                        <br />
                        Sink Name:<br />
                        <asp:TextBox ID="SinkNameTextBox" runat="server" Text='<%# Bind("SinkName") %>' />
                        <br />
                        Short Sink Name:<br />
                        <asp:TextBox ID="SinkShortNameTextBox" runat="server" Text='<%# Bind("SinkShortName") %>' />
                        <br />
                        Price:<br />
                        <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                        <br />
                        Type:<br />
                        <asp:DropDownList ID="DropDownList1" runat="server" Text='<%# Bind("Type") %>' >
                            <asp:ListItem Value=""></asp:ListItem>
                            <asp:ListItem Value="K">Kitchen Sink</asp:ListItem>
                            <asp:ListItem Value="V">Vanity Sink</asp:ListItem>
                            <asp:ListItem Value="O">Owner Provide</asp:ListItem>
                        </asp:DropDownList>
                        <br />

                        <p class="submit">
                        <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Save" />
                        &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </p>
                    </InsertItemTemplate>
                    
                </asp:FormView>


       
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblSinks] WHERE (([SinkID] = ?) OR ([SinkID] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO tblSinks(SinkID, CatalogID, SinkName, SinkShortName, Price, ImageFilename, Type) VALUES (?, ?, ?, ?, ?, ?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT SinkID, CatalogID, SinkName, SinkShortName, Price, iif(isnull(ImageFilename), 'Upload Picture...', ImageFilename + ' [Click to update...]') AS ImageFilenameEdit, Type FROM tblSinks WHERE (SinkID = ?)" UpdateCommand="UPDATE tblSinks SET CatalogID = ?, SinkName = ?, SinkShortName = ?, Price = ?, Type = ? WHERE (SinkID = ?)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="FormView1" Name="SinkID" PropertyName="SelectedValue" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="IDPrimaryKeyLabel" Name="SinkID" PropertyName="Text" Type="Int32" />
                        <asp:Parameter Name="CatalogID" Type="String" />
                        <asp:Parameter Name="SinkName" Type="String" />
                        <asp:Parameter Name="SinkShortName" Type="String" />
                        <asp:Parameter Name="Price" Type="Decimal" />
                        <asp:Parameter Name="ImageFilename" Type="String" />
                        <asp:Parameter Name="Type" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBox1" Name="?" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CatalogID" Type="String" />
                        <asp:Parameter Name="SinkName" Type="String" />
                        <asp:Parameter Name="SinkShortName" Type="String" />
                        <asp:Parameter Name="Price" Type="Decimal" />
                        <asp:Parameter Name="Type" Type="String" />
                        <asp:Parameter Name="SinkID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>


       
                <div id="divStatus" runat="server" >
                    <asp:Label ID="RecordStatusLabel" runat="server" Text=""></asp:Label>
                    <asp:Button ID="RefreshButton" runat="server" Text="Refresh List" Visible="false" OnClick="RefreshButton_Click" />
                </div>
                    
            </ContentTemplate>
            </asp:UpdatePanel>
            </div>
            </section>
        </div>

    </form>
</body>
</html>
