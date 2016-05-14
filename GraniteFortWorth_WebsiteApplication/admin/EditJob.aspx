<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditJob.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.EditJob" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Online Quote Webapp</title>
    <link rel="stylesheet" href="css/hcforms.css" type="text/css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/demo_acc.css" />
    <link rel="stylesheet" type="text/css" href="css/style_acc.css" />

	<script type="text/javascript" src="js/modernizr.custom.29473.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>

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
    <script language="javascript" type="text/javascript">
        function refreshGranite() {
            var iframe = document.getElementById('divGranite')
            iframe.innerHTML = iframe.innerHTML;
        }
        function refreshMeasure() {
            var iframe = document.getElementById('divMeasure')
            iframe.innerHTML = iframe.innerHTML;
        }
        function refreshServices() {
            var iframe = document.getElementById('divServices')
            iframe.innerHTML = iframe.innerHTML;
        }
        function refreshSummary() {
            var iframe = document.getElementById('divSummary')
            iframe.innerHTML = iframe.innerHTML;
        }

   </script>

    <style>
        .ac-container input:checked ~ article.ac-divCustomer{
	        height: 405px;
        }
        .ac-container input:checked ~ article.ac-divJobinfo{
	        height: 400px;
        }
        .ac-container input:checked ~ article.ac-divMeasure{
	        height: 350px;
        }
        .ac-container input:checked ~ article.ac-divGranite{
	        height: 310px;
        }
        .ac-container input:checked ~ article.ac-divSink{
	        height: 255px;
        }
        .ac-container input:checked ~ article.ac-divService{
	        height: 280px;
        }
        .ac-container input:checked ~ article.ac-divSummary{
	        height: 315px;
        }


    #measureabsolute {
        display: block;
        position: relative !important;
	    z-index: 100 !important;

        	        width: 450px;
	        float: right;
	        background: #fff;
	        color: #777;
	        -webkit-box-shadow: 0px 0px 8px 2px #d1d1d1;
	        -moz-box-shadow: 0px 0px 8px 2px #d1d1d1;
	        box-shadow: 0px 0px 8px 2px #d1d1d1; 
	        -webkit-border-top-left-radius: 0px;
	        -webkit-border-top-right-radius: 0px;
	        -webkit-border-bottom-right-radius: 6px;
	        -webkit-border-bottom-left-radius: 6px;
	        -moz-border-radius-topleft: 0px;
	        -moz-border-radius-topright: 0px;
	        -moz-border-radius-bottomright: 6px;
	        -moz-border-radius-bottomleft: 6px;
	        border-top-left-radius: 0px;
	        border-top-right-radius: 0px;
	        border-bottom-right-radius: 6px;
	        border-bottom-left-radius: 6px; 
	        overflow: hidden;
            margin-bottom:30px;
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
                <a href="http://www.granitesouthlake.com/admin2014/admin/fullcalendar231/dfw/install-calendar.aspx" target="_blank">Install Calendar</a>

                <span class="right">
                    <asp:LinkButton ID="LoggedInUserName" runat="server" Text="Hello, " /><strong><asp:LinkButton ID="LogoutLinkButton" runat="server" OnClick="LogoutLinkButton_Click">Logout</asp:LinkButton></strong>
                </span>
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->
			<header>
				<h1>DFW <span>Online Quote Webapp</span></h1>
				<h2>A web-based quote generation system of DFW Wholesale Granite.</h2>
				<p class="codrops-demos">
					<asp:LinkButton ID="PrintQuoteButton" runat="server" Text="Print Quote" OnClick="PrintQuoteButton_Click" />
					<asp:LinkButton ID="PrintQuoteWithGraniteButton" runat="server" Text="Print Quote" OnClick="PrintQuoteWithGraniteButton_Click" Visible="false" />
					<asp:LinkButton ID="PrintWorkOrderButton" runat="server" Text="Print Work Order" OnClick="PrintWorkOrderButton_Click"  />
					<asp:LinkButton ID="RequestAngiesListReviewButton" runat="server" Text="Request Angie's List Review" CssClass="current-demo" Visible="false" OnClick="RequestAngiesListReviewButton_Click" />
				</p>
			</header>
			<section class="ac-container">
				<div>
					<input id="ac-1" name="accordion-1" type="radio" checked value="customer" />
					<label for="ac-1">Customer:&nbsp;&nbsp;&nbsp;<asp:Label ID="CustomerLabel" runat="server" Text=""></asp:Label></label>
					<article class="ac-divCustomer">
                        <div class="wrapper" style="height:512px;">
                                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="OnlineQuoteID" DataSourceID="SqlDataSource1" OnItemInserted="FormView1_ItemInserted" Width="939px" OnItemUpdated="FormView1_ItemUpdated" OnItemDeleted="FormView1_ItemDeleted">
                                        <EditItemTemplate>

                                                            <div class="hcformBoxShadow" style="width:900px;">
                    		                        <div class="hcformNoShadow" style="width:50%;float:left;">

			                                            <div class="hcformtitle" style="width:100%;">Step 1: Fill in you contact information</div>

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
                                                           <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" CssClass="hcorangebutton" Text="Save" />
                                                            &nbsp;
                                                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="hcgreybutton" Text="Cancel" />
			                                            </div>

		                                            </div>
                                         </div>

                                        </EditItemTemplate>               
                                        <ItemTemplate>
                                            <div class="hcformBoxShadow" style="width:900px;">
                    		                        <div class="hcformNoShadow" style="width:50%;float:left;">

			                                            <div class="hcformtitle" style="width:100%;">Customer Info</div>

			                                            <div class="hcinput">
				                                            <div class="hcinputtext">Online Quote #: </div>
				                                            <div class="hcinputcontent">
                                                                <asp:Label ID="OnlineQuoteIDLabel" runat="server" Text='<%# Eval("OnlineQuoteID") %>' />
				                                            </div>
			                                            </div>

			                                            <div class="hcinput">
				                                            <div class="hcinputtext">Customer: </div>
				                                            <div class="hcinputcontent"> 
                                                                <asp:Label ID="CustomerFirstNameLabel" runat="server" Text='<%# Bind("CustomerFirstName") %>' />                   
                                                                 &nbsp;<asp:Label ID="CustomerLastNameLabel" runat="server" Text='<%# Bind("CustomerLastName") %>' />
				                                            </div>
			                                            </div>

                                                        <div class="hcinput">
				                                            <div class="hcinputtext">Phone: </div>
				                                            <div class="hcinputcontent">
                                                            <asp:Label ID="PhoneLabel" runat="server" Text='<%# Bind("Phone") %>' />
				                                            </div>
			                                            </div>

			                                            <div class="hcinput" style="border-bottom: 0;">
				                                            <div class="hcinputtext">Email: </div>
				                                            <div class="hcinputcontent">
                                                                <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />                                        
				                                          </div>
                                    
				                                          </div>

                                                        <div class="hcbuttons">
                                                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Edge") %>' Visible="false" />

			                                            </div>
                                                    </div>

                                                     <div class="hcformNoShadow2" style="width:50%;">

			                                            <div class="hcformtitle" style="width:100%;">&nbsp;&nbsp;</div>

                                                        <div class="hcinput">
				                                            <div class="hcinputtext">Job Site Address: </div>
				                                            <div class="hcinputcontent">
                                                                <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
				                                            </div>
			                                            </div>

                                                        <div class="hcinput">
				                                            <div class="hcinputtext">Job Site City: </div>
				                                            <div class="hcinputcontent">
                                                            <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
				                                            </div>
			                                            </div>
                                                        <div class="hcinput">
				                                            <div class="hcinputtext">Job Site State: </div>
				                                            <div class="hcinputcontent">
                                                            <asp:Label ID="StateLabel" runat="server" Text='<%# Bind("State") %>' />
				                                            </div>
			                                            </div>

                                                        <div class="hcinput" style="border-bottom: 0;">
				                                            <div class="hcinputtext">Job Site Zipcode: </div>
				                                            <div class="hcinputcontent">
                                                            <asp:Label ID="ZipCodeLabel" runat="server" Text='<%# Bind("ZipCode") %>' />
                                                            <asp:Label ID="InvoiceMethodLabel" runat="server" Visible="false" Text='<%# Bind("InvoiceMethod") %>' />
				                                            </div>
			                                            </div>

			                                            <div class="hcbuttons">
                                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="hcorangebutton" />
                                            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="hcgreybutton" OnClientClick='return confirm(&apos;You are about to delete a Job. This cannot be undone.&apos;);' />			                    </div>

		                                            </div>
                                         </div>

                                           </ItemTemplate>
                                    </asp:FormView>             
                        </div>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblOnlineQuotes] WHERE [OnlineQuoteID] = ?" InsertCommand="INSERT INTO [tblOnlineQuotes] ([OnlineQuoteID], [CustomerLastName], [CustomerFirstName], [Address], [City], [State], [ZipCode], [Phone], [Email], [Edge], [Backsplash]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteID, CustomerLastName, CustomerFirstName, Address, City, State, ZipCode, Phone, Email, Edge, Backsplash, InvoiceMethod FROM tblOnlineQuotes WHERE (OnlineQuoteID = ?)" UpdateCommand="UPDATE [tblOnlineQuotes] SET [CustomerLastName] = ?, [CustomerFirstName] = ?, [Address] = ?, [City] = ?, [State] = ?, [ZipCode] = ?, [Phone] = ?, [Email] = ?, [Edge] = ?, [Backsplash] = ? WHERE [OnlineQuoteID] = ?">
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
                                            <asp:QueryStringParameter Name="?" QueryStringField="OnlineQuoteID" DefaultValue="290" />
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
					</article>
				</div>
				<div>
					<input id="ac-2" name="accordion-1" type="radio" value="jobinfo" />
					<label for="ac-2">Job Info</label>
					<article class="ac-divJobinfo">
                           <iframe  runat="server" id="frameJobInfo" src="" width="890px" height="400px" frameborder="0" seamless  ></iframe>                     
					</article>
				</div>
				<div>
					<input id="ac-3" name="accordion-1" type="radio" value="measure" onclick="refreshMeasure()" />
					<label for="ac-3">Measurement</label>
					<article class="ac-divMeasure">
                        <div id="divMeasure">
                        <iframe  runat="server" id="frameMeasure" src="" width="890px" height="355px" frameborder="0"  seamless ></iframe>
                        </div>
					</article>
				</div>
				<div>
					<input id="ac-4" name="accordion-1" type="radio" value="granite" onclick="refreshGranite()" />
					<label for="ac-4">Granite</label>
					<article class="ac-divGranite">
                        <div id="divGranite">
                        <iframe  runat="server" id="frameGranite" src="Jobs-granite.aspx" width="890px" height="310px" frameborder="0" seamless  ></iframe>
                            </div>
					</article>
				</div>
				<div>
					<input id="ac-5" name="accordion-1" type="radio"  />
					<label for="ac-5">Sinks</label>
					<article class="ac-divSink">
                        <div id="divSink">
                        <iframe runat="server" id="frameSink" src="" width="890px" height="300px" frameborder="0"  seamless ></iframe>
                            </div>
					</article>
				</div>
				<div>
					<input id="ac-6" name="accordion-1" type="radio" onclick="refreshServices()" />
					<label for="ac-6">Services</label>
					<article class="ac-divService">
                        <div id="divServices">
                        <iframe  runat="server" id="frameService" src="" width="890px" height="280px" frameborder="0"  seamless ></iframe>
                            </div>
					</article>
				</div>
				<div>
					<input id="ac-7" name="accordion-1" type="radio" value="summary" onclick="refreshSummary()" />
					<label for="ac-7">Summary</label>
					<article class="ac-divSummary">
                        <div id="divSummary">
                        <span style="float:left;width:305px;margin-top:0px;position:absolute;">
                         <iframe  runat="server" id="frameNotes" src="" width="360px" height="310px" frameborder="0" seamless  ></iframe>
                            </span>
                            <span style="float:right;width:365px;margin-left:450px;position:relative;">
                     <iframe  runat="server" id="framePayment" src="" width="360px" height="310px" frameborder="0" seamless  ></iframe>
                    </span>
                            </div>
					</article>
				</div>


<p class="codrops-demos"><a href="#" id="show" class="current-demo" style="float:right;">QUOTE FROM THIS QUOTE...</a></p>
<div id="measureabsolute" style="width:330px;">
<div class="hcformtitle" style="width:310px;">You can create a new quote base on this quote. <br />Tick the data you wish to inherit from this quote.</div>
     <iframe  runat="server" id="frameQuote" src="Jobs-quote.aspx" width="325px" height="90px" frameborder="0" seamless  ></iframe>

    
    <div class="hcbuttons">               
                <asp:LinkButton ID="OkButton" runat="server" CausesValidation="True" Text="&nbsp;&nbsp;&nbsp;&nbsp;Ok&nbsp;&nbsp;&nbsp;&nbsp;" CssClass="hcorangebutton" OnClick="OkButton_Click"  />
            &nbsp;<button id="hide" class="hcgreybutton">Cancel</button>
    </div>

    <asp:SqlDataSource ID="SqlDataSourceCustomerJob" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" InsertCommand="INSERT INTO tblOnlineQuotes(OnlineQuoteID, CustomerLastName, CustomerFirstName, Address, City, State, ZipCode, Phone, Email, Edge, LinearFeet, Backsplash, Notes, AssignedToID, LeadID, DateCreated, TaskDate, TaskTime, StatusID, SalesManID, InstallDate, InstallTime, QuoteWithGranite, BeforePicFilePath, MeasurementPicFilePath, AfterPicFilePath, InitiatedBy, InitiatedDate) SELECT ? AS NewOnlineQuoteID, CustomerLastName, CustomerFirstName, Address, City, State, ZipCode, Phone, Email, Edge, LinearFeet, Backsplash, Notes, AssignedToID, LeadID, DateCreated, TaskDate, TaskTime, StatusID, SalesManID, InstallDate, InstallTime, QuoteWithGranite, BeforePicFilePath, MeasurementPicFilePath, AfterPicFilePath, InitiatedBy, NOW() AS NewInitiatedDate FROM tblOnlineQuotes tblOnlineQuotes_1 WHERE (OnlineQuoteID = ?)" ProviderName="System.Data.OleDb">       
        <InsertParameters>
            <asp:Parameter Name="NewOnlineQuoteID" Type="Int32" />
            <asp:QueryStringParameter Name="FromOnlineQuoteID" QueryStringField="OnlineQuoteID" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceCustomerOnly" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" InsertCommand="INSERT INTO tblOnlineQuotes(OnlineQuoteID, CustomerLastName, CustomerFirstName, Address, City, State, ZipCode, Phone, Email, InitiatedBy, InitiatedDate) SELECT ? AS NewOnlineQuoteID, CustomerLastName, CustomerFirstName, Address, City, State, ZipCode, Phone, Email, InitiatedBy, InitiatedDate FROM tblOnlineQuotes tblOnlineQuotes_1 WHERE (OnlineQuoteID = ?)" ProviderName="System.Data.OleDb">       
        <InsertParameters>
            <asp:Parameter Name="NewOnlineQuoteID" Type="Int32" />
            <asp:QueryStringParameter Name="FromOnlineQuoteID" QueryStringField="OnlineQuoteID" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceNoCustomer" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" InsertCommand="INSERT INTO tblOnlineQuotes(OnlineQuoteID, CustomerLastName, CustomerFirstName, InitiatedBy, InitiatedDate) VALUES (?, '[Unnamed Quote]', ' ', 'admin', NOW())" ProviderName="System.Data.OleDb">       
        <InsertParameters>
            <asp:Parameter Name="NewOnlineQuoteID" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceGranite" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" InsertCommand="INSERT INTO tblOnlineQuoteStone(OnlineQuoteStoneID, OnlineQuoteID, SlabColorID, PublishedPrice, WOPrice, SizeLength, SizeWidth, StateTax, Surcharge, NSlab, SquareFeetQty, FabPricePrintOveride) SELECT ? AS NewOnlineQuoteStoneID, ? AS NewOnlineQuoteID, SlabColorID, PublishedPrice, WOPrice, SizeLength, SizeWidth, StateTax, Surcharge, NSlab, SquareFeetQty, FabPricePrintOveride FROM tblOnlineQuoteStone tblOnlineQuoteStone_1 WHERE (OnlineQuoteID = ?) AND (OnlineQuoteStoneID = ?)" ProviderName="System.Data.OleDb">       
        <InsertParameters>
            <asp:Parameter Name="NewOnlineQuoteStoneID" Type="Int32" />
            <asp:Parameter Name="NewOnlineQuoteID" Type="Int32" />
            <asp:QueryStringParameter Name="FromOnlineQuoteID" QueryStringField="OnlineQuoteID" Type="Int32" />
            <asp:Parameter Name="FromOnlineQuoteStoneID" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceMeasures" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" InsertCommand="INSERT INTO tblOnlineQuotesMeasures(OnlineQuoteID, OnlineQuoteStoneID, Measure, Length, Width) SELECT ? AS NewOnlineQuoteID, ? AS NewOnlineQuoteStoneID, Measure, Length, Width FROM tblOnlineQuotesMeasures tblOnlineQuotesMeasures_1 WHERE (OnlineQuoteStoneID = ?)" ProviderName="System.Data.OleDb">       
        <InsertParameters>
            <asp:Parameter Name="NewOnlineQuoteID" Type="Int32" />
            <asp:Parameter Name="NewOnlineQuoteStoneID" Type="Int32" />
            <asp:Parameter Name="FromOnlineQuoteStoneID" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceSinks" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" InsertCommand="INSERT INTO tblOnlineQuotesSinks(OnlineQuoteID, SinkID, Quantity, PurchasePrice) SELECT ? AS NewOnlineQuoteID, SinkID, Quantity, PurchasePrice FROM tblOnlineQuotesSinks tblOnlineQuotesSinks_1 WHERE (OnlineQuoteID = ?)" ProviderName="System.Data.OleDb">       
        <InsertParameters>
            <asp:Parameter Name="NewOnlineQuoteID" Type="Int32" />
            <asp:QueryStringParameter Name="FromOnlineQuoteID" QueryStringField="OnlineQuoteID" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceServices" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" InsertCommand="INSERT INTO tblOnlineQuotesServices(OnlineQuoteID, ServicesID, Quantity, Price) SELECT ? AS NewOnlineQuoteID, ServicesID, Quantity, Price FROM tblOnlineQuotesServices tblOnlineQuotesServices_1 WHERE (OnlineQuoteID = ?)" ProviderName="System.Data.OleDb">       
        <InsertParameters>
            <asp:Parameter Name="NewOnlineQuoteID" Type="Int32" />
            <asp:QueryStringParameter Name="FromOnlineQuoteID" QueryStringField="OnlineQuoteID" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>

</div>


<script>
    $(document).ready(function () {
        $("#measureabsolute").hide();
        $("#hide").click(function (event) {
            event.preventDefault();
            $("#measureabsolute").hide();
            $("#show").show();
        });
        $("#show").click(function (event) {
            event.preventDefault();
            $("#show").hide();
            $("#measureabsolute").show();
            scrollToAnchor('ScrollButtom');
        });
    });
</script>

<script>
    function scrollToAnchor(aid) {
        var aTag = $("a[name='" + aid + "']");
        $('html,body').animate({ scrollTop: aTag.offset().top }, 'slow');
    }
</script>

</section>



<a name="ScrollButtom"/>
</div>
</form>
</body>
</html>