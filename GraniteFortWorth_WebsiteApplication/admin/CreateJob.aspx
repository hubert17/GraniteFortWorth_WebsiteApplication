<%@ Page Title="Create New Job Quote" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateJob.aspx.cs" Inherits="GraniteFortWorth_NewWebsite.admin.CreateJob" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
        <meta name="robots" content="noindex" />

        <link rel="stylesheet" href="css/hcforms.css" type="text/css" media="all">
            <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style3.css" />
		<script type="text/javascript" src="js/modernizr.custom.04022.js"></script>
		<!--[if lt IE 9]>
			<style>
				.content{
					height: auto;
					margin: 0;
				}
				.content div {
					position: relative;
				}
			    .auto-style1 {
                    width: 100%;
                }
			    </style>
		<![endif]-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">


<asp:FormView ID="FormView1" runat="server" DataKeyNames="OnlineQuoteID" DataSourceID="SqlDataSource1" DefaultMode="Insert" OnItemInserted="FormView1_ItemInserted" Width="939px" OnItemCommand="FormView1_ItemCommand" OnItemInserting="FormView1_ItemInserting">
                
                <InsertItemTemplate>
                <div class="hcformBoxShadow" style="width:900px;">
                    		<div class="hcformNoShadow" style="width:50%;float:left;">

			                    <div class="hcformtitle" style="width:100%;">NEW JOB QUOTE: Kindly fill in customer's contact information.</div>

			                    <div class="hcinput">
				                    <div class="hcinputtext">Your Name: </div>
				                    <div class="hcinputcontent">
                                        <asp:TextBox ID="CustomerFirstNameTextBox" runat="server" Text='<%# Bind("CustomerFirstName") %>' />
				                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CustomerFirstNameTextBox" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
				                    </div>
			                    </div>

			                    <div class="hcinput">
				                    <div class="hcinputtext">Your Surname: </div>
				                    <div class="hcinputcontent">
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CustomerLastName") %>' />
				                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
				                    </div>
			                    </div>

                                <div class="hcinput">
				                    <div class="hcinputtext">Your Phone: </div>
				                    <div class="hcinputcontent">
                                    <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
				                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="PhoneTextBox" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
				                    </div>
			                    </div>

			                    <div class="hcinput" style="border-bottom: 0;">
				                    <div class="hcinputtext">Your Email: </div>
				                    <div class="hcinputcontent" style="height:60px">
                                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="EmailTextBox" ForeColor="Red">*</asp:RequiredFieldValidator>
                                        <span style="vertical-align:top;font-size:small"><br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid e-mail address." ControlToValidate="EmailTextBox" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" >Invalid e-mail address.</asp:RegularExpressionValidator></span>
				                  </div>
                                    
				                  </div>

                                <div class="hcbuttons">
                                    <asp:TextBox ID="EdgeTextBox" runat="server" Text='<%# Bind("Edge") %>' Visible="false" />
                                        <asp:TextBox ID="BacksplashTextBox" runat="server" Text='<%# Bind("Backsplash") %>' Visible="false" />
			                    </div>
                            </div>

                             <div class="hcformNoShadow2" style="width:50%;">

			                    <div class="hcformtitle" style="width:100%;">&nbsp;&nbsp;</div>

                                <div class="hcinput">
				                    <div class="hcinputtext">Job Site Address: </div>
				                    <div class="hcinputcontent">
                                        <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
				                    </div>
			                    </div>

                                <div class="hcinput">
				                    <div class="hcinputtext">Job Site City: </div>
				                    <div class="hcinputcontent">
                                    <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
				                    </div>
			                    </div>
                                <div class="hcinput">
				                    <div class="hcinputtext">Job Site State: </div>
				                    <div class="hcinputcontent">
                                    <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
				                    </div>
			                    </div>

                                <div class="hcinput" style="border-bottom: 0;">
				                    <div class="hcinputtext">Job Site Zipcode: </div>
				                    <div class="hcinputcontent" style="height:60px">
                                    <asp:TextBox ID="ZipCodeTextBox" runat="server" Text='<%# Bind("ZipCode") %>' />
				                    </div>
			                    </div>

			                    <div class="hcbuttons">
                                   <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="hcorangebutton" Text="Next" />
                                    &nbsp;
                                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="hcgreybutton" Text="Cancel" />
			                    </div>

		                    </div>
                 </div>

                </InsertItemTemplate>
                
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblOnlineQuotes] WHERE [OnlineQuoteID] = ?" InsertCommand="INSERT INTO tblOnlineQuotes(OnlineQuoteID, CustomerLastName, CustomerFirstName, Address, City, State, ZipCode, Phone, Email, Edge, Backsplash, InitiatedBy, InitiatedDate) VALUES (?, StrConv(?, 3), StrConv(?, 3), ?, ?, ?, ?, ?, ?, ?, ?, 'admin', NOW())" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteID, CustomerLastName, CustomerFirstName, Address, City, State, ZipCode, Phone, Email, Edge, Backsplash FROM tblOnlineQuotes WHERE (OnlineQuoteID = ?)" UpdateCommand="UPDATE [tblOnlineQuotes] SET [CustomerLastName] = ?, [CustomerFirstName] = ?, [Address] = ?, [City] = ?, [State] = ?, [ZipCode] = ?, [Phone] = ?, [Email] = ?, [Edge] = ?, [Backsplash] = ? WHERE [OnlineQuoteID] = ?">
                
                <InsertParameters>
                    <asp:Parameter Name="OnlineQuoteID" Type="Int32" />
                    <asp:Parameter Name="CustomerLastName" Type="String" />
                    <asp:Parameter Name="CustomerFirstName" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="ZipCode" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Edge" Type="String" />
                    <asp:Parameter Name="Backsplash" Type="String" />                    
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="?" QueryStringField="OnlineQuoteID" />
                </SelectParameters>
                
            </asp:SqlDataSource>






</asp:Content>
