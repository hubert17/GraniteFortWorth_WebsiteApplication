<%@ Page Title="MARBLE SLABS" Language="C#" MasterPageFile="~/SiteClassic.Master" AutoEventWireup="true" CodeBehind="MarbleColors.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.MarbleColors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<META NAME="Description" CONTENT="Please click on an image below for a larger view. Emperador Dark, Diano Reale, Crema Marfil Elegante,  Granite Fort Worth Southlake Texas">
    	<!-- Add mousewheel plugin (this is optional) -->
	    <script type="text/javascript" src="/Scripts/jquery.mousewheel-3.0.6.pack.js"></script>

        <!-- fancyBox -->
        <link rel="stylesheet" href="/FancyBox/css/jquery.fancybox.css?v=2.0.5" type="text/css" media="screen" />
        <script type="text/javascript" src="/FancyBox/js/jquery.fancybox.pack.js?v=2.0.5"></script>
        <!-- fancyBox button helpers -->
        <link rel="stylesheet" href="/FancyBox/css/jquery.fancybox-buttons.css?v=2.0.5" type="text/css" media="screen" />
        <script type="text/javascript" src="/FancyBox/js/jquery.fancybox-buttons.js?v=2.0.5"></script>
        <!-- fancyBox thumbnail helpers -->
        <link rel="stylesheet" href="/FancyBox/css/jquery.fancybox-thumbs.css?v=2.0.5" type="text/css" media="screen" />
        <script type="text/javascript" src="/FancyBox/js/jquery.fancybox-thumbs.js?v=2.0.5"></script>

 <style>
      #content2 {padding-bottom:0px;}

      .searchtextbox {width:200px;height:26px;padding:1px 5px;color:#220000;font:14px Georgia, "Times New Roman", Times, serif;margin:0;}
      .searchlabel {vertical-align: middle}

      .ColorsGallery {
        display: block;
        float: left;
        height: 201px;
        width: 180px;
        text-align: center;
        background-color: #780000;
        margin: 3px;
        padding: 6px;
        border-right: #e2dbc7 5px solid;
        border-top: #e2dbc7 5px solid;
        border-left: #e2dbc7 5px solid;
        border-bottom: #e2dbc7 5px solid;
        color:#faf3ed;
        line-height: 12pt;
        font-size:13px;  
        font-weight: normal;   
    }

    .ColorsGalleryNameID {
        float:left;
        padding:2px 0 0 5px;
        width: 70%;
        text-align: left;
    }

      .ColorsGalleryName {
         font-weight: bold;
      }

    .ColorsGalleryPrice {
        float:right;
        padding:2px 5px 0 0;
        text-align: right;
    }  

    
      </style>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
<form id="form1" runat="server">
    <div class="wrapper">
				<section class="col1 pad_left1">
                    <h2>Marble Slabs </h2>
                    &nbsp;<p>
                        <asp:Label ID="Label1" runat="server" Text="Marble: " class="searchlabel"></asp:Label>
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="searchtextbox"></asp:TextBox>&nbsp;
                        <asp:DropDownList ID="ddlPriceRange" runat="server" CssClass="searchtextbox" AutoPostBack="True" OnSelectedIndexChanged="ddlPriceRange_SelectedIndexChanged">
                            <asp:ListItem Value="0">Price Range: All</asp:ListItem>
                            <asp:ListItem Value="1">&lt; $10</asp:ListItem>
                            <asp:ListItem Value="2">$10 - $19.99</asp:ListItem>
                            <asp:ListItem Value="3">$20 - $29.99</asp:ListItem>
                            <asp:ListItem Value="4">$30+</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="button1" />                        
                        <br /><br />Please click on an image below for a larger view.


   
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="SlabColorID">             
        <EmptyDataTemplate>
            <span><p>No data was returned.</p></span>
        </EmptyDataTemplate>        
     
        <ItemTemplate>
            <div itemscope itemtype="http://data-vocabulary.org/Product" class="ColorsGallery">                 
		        <a class="fancybox" href='<%# Eval("ImageFilename", "images/Slabs/{0}") %>' data-fancybox-group="gallery" title='<%# Eval("SlabColorName") %>'>
                <asp:Image ID="ImageFilenameLabel" Runat="server" ImageUrl='<%# Eval("ImageFilename", "images/Slabs/thumb/{0}") %>' AlternateText='<%# Eval("SlabColorName") %>' width="170" height="170" itemprop="image" /></a>
                <div class="ColorsGalleryNameID"><div itemprop="name" class="ColorsGalleryName"><asp:Label ID="GraniteColorLabel" runat="server" Text='<%# Eval("SlabColorName") %>' /></div></div>
                <div class="ColorsGalleryPrice"><asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("WebsitePrice", "${0}") %>' itemprop="price" /><br /><span itemprop="availability" content="in_stock" ></span></div>
            </div>

        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <p><br /><br /></p>
            <div style="clear:both; text-align:center;">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="15">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" ButtonCssClass="button1" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        
        </asp:ListView>
                       
	                </p> <br /><em>* Slab sf prices only.
				    <br />
                    ** Use our <a href="OnlineQuote-custinfo.aspx" target="_blank"><strong>Online Quote System</strong></a> to see final estimate.
                    <br /></em>    

    

   
    



				</section>
				            <script type="text/javascript">
				                $(document).ready(function () {
				                    $(".fancybox").fancybox({
				                        openEffect: 'fade',
				                        closeEffect: 'fade',
				                        nextEffect: 'elastic',
				                        prevEffect: 'elastic',
				                        helpers: {
				                            title: {
				                                type: 'float'
				                            }
				                        }
				                    });
				                });
                            </script>    
        
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
                
    <div>
        

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DFWGraniteDBConnectionString %>" ProviderName="<%$ ConnectionStrings:DFWGraniteDBConnectionString.ProviderName %>" SelectCommand="SELECT SlabColorID, SlabColorName, WebsitePrice, ImageFilename, WebsiteFabPrice FROM MarbleSlabColorsQry WHERE (SlabColorName LIKE '%' + ? + '%') ORDER BY SlabColorName">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearch" DefaultValue="%" Name="?" PropertyName="Text" />

            </SelectParameters>
        </asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DFWGraniteDBConnectionString %>" ProviderName="<%$ ConnectionStrings:DFWGraniteDBConnectionString.ProviderName %>" SelectCommand="SELECT SlabColorID, SlabColorName, WebsitePrice, ImageFilename, WebsiteFabPrice FROM MarbleSlabColorsQry WHERE (SlabColorName LIKE '%' + ? + '%') AND (WebsitePrice &lt; 10) ORDER BY WebsitePrice">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearch" DefaultValue="%" Name="?" PropertyName="Text" />

            </SelectParameters>
        </asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DFWGraniteDBConnectionString %>" ProviderName="<%$ ConnectionStrings:DFWGraniteDBConnectionString.ProviderName %>" SelectCommand="SELECT SlabColorID, SlabColorName, WebsitePrice, ImageFilename, WebsiteFabPrice FROM MarbleSlabColorsQry WHERE (SlabColorName LIKE '%' + ? + '%') AND (WebsitePrice &gt; 10 AND WebsitePrice &lt;= 20) ORDER BY WebsitePrice">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearch" DefaultValue="%" Name="?" PropertyName="Text" />

            </SelectParameters>
        </asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DFWGraniteDBConnectionString %>" ProviderName="<%$ ConnectionStrings:DFWGraniteDBConnectionString.ProviderName %>" SelectCommand="SELECT SlabColorID, SlabColorName, WebsitePrice, ImageFilename, WebsiteFabPrice FROM MarbleSlabColorsQry WHERE (SlabColorName LIKE '%' + ? + '%') AND (WebsitePrice &gt; 20 AND WebsitePrice &lt;= 30) ORDER BY WebsitePrice">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearch" DefaultValue="%" Name="?" PropertyName="Text" />

            </SelectParameters>
        </asp:SqlDataSource>



<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DFWGraniteDBConnectionString %>" ProviderName="<%$ ConnectionStrings:DFWGraniteDBConnectionString.ProviderName %>" SelectCommand="SELECT SlabColorID, SlabColorName, WebsitePrice, ImageFilename, WebsiteFabPrice FROM MarbleSlabColorsQry WHERE (SlabColorName LIKE '%' + ? + '%') AND (WebsitePrice &gt;= 30) ORDER BY WebsitePrice">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearch" DefaultValue="%" Name="?" PropertyName="Text" />

            </SelectParameters>
        </asp:SqlDataSource>



                </div>
			

</div>
</form>
</asp:Content>
