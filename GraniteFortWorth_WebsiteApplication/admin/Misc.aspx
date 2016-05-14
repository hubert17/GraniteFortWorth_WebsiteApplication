<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Misc.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.Misc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Miscellaneous</title>
    <link rel="stylesheet" href="css/hcforms.css" type="text/css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/demo_acc.css" />
    <link rel="stylesheet" type="text/css" href="css/style_acc.css" />
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
			    .auto-style1 {
                    width: 100%;
                }
			    </style>
		    <![endif]-->
     <style>
        .ac-container input:checked ~ article.ac-divCustomer{
	        height: 230px;
        }
        .ac-container input:checked ~ article.ac-divJobinfo{
	        height: 220px;
        }
        .ac-container input:checked ~ article.ac-divMeasure{
	        height: 220px;
        }
        .ac-container input:checked ~ article.ac-divGranite{
	        height: 220px;
        }
        .ac-container input:checked ~ article.ac-divSink{
	        height: 220px;
        }
        .ac-container input:checked ~ article.ac-divService{
	        height: 280px;
        }
        .ac-container input:checked ~ article.ac-divSummary{
	        height: 280px;
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
				<h1>DFW <span>Online Quote Webapp</span></h1>
				<h2>Miscellaneous Page</h2>
				<p class="codrops-demos">
					<asp:LinkButton ID="AdminHomeButton" runat="server" Text="Admin Home" CssClass="current-demo" OnClick="AdminHomeButton_Click"  />
					<asp:LinkButton ID="GraniteButton" runat="server" Text="Granites" OnClick="GraniteButton_Click" />
					<asp:LinkButton ID="ServicesButton" runat="server" Text="Services" OnClick="ServicesButton_Click"    />
				</p>
			</header>
			<section class="ac-container">
				<div>
					<input id="ac-1" name="accordion-1" type="radio"  />
					<label for="ac-1">Web Accounts</label>
					<article class="ac-divCustomer">                        
                        <iframe runat="server" id="frmAccounts" src="Misc-accounts.aspx" width="920px" height="300px" frameborder="0"  seamless ></iframe>                        
					</article>
				</div>
				<div>
					<input id="ac-2" name="accordion-1" type="radio"  />
					<label for="ac-2">Leads</label>
					<article class="ac-divJobinfo">
                        <iframe runat="server" id="frameLeads" src="Misc-leads.aspx" width="890px" height="300px" frameborder="0"  seamless ></iframe>
					</article>
				</div>
				<div>
					<input id="ac-3" name="accordion-1" type="radio" />
					<label for="ac-3">Measurement Assets</label>
					<article class="ac-divMeasure">
                        <iframe runat="server" id="frmAsset" src="Misc-assets.aspx" width="890px" height="300px" frameborder="0"  seamless ></iframe>
					</article>
				</div>
				<div>
					<input id="ac-4" name="accordion-1" type="radio"  />
					<label for="ac-4">Salesmen</label>
					<article class="ac-divGranite">
                        <iframe runat="server" id="frmAssignedTo" src="Misc-assignedtos.aspx" width="890px" height="300px" frameborder="0"  seamless ></iframe>
					</article>
				</div>
				<div>
					<input id="ac-5" name="accordion-1" type="radio"  />
					<label for="ac-5">Assigned To's</label>
					<article class="ac-divSink">
                        <iframe runat="server" id="frmSalesMan" src="Misc-salesman.aspx" width="890px" height="300px" frameborder="0"  seamless ></iframe>
					</article>
				</div>
                <div>
					<input id="ac-6" name="accordion-1" type="radio"  />
					<label for="ac-6">Email Notifications</label>
					<article class="ac-divService">
                        <div id="divServices">
                        <iframe runat="server" id="frmEmailNotify" src="Misc-emailnotify.aspx" width="890px" height="300px" frameborder="0"  seamless ></iframe>
                            </div>
					</article>
                </div>
				<div style="visibility:hidden;">
					<input id="ac-7" name="accordion-1" type="radio"   />
					<label for="ac-7"> </label>
					<article class="ac-divSummary">
                        <div id="divSummary">

                            </div>
					</article>
				</div>
			</section>
        </div>

    </form>
</body>
</html>
