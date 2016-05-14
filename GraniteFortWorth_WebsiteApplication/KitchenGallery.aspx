<%@ Page Title="Gallery of Kitchens" Language="C#" MasterPageFile="~/SiteClassic.Master" AutoEventWireup="true" CodeBehind="KitchenGallery.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.KitchenGallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    	<script type="text/javascript" src="juicebox/jbcore/juicebox.js"></script>
    	<style type="text/css" media="screen">
			#juicebox-container {height: 600px;}
		</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div class="wrapper">
				<section class="col1 pad_left1">
					<h2>Gallery of Kitchens</h2>
					<div class="wrapper">

    <p>Examples of kitchen countertops and other granite and marble projects.</p>
		<!--START Juicebox EMBED.-->
	    <script type="text/javascript">
	        new juicebox({
	            backgroundColor: 'rgba(0,0,0,.9)',
	            xbackgroundColor: 'fff',
	            containerid: 'juicebox-container',
	            galleryHeight: '600',
	            galleryWidth: '620',
	            themeUrl: 'juicebox/jbcore/classic/theme.css',
	            baseURL: 'juicebox/'
	        });
	    </script>
		<div id="juicebox-container"></div>
		<!-- END Juicebox EMBED -->
                       

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


</asp:Content>
