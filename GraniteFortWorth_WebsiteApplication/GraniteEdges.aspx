<%@ Page Title="EDGES" Language="C#" MasterPageFile="~/SiteClassic.Master" AutoEventWireup="true" CodeBehind="GraniteEdges.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.GraniteEdges" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <META NAME="Description" CONTENT="These are the most popular edges for bathrooms and kitchens. The profiles shown here are on ¾"(2cm ) and 1¼" (3cm) stone. Granite Fort Worth Southlake ">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <form id="form1" runat="server">

    <div class="wrapper">
				<section class="col1 pad_left1">
					<h2>Granite Edges</h2>
					<div class="wrapper">
                        <div>
                            These are the most popular edges for bathrooms and kitchens.
                            The profiles shown here are on ¾"(2cm ) and 1¼" (3cm) stone.
                            Our basic price includes the Eased Edge.
                            Additional cost may apply to Upgrade and Design edges.
                            <br /><br />
                        </div>


                                         
                        <asp:ListView ID="ListView1" runat="server" DataKeyNames="EdgeID" DataSourceID="SqlDataSource1">
                            <AlternatingItemTemplate>
                               <div class="cols" style="float:right; padding-bottom:20px;" itemscope itemtype="http://data-vocabulary.org/Product"><div class="wrapper">
								<figure class="left marg_right1"><asp:Image ID="Image2" Runat="server" ImageUrl='<%# Eval("ImageFilename", "Images/Edges/{0}") %>' AlternateText='<%# Eval("EdgeName") %>' itemprop="image" /></figure>
								<p itemprop="name"><br /><a href="#"><asp:Label ID="Label1" runat="server" Text='<%# Eval("EdgeName") %>' /></a><br />
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("WebPrice") %>' itemprop="price" /><span itemprop="availability" content="in_stock" ></span></p>
							</div></div>
                            </AlternatingItemTemplate>
                            
                            <EmptyDataTemplate>
                                <span>No data was returned.</span>
                            </EmptyDataTemplate>
                            
                            <ItemTemplate>

                            <div class="cols" style="padding-bottom:20px;" itemscope itemtype="http://data-vocabulary.org/Product"><div class="wrapper">
								<figure class="left marg_right1"><asp:Image ID="Image1" Runat="server" ImageUrl='<%# Eval("ImageFilename", "Images/Edges/{0}") %>' AlternateText='<%# Eval("EdgeName") %>' itemprop="image" /></figure>
								<p itemprop="name"><br /><a href="#"><asp:Label ID="EdgeNameLabel" runat="server" Text='<%# Eval("EdgeName") %>' /></a><br />
                                    <asp:Label ID="WebPriceLabel" runat="server" Text='<%# Eval("WebPrice") %>' itemprop="price" /><span itemprop="availability" content="in_stock" ></span></p>
							</div></div>

                            </ItemTemplate>
                            <LayoutTemplate>
                                <div id="itemPlaceholderContainer" runat="server" style="">
                                    <span runat="server" id="itemPlaceholder" />
                                </div>
                                <div style="">
                                </div>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <span style="">EdgeID:
                                <asp:Label ID="EdgeIDLabel" runat="server" Text='<%# Eval("EdgeID") %>' />
                                <br />
                                EdgeName:
                                <asp:Label ID="EdgeNameLabel" runat="server" Text='<%# Eval("EdgeName") %>' />
                                <br />
                                WebPrice:
                                <asp:Label ID="WebPriceLabel" runat="server" Text='<%# Eval("WebPrice") %>' />
                                <br />
                                ImageFilename:
                                <asp:Label ID="ImageFilenameLabel" runat="server" Text='<%# Eval("ImageFilename") %>' />
                                <br />
<br /></span>
                            </SelectedItemTemplate>
                        </asp:ListView>

					    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [EdgeID], [EdgeName], [WebPrice], [ImageFilename] FROM [EdgesQry]"></asp:SqlDataSource>

					</div>
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
								<li><a href="#"><span>></span>Visit Our Showroom</a><p></p></li>
                                <li><a href="#"><span>></span>SALE</a><p></p></li>
                                <li><a href="#"><span>></span>Tile Backsplashes</a><p></p></li>
                                <li><a href="Sinks.aspx"><span>></span>Sinks</a><p></p></li>
                                <li><a href="KitchenGallery.aspx"><span>></span>Gallery of Kitchens</a><p></p></li>
                                <li><a href="Contact.aspx"><span>></span>Contact Us</a><p></p></li>
					</ul>
                     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                    </div>
				</section>
			</div>


    </form>


</asp:Content>
