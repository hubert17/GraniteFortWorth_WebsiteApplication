<%@ Page Title="ONLINE QUOTE SYSTEM" Language="C#" MasterPageFile="~/SiteClassic.Master" AutoEventWireup="true" CodeBehind="OnlineQuote-info.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.OnlineQuote_info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<META NAME="Description" CONTENT="Fill out the steps below to submit your countertop requirements and we will provide you with a custom quote for your project. Granite Fort Worth Southlake ">
<meta name="robots" content="noindex" />
      <script src="js/jquery.validate.js" type="text/javascript"></script> 
    <script type="text/javascript">
        $(document).ready
        (
          function () {
              $("#form1").validate
              (
                {
                    rules:
                    {
                        <%=  ((TextBox)(FormView1.FindControl("CustomerFirstNameTextBox"))).UniqueID %>:
                        {
                            required: true
                        },
                        <%=  ((TextBox)(FormView1.FindControl("TextBox1"))).UniqueID %>:
                        {
                            required: true
                        },
                         <%=  ((TextBox)(FormView1.FindControl("PhoneTextBox"))).UniqueID %>:
                        {
                            required: true
                        },
                         <%=  ((TextBox)(FormView1.FindControl("EmailTextBox"))).UniqueID %>:
                        {
                            required: true, email: true
                        }
                    },
                    messages:
                    {
                        required: "You must enter your name, phone and email.",
                        email: "<br />Please enter a valid email address."
                    }
                }
              );
          }
        );
    </script>  

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form id="form1" runat="server">
    <h2>Online Quote System </h2>
        <div class="wrapper">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="OnlineQuoteID" DataSourceID="SqlDataSource1" DefaultMode="Insert" OnItemInserted="FormView1_ItemInserted" Width="939px" OnItemUpdated="FormView1_ItemUpdated">
                <EditItemTemplate>

                                    <div class="hcformBoxShadow" style="width:900px;">
                    		<div class="hcformNoShadow" style="width:50%;float:left;">

			                    <div class="hcformtitle" style="width:100%;">Step 1: Fill in you contact information</div>

			                    <div class="hcinput">
				                    <div class="hcinputtext">Your Name: </div>
				                    <div class="hcinputcontent">
                                        <asp:TextBox ID="CustomerFirstNameTextBox" runat="server" Text='<%# Bind("CustomerFirstName") %>' />
				                    </div>
			                    </div>

			                    <div class="hcinput">
				                    <div class="hcinputtext">Your Surname: </div>
				                    <div class="hcinputcontent">
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CustomerLastName") %>' />
				                    </div>
			                    </div>

                                <div class="hcinput">
				                    <div class="hcinputtext">Your Phone: </div>
				                    <div class="hcinputcontent">
                                    <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
				                    </div>
			                    </div>

			                    <div class="hcinput" style="border-bottom: 0;">
				                    <div class="hcinputtext">Your Email: </div>
				                    <div class="hcinputcontent">
                                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />

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
				                    <div class="hcinputcontent">
                                    <asp:TextBox ID="ZipCodeTextBox" runat="server" Text='<%# Bind("ZipCode") %>' />
				                    </div>
			                    </div>

			                    <div class="hcbuttons">
                                   <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" CssClass="hcorangebutton" Text="Next" />
                                    &nbsp;
                                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="hcgreybutton" Text="Cancel" />
			                    </div>

		                    </div>
                 </div>

                </EditItemTemplate>
                <InsertItemTemplate>
                <div class="hcformBoxShadow" style="width:900px;">
                    		<div class="hcformNoShadow" style="width:50%;float:left;">

			                    <div class="hcformtitle" style="width:100%;">Step 1: Fill in you contact information</div>

			                    <div class="hcinput">
				                    <div class="hcinputtext">Your Name: </div>
				                    <div class="hcinputcontent">
                                        <asp:TextBox ID="CustomerFirstNameTextBox" runat="server" Text='<%# Bind("CustomerFirstName") %>' />
				                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="required" ControlToValidate="CustomerFirstNameTextBox">required</asp:RequiredFieldValidator>
			                    </div>

			                    <div class="hcinput">
				                    <div class="hcinputtext">Your Surname: </div>
				                    <div class="hcinputcontent">
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CustomerLastName") %>' />
				                    </div>
			                    </div>

                                <div class="hcinput">
				                    <div class="hcinputtext">Your Phone: </div>
				                    <div class="hcinputcontent">
                                    <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
				                    </div>
			                    </div>

			                    <div class="hcinput" style="border-bottom: 0;">
				                    <div class="hcinputtext">Your Email: </div>
				                    <div class="hcinputcontent">
                                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />

				                  </div>
				                  </div>

                                <div class="hcbuttons">
                                     <asp:TextBox ID="OnlineQuoteIDTextBox" runat="server" Text='<%# Bind("OnlineQuoteID") %>' Visible="false" />
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
				                    <div class="hcinputcontent">
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
                <ItemTemplate>
                    OnlineQuoteID:
                    <asp:Label ID="OnlineQuoteIDLabel" runat="server" Text='<%# Eval("OnlineQuoteID") %>' />
                    <br />
                    CustomerLastName:
                    <asp:Label ID="CustomerLastNameLabel" runat="server" Text='<%# Bind("CustomerLastName") %>' />
                    <br />
                    CustomerFirstName:
                    <asp:Label ID="CustomerFirstNameLabel" runat="server" Text='<%# Bind("CustomerFirstName") %>' />
                    <br />
                    Address:
                    <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
                    <br />
                    City:
                    <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
                    <br />
                    State:
                    <asp:Label ID="StateLabel" runat="server" Text='<%# Bind("State") %>' />
                    <br />
                    ZipCode:
                    <asp:Label ID="ZipCodeLabel" runat="server" Text='<%# Bind("ZipCode") %>' />
                    <br />
                    Phone:
                    <asp:Label ID="PhoneLabel" runat="server" Text='<%# Bind("Phone") %>' />
                    <br />
                    Email:
                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                    <br />
                    Edge:
                    <asp:Label ID="EdgeLabel" runat="server" Text='<%# Bind("Edge") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblOnlineQuotes] WHERE [OnlineQuoteID] = ?" InsertCommand="INSERT INTO [tblOnlineQuotes] ([OnlineQuoteID], [CustomerLastName], [CustomerFirstName], [Address], [City], [State], [ZipCode], [Phone], [Email], [Edge], [Backsplash]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteID, CustomerLastName, CustomerFirstName, Address, City, State, ZipCode, Phone, Email, Edge, Backsplash FROM tblOnlineQuotes WHERE (OnlineQuoteID = ?)" UpdateCommand="UPDATE [tblOnlineQuotes] SET [CustomerLastName] = ?, [CustomerFirstName] = ?, [Address] = ?, [City] = ?, [State] = ?, [ZipCode] = ?, [Phone] = ?, [Email] = ?, [Edge] = ?, [Backsplash] = ? WHERE [OnlineQuoteID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="OnlineQuoteID" Type="Int32" />
                </DeleteParameters>
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
                <UpdateParameters>
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
                    <asp:QueryStringParameter Name="OnlineQuoteID" QueryStringField="OnlineQuoteID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
</div>

    </form>
</asp:Content>
