<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineQuote-custinfo.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.OnlineQuote_custinfo" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
        <meta name="robots" content="noindex" />
    <title>ONLINE QUOTE SYSTEM | DFW Wholesale Granite Fort Worth</title>
    <meta name="Description" content="Fill out the steps below to submit your countertop requirements and we will provide you with a custom quote for your project. Granite Fort Worth Southlake " />
    <meta charset="utf-8" />

    <script>
        document.write('<style type="text/undefined">');
        window.location.href = 'http://granitesouthlake.com/mobile/OnlineQuote?SlabColorID=' + '<%= Request.QueryString["SlabColorID"] %>';
    </script>

    <link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
    <script type="text/javascript" src="js/jquery-1.6.js" ></script>
    <script type="text/javascript" src="js/cufon-yui.js"></script>
    <script type="text/javascript" src="js/cufon-replace.js"></script>  
    <script type="text/javascript" src="js/Forum_400.font.js"></script>


</head>

<body id="page4">
    <form id="form1" runat="server">
    <div class="body6">
	<div class="body1">
    <div class="main">
    <!-- header -->
			    <header style="height:110px;">
				    <h1><a href="default.aspx" id="logo">DFW Granite Logo</a></h1>
				    <nav>
					    <ul id="top_nav">
						    <li><a href="Default.aspx" title="Home"><img src="images/icon_1.gif" alt=""></a></li>
						    <li><a href="Contact.aspx" title="Contact Us"><img src="images/icon_3.gif" alt=""></a></li>
						    <li class="end"><a>
                                    <!-- Place this tag where you want the +1 button to render. -->
                                    <div class="g-plusone" data-href="http://www.granitesouthlake.com/Default.aspx"></div>

                                    <!-- Place this tag after the last +1 button tag. -->
                                    <script type="text/javascript">
                                        (function () {
                                            var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
                                            po.src = 'https://apis.google.com/js/plusone.js';
                                            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
                                        })();
                                    </script>
                                </a>
						    </li>
					    </ul>
				    </nav>
				    <nav>
					    <ul id="menu">
						    <li><a href="Default.aspx">Home</a></li>
						    <li><a href="GraniteColors.aspx">Granite</a></li>
						    <li><a href="MarbleColors.aspx">Marble</a></li>
						    <li><a href="GraniteEdges.aspx">Edges</a></li>
                            <li><a href="Sinks.aspx">Sinks</a></li>
						    <li><a href="onlineqoute">Online Quote</a></li>
					    </ul>
				    </nav>
			    </header>
    <!-- / header -->

    <!-- content -->

        

    </div>
	</div>
    </div>

    <div class="body2">
	<div class="main">
	<article id="content2">
    <div>
        



    <h2>Online Quote System </h2>Use our online quote utility to calculate the estimated price of the right countertop for your taste and budget.
        <div class="wrapper" style="height:512px;">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="OnlineQuoteID" DataSourceID="SqlDataSource1" DefaultMode="Insert" OnItemInserted="FormView1_ItemInserted" Width="939px" OnItemUpdated="FormView1_ItemUpdated" OnItemInserting="FormView1_ItemInserting">
                <EditItemTemplate>

                                    <div class="hcformBoxShadow" style="width:900px;">
                    		<div class="hcformNoShadow" style="width:50%;float:left;">

			                    <div class="hcformtitle" style="width:100%;">Step 1: Kindly fill in your valid contact information.</div>

			                    <div class="hcinput">
				                    <div class="hcinputtext">Your Firstname: </div>
				                    <div class="hcinputcontent">
                                        <asp:TextBox ID="CustomerFirstNameTextBox" runat="server" Text='<%# Bind("CustomerFirstName") %>' />
				                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CustomerFirstNameTextBox" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
				                    </div>
			                    </div>

			                    <div class="hcinput">
				                    <div class="hcinputtext">Your Lastname: </div>
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
				                    <div class="hcinputcontent">
                                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="EmailTextBox" ForeColor="Red">*</asp:RequiredFieldValidator>
                                        <br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid e-mail address." ControlToValidate="EmailTextBox" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red">Invalid e-mail address.</asp:RegularExpressionValidator>
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

			                    <div class="hcformtitle" style="width:100%;">Step 1: Kindly fill in your valid contact information.</div>

			                    <div class="hcinput">
				                    <div class="hcinputtext">Your Firstname: </div>
				                    <div class="hcinputcontent">
                                        <asp:TextBox ID="CustomerFirstNameTextBox" runat="server" Text='<%# Bind("CustomerFirstName") %>' />
				                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CustomerFirstNameTextBox" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
				                    </div>
			                    </div>

			                    <div class="hcinput">
				                    <div class="hcinputtext">Your Lastname: </div>
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
				                    <div class="hcinputcontent">
                                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="EmailTextBox" ForeColor="Red">*</asp:RequiredFieldValidator>
                                        <br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid e-mail address." ControlToValidate="EmailTextBox" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red">Invalid e-mail address.</asp:RegularExpressionValidator>
				                  </div>
                                    
				                  </div>

                                <div class="hcbuttons">
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

            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblOnlineQuotes] WHERE [OnlineQuoteID] = ?" InsertCommand="INSERT INTO tblOnlineQuotes(OnlineQuoteID, CustomerLastName, CustomerFirstName, Address, City, State, ZipCode, Phone, Email, Edge, Backsplash, DateCreated) VALUES (?, StrConv(?, 3), StrConv(?, 3), ?, ?, ?, ?, ?, ?, ?, ?, NOW())" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteID, CustomerLastName, CustomerFirstName, Address, City, State, ZipCode, Phone, Email, Edge, Backsplash FROM tblOnlineQuotes WHERE (OnlineQuoteID = ?)" UpdateCommand="UPDATE [tblOnlineQuotes] SET [CustomerLastName] = ?, [CustomerFirstName] = ?, [Address] = ?, [City] = ?, [State] = ?, [ZipCode] = ?, [Phone] = ?, [Email] = ?, [Edge] = ?, [Backsplash] = ? WHERE [OnlineQuoteID] = ?">
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







    </div>
	</article>   
    <!-- / content -->
	</div>
    </div>


    <div class="body3">
	    <div class="body4">
		    <div class="main">
    <!-- footer -->
			    <footer>
				    <div class="wrapper">
					    <section class="col1 pad_left1">
						    <h3>Call Us: <span>(817) 300-3298</span></h3>
						    © Copyright 2013 DFW Wholesale Granite. All Rights Reserved.  <a href="http://www.granitefortworth.net/" target="_blank" rel="nofollow">www.granitefortworth.net</a>
					    </section>
					    <section class="col2 pad_left1">
						    <h3>Follow Us </h3>
						    <ul id="icons">
							    <li><a href="Contact.aspx" class="normaltip" title="Facebook"><img src="images/icon1.gif" alt=""></a></li>
							    <li><a href="Contact.aspx" class="normaltip" title="Twitter"><img src="images/icon3.gif" alt=""></a></li>
							    <li><a href="https://plus.google.com/112531340324083432646/" class="normaltip" title="Google+"><img src="images/icon5.gif" alt=""></a></li>
						    </ul>
                            Web development by <a href="mailto:webmaster@granitesouthlake.com ">BERNARD GABON</a>
					    </section>
				    </div>
				    <!-- {%FOOTER_LINK} -->
			    </footer>
    <!-- / footer -->
		    </div>
	    </div>
    </div>
    <script type="text/javascript"> Cufon.now(); </script>



    </form>



</body>
</html>
