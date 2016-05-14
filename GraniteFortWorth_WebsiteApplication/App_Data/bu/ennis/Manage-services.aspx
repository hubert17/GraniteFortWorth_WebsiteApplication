<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manage-services.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.Manage_services" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Manage Services - Online Quote Webapp</title>
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



</head>
<body>
    <form id="form1" runat="server">
       <div class="container">
			<!-- Codrops top bar -->
            <div class="codrops-top">
                <a href="/admin/Default.aspx">Return to Admin Home</a>

                <span class="right">
					<a href="#">***</a>
                    <a href="#">
                        <strong>***</strong>
                    </a>
                </span>
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->
			<header>
				<h1>DFW <span>Wholesale Granite</span></h1>
				<h2>Add/Edit Services</h2>
				<p class="codrops-demos">
					<asp:LinkButton ID="EditJobButton" runat="server" Text="Sinks" OnClick="EditJobButton_Click" />
					<asp:LinkButton ID="ServicesButton" runat="server" Text="Granite" OnClick="ServicesButton_Click" />
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

                <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="ServiceName" DataValueField="ServicesID" Height="156px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
                <br />

                <asp:Label ID="IDPrimaryKeyLabel" runat="server" Text="Label" Visible="False"></asp:Label>
                <asp:Button ID="AddNewButton" runat="server" Text="Add New" OnClick="AddNewButton_Click" />
                <br />
			    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [ServicesID], [ServiceName] FROM [tblServices] ORDER BY [ServiceName]"></asp:SqlDataSource>
			</div>
            </ContentTemplate>
            </asp:UpdatePanel>

            <div id="form4" style="width:400px;float:right;padding-top:0px;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
            <ContentTemplate>
            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="ServicesID" DefaultMode="Edit" OnItemInserted="FormView1_ItemInserted" OnItemUpdated="FormView1_ItemUpdated" OnItemDeleted="FormView1_ItemDeleted" Width="360px">
                    <EditItemTemplate>
                        Service Name:
                        <asp:TextBox ID="ServiceNameTextBox" runat="server" Text='<%# Bind("ServiceName") %>' />
                        <br />
                        Price:<br />
                        <asp:TextBox ID="ServicePriceTextBox" runat="server" Text='<%# Bind("ServicePrice","{0:0.00}") %>' />
                        <br />
                        WO Price:
                        <asp:TextBox ID="WOPriceTextBox" runat="server" Text='<%# Bind("WOPrice","{0:0.00}") %>' />
                        <br />
                         <asp:CheckBox ID="AdminOnlyCheckBox" runat="server" Text=" Admin Only" Checked='<%# Bind("AdminOnly") %>' Width="300px" />
                        <br />
                        <p class="submit">
                            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Save" />
                            &nbsp;<asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                &nbsp;<asp:Button ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick='return confirm(&apos;About to delete. Are you sure?&apos;);' />
                        </p>
                        <asp:Label ID="ServicesIDLabel1" runat="server" Visible="false" Text='<%# Eval("ServicesID") %>' />

                    </EditItemTemplate>
                    <InsertItemTemplate>
                         Service Name:
                        <asp:TextBox ID="ServiceNameTextBox" runat="server" Text='<%# Bind("ServiceName") %>' />
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ServiceNameTextBox" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <br />
                         Price:<br />
                        <asp:TextBox ID="ServicePriceTextBox" runat="server" Text='<%# Bind("ServicePrice","{0:0.00}") %>' />
                        <br />
                         WO Price:<br />
                        <asp:TextBox ID="WOPriceTextBox" runat="server" Text='<%# Bind("WOPrice","{0:0.00}") %>'  />
                        <asp:CheckBox ID="AdminOnlyCheckBox" runat="server" Text=" Admin Only" Checked='<%# Bind("AdminOnly") %>' Width="300px" />
                         <asp:CheckBox ID="QuantityModeCheckBox" runat="server" Text=" Quantity Mode" Checked='<%# Bind("ServiceType") %>' Width="300px" />
                          

                        <br />
<p class="submit">
                        <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Save" />
                        &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" OnClick="InsertCancelButton_Click" />
                            </p>                    </InsertItemTemplate>
            
                </asp:FormView>

			    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblServices] WHERE [ServicesID] = ?" InsertCommand="INSERT INTO tblServices(ServicesID, ServiceName, ServicePrice, WOPrice, ServiceType, AdminOnly) VALUES (?, ?, ?, ?, ?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT ServicesID, ServiceName, ServicePrice, WOPrice, AdminOnly FROM tblServices WHERE (ServicesID = ?) ORDER BY ServiceName" UpdateCommand="UPDATE tblServices SET ServiceName = ?, ServicePrice = ?, WOPrice = ?, AdminOnly = ? WHERE (ServicesID = ?)">
                    <DeleteParameters>
                        <asp:Parameter Name="ServicesID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="IDPrimaryKeyLabel" Name="ServicesID" PropertyName="Text" Type="Int32" />
                        <asp:Parameter Name="ServiceName" Type="String" />
                        <asp:Parameter Name="ServicePrice" Type="Decimal" />
                        <asp:Parameter Name="WOPrice" Type="Decimal" />
                        <asp:Parameter Name="ServiceType" Type="Boolean" />
                        <asp:Parameter Name="AdminOnly" Type="Boolean" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBox1" Name="?" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ServiceName" Type="String" />
                        <asp:Parameter Name="ServicePrice" Type="Decimal" />
                        <asp:Parameter Name="WOPrice" Type="Decimal" />
                        <asp:Parameter Name="ServicesID" Type="Int32" />
                        <asp:Parameter Name="AdminOnly" Type="Boolean" />
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
