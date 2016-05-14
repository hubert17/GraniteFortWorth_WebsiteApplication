<%@ Page Title="Granite Care" Language="C#" MasterPageFile="~/SiteClassic.Master" AutoEventWireup="true" CodeBehind="GraniteCare.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.GraniteCare" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <!-- fancyBox -->
        <link rel="stylesheet" href="/FancyBox/css/jquery.fancybox.css?v=2.0.5" type="text/css" media="screen" />
        <script type="text/javascript" src="/FancyBox/js/jquery.fancybox.pack.js?v=2.0.5"></script>
    	<!-- Fancybox Media helper (this is optional) -->
        <script type="text/javascript" src="/FancyBox/js/jquery.fancybox-media.js?v=2.0.5"></script>

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

    		    /*
                 *  Media helper. Group items, disable animations, hide arrows, enable media and button helpers.
                */
    			$('.fancybox-media')
                    .attr('rel', 'media-gallery')
                    .fancybox({
                        openEffect: 'none',
                        closeEffect: 'none',
                        prevEffect: 'none',
                        nextEffect: 'none',

                        arrows: false,
                        helpers: {
                            media: {},
                            buttons: {}
                        }
                    });

    		});
        </script>    




    <style>
        .faqwrapper ul, ol{list-style-type:square;padding-left:30px;font-size:large;}
        .faqwrapper p {padding-bottom:10px;}


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div class="wrapper">
				<section class="col1 pad_left1">
					<h2>How To Care for Your Granite</h2>
					<div class="wrapper">
                        <div class="faqwrapper">
                            <p>A regular maintenance regimen will help your natural stone become more resistant to scratching and wear.</p>
                            <p>Natural stone, especially polished stone, is sensitive to harsh chemicals. Do not use vinegar or any cleaners containing acids or strong alkaline agents.</p>
                            <p><em>We recommend using products that are designed for stone maintenance:</em></p>
                            <ul>
                                <li>Stone Sealer once a year.</li>
                                <li>Stone Cleaner once a month.</li>
                                <li>Stone  Polish once a week.</li>
                            </ul>
                            <br />
                            <p>If you spill acidic juices or alcohol on the stone, you should blot dry immediately.  Acid-based foods, such as citrus or tomatoes, can etch into the polish of more delicate stones, like marble and onyx.</p>
                            <p>Do not use granite as a cutting block. Granite will dull your knives.</p>
                            <p>Do not place hot items, such as pots and pans, on any stone. As a safety precaution, use coasters on countertops.</p>
                            <p>A quality impregnating sealer penetrates stone, allows the stone to breathe and permits more of the stone's natural beauty to shine through.</p>
                            <p>Unsealed stone is more susceptible to absorbing moisture, dirt and cleaning chemicals. We apply a high quality penetrating sealer at the time of installation.</p>
                            <p>Please watch this granite care <a class="fancybox-media" href="http://www.youtube.com/watch?v=SroiV-sJwM4#!">Youtube video</a>.</p>
                            <br /><br />

                        </div>
						

                        

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
