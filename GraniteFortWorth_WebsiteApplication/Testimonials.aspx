<%@ Page Title="Testimonials" Language="C#" MasterPageFile="~/SiteClassic.Master" AutoEventWireup="true" CodeBehind="Testimonials.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.Testimonials" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Rancho">
<style type="text/css">

.testibanner {background:url(/images/box_bg.png) repeat;color:#faf3ed box-shadow:0 0 5px rgba(0, 0, 0, .4);-moz-box-shadow:0 0 5px rgba(0, 0, 0, .4);-webkit-box-shadow:0 0 5px rgba(0, 0, 0, .4);width:70%; margin-left:auto;margin-right:auto;padding-left:20px;padding-right:20px;padding-bottom:20px;}
.testibanner > div {background:url(/images/box_top.png) 0 top no-repeat;color:#faf3ed;padding:0;padding-top:20px;overflow:hidden}
.testibanner2 {left:0px;top:0;position:absolute;width:271px;z-index:2;text-align:center}
.testibanner strong {font-size:52px;color:#bf0f0a;display:block;line-height:1.2em;text-transform:uppercase;padding:55px 0 0 0;letter-spacing:-2px}
.testibanner strong span {display:block;margin-top:-16px}
.testibanner b {display:block;font-size:27px;color:#312826;text-transform:uppercase;padding:0 0 23px 0;line-height:1.2em;letter-spacing:-1px}
.testibanner p {background:url(../images/quot1.png) 0 0 no-repeat}
.testibanner p em {display:block;background:url(../images/quot2.png) right bottom no-repeat;padding:0 20px 0 20px;text-align:center;font-family: Rancho, Junge, Ovo, Georgia, "Times New Roman", Times, serif;font-size:x-large;}


</style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<form id="form1" runat="server">
<div class="wrapper">
				<section class="col1 pad_left1">
                <div style="color:#faf3ed">
					<h2 style="color:#faf3ed">Testimonials</h2>
                        <div>
                            These are just a few of the comments we have received from our clients.  We are eager to show you why our <a href="admin/References.aspx" target="_blank" style="color:white;"><em>clients refer us</em></a> on a consistent basis.  
                            <p></p>
                        </div>


<asp:ListView ID="ListView1" runat="server" DataKeyNames="TestimonialID" DataSourceID="SqlDataSource1">
                        
                        
                        <EmptyDataTemplate>
                            <p>No available testimonials.</p>
                        </EmptyDataTemplate>
                        
                        <ItemTemplate>
						<div class="testibanner">
                        <div>
							<p>
								<em><asp:Label ID="TestimonyLabel" runat="server" Text='<%# Eval("Testimony") %>' /> &nbsp;</em>
							</p>
                            <div style="text-align:right;padding-right:30px;padding-bottom:10px;">
                                <asp:Label ID="ByNameLabel" runat="server" Text='<%# Eval("ByName") %>' /><br />
                                <asp:Label ID="ByAddressLabel" runat="server" Text='<%# Eval("ByAddress") %>' />
                            </div>
                            </div>
						</div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" runat="server" style="">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                            <div style="text-align:center;">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="3">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>

                            </div>
                        </LayoutTemplate>
                        
                    </asp:ListView>

                           
						
     
						

                </div>
                    <div style="color:#faf3ed;">

                    </div>
                    
				    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [TestimonialID], [ByName], [ByAddress], [Testimony] FROM [TestimonialsQry]"></asp:SqlDataSource>
				</section>
				
        
                <section class="col2 pad_left1">
                    <div class="sidemenu">
					<h2>DFW Wholesale Granite</h2>
					<ul>
								<li><a href="Default.aspx"><span>></span>Home</a><p></p></li>
								<li><a href="GraniteColors.aspx"><span>></span>Granite</a><p></p></li>
								<li><a href="MarbleColors.aspx"><span>></span>Marble</a><p></p></li>
								<li><a href="GraniteEdges.aspx"><span>></span>Edges</a><p></p></li>
								<li><a href="Testimonials.aspx"><span>></span>Testimonials</a><p></p></li>
								<li><a href="Contact.aspx"><span>></span>Free Estimate</a><p></p></li>
                                <li><a href="FAQ.aspx"><span>></span>FAQ</a><p></p></li>
                                <li><a href="GraniteCare.aspx"><span>></span>Granite Care</a><p></p></li>
								<li><a href="Showrooms.aspx"><span>></span>Visit Our Showroom</a><p></p></li>
                                <li><a href="#"><span>></span>SALE</a><p></p></li>
                                <li><a href="#"><span>></span>Tile Backsplashes</a><p></p></li>
                                <li><a href="Sinks.aspx"><span>></span>Sinks</a><p></p></li>
                                <li><a href="KitchenGallery.aspx"><span>></span>Gallery of Kitchens</a><p></p></li>
                                <li><a href="Contact.aspx"><span>></span>Contact Us</a><p></p></li>
					</ul>
                     &nbsp; &nbsp; &nbsp;
                        <div style="padding-left:10px;padding-right:5px;">
                                <p>Give us a call today or fill out our <a href="Contact.aspx">Online Request Form</a> and a professional will contact you as quickly as possible.  We would love to add you to our list of highly <a href="admin/References.aspx" target="_blank">satisfied customers!</a></p>                    
                         </div>
                    </div>
				</section>
			</div>

<</form>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    


</asp:Content>
