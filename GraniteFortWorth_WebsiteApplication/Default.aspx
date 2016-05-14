<%@ Page Title="Wholesale Granite Fort Worth | Granite Countertops Fort Worth | Wholesale Granite Slabs Ft Worth Texas | Granite Southlake " Language="C#" MasterPageFile="~/SiteClassic.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <META NAME="Description" CONTENT="Your super savings place for granite in Fort Worth Texas. Granite Fort Worth has the best granite available at rates that can not be beat.  ">

    <link rel="stylesheet" href="css/css3modal.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/coolthumbcaps.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/jpages.css" type="text/css" media="screen">

    <script>
        /* when document is ready */
        $(function () {
            /* initiate plugin */
            $("div.holder").jPages({
                containerID: "coolthumbcaps",
                perPage: 6
            });
        });
    </script>

<script type="text/javascript">

    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-39035334-1']);
    _gaq.push(['_trackPageview']);

    (function () {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();

</script>

<style>
    #coolthumbcaps .box {
        border: 5px solid #fff;
        -webkit-box-shadow: 1px 1px 1px 1px #400000;
		-moz-box-shadow: 1px 1px 1px 1px #400000;
		box-shadow: 1px 1px 1px 1px #400000;
    }

     .modal .promo-notes {
        display: block;

        /* Position */
        position: absolute;
        right: 40px;
        top: -110px;
        width: 600px;
        padding: 1px 1px 1px 2px;

        /* Style */
        font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
        font-weight:normal;
        text-decoration: none;
        text-shadow: none;
        text-align: center;
        background: rgba(0, 0, 0, 0.60);
        color: #fff;
        border: 3px solid #fff;
        border-radius: 20px;
        box-shadow: 0 1px 3px rgba(0,0,0,0.5);
    }
     .modal .promo-notes span{
         font-size:large;
         font-weight:bold;
     }

     .retroshadow {
        color: #2c2c2c;
        background-color: #d5d5d5;
        letter-spacing: .05em;
        text-shadow: 
          4px 4px 0px #d5d5d5, 
          7px 7px 0px rgba(0, 0, 0, 0.2);
      }
   
</style>

</asp:Content>



<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
<aside id="promo2" class="modal">
  <div>
      <div class="promo-notes">
                              <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSourcePromoLabels">
                        <ItemTemplate>
                            <span class="blink"><%# Eval("SlabPromoLabel") %></span>
                            <p> <%# Eval("SlabPromoDesc") %></p>
                           
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSourcePromoLabels" runat="server" ConnectionString="<%$ ConnectionStrings:DFWGraniteDBConnectionString %>" ProviderName="<%$ ConnectionStrings:DFWGraniteDBConnectionString.ProviderName %>" SelectCommand="SELECT [SlabPromoLabel], [SlabPromoDesc] FROM [tblSETTINGS] WHERE ([ID] = 1)"></asp:SqlDataSource>
</div>
    <ul id="coolthumbcaps">
          <!-- Image Caption 6 -->
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SlabPromoSqlDataSource">
        <ItemTemplate>
            <li class="box">
                <a href='<%# Eval("SlabColorID", "OnlineQuote-custinfo.aspx?SlabColorID={0}") %><%# Eval("ImageFilename","&img={0}") %>'>
                <img class="image-scale" src='<%# Eval("ImageFilename", "images/Slabs/thumb/{0}") %>' />
                <span class="caption scale-caption">
                    <h3><%# Eval("SlabColor") %>&nbsp<span><%# Eval("SlabPromoPrice","{0:c}") %></span></h3>
                    <p><%# Eval("SlabPromoNotes") %></p>
                </span>
                <span class="caption simple-caption">
                    <p><%# Eval("SlabColor") %></p>
                </span>
                </a>
            </li>
        </ItemTemplate>
        </asp:Repeater>
      </ul>

      <div class="holder"></div>
      <a href="#close" title="Close">Close</a>
 </div>   
</aside>
<aside id="angieslist" class="modal">
    <img src="Images/SSA_Logo_500x500.png" />
</aside>
<asp:SqlDataSource ID="SlabPromoSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DFWGraniteDBConnectionString %>" ProviderName="<%$ ConnectionStrings:DFWGraniteDBConnectionString.ProviderName %>" SelectCommand="SELECT SlabPromoID, SlabColorID, SlabColor, SlabPromoPrice, SlabPromoNotes, Inactive, ImageFilename FROM SlabPromoQry WHERE (Inactive = False) AND (Inactive = False)"></asp:SqlDataSource>

<article id="content2">
    <div class="slider_bg">
						<div class="slider">
							<ul class="items">
								<li>
									<img src="images/img1.jpg" alt="Wholesale Granite DFW - Fort Worth is your super savings place for granite in Fort Worth Texas.  Granite Fort Worth has the best granite available at rates that can not be beat.  We have agreements with all pertinent granite vendors and can offer wholesale granite prices to YOU!  Not only that but we were selected to represent The Good Contractors List for Wholesale Granite and Countertops!">
									<div class="banner">
                                        <div style="display:none">
                                            <strong>Your super savings place for granite in Fort Worth Texas. Granite Fort Worth has the best granite available at rates that can not be beat.  </strong>
                                        </div>
										<strong>Super<span>Savings</span></strong>
										<b>Call Us Today! <br /> (817) 300-3298</b>
										<p>
											<span>&nbsp; &nbsp;   &nbsp;  Granite Fort Worth has the best granite available at rates that can not be beat. &nbsp;   &nbsp;</span>
										</p>
									</div>
								</li>
								<li>
									<img src="images/img2.jpg" alt="Granite Fort Worth goes above and beyond to provide you with the best in granite.  We publish all of our rates, so nothing is hidden.  When we say that we can't be beat, you can check our rates and compare to our competition.  When was the last time you saw the rates before you even called the company?  Go check out our Pricing and give us a call to do a FREE estimate!  You can also fill out our granite estimate form and a representative will contact you as quickly as possible.">
									<div class="banner">
										<strong>Above<span>And Beyond</span></strong>
										<b>Call Us (817) 300-3298</b>
										<p>
											<span>&nbsp; &nbsp;   &nbsp;  Granite Fort Worth goes above and beyond to provide you with the best in granite.  We publish all of our rates, so nothing is hidden.  &nbsp;   &nbsp;</span>
										</p>
									</div>
								</li>
								<li>
									<img src="images/img3.jpg" alt="When it comes to credibility, there is nothing better than being a part of an organization that will hold a company accountable for their actions.  The Good Contractors List trusted us enough to choose us to represent them.  They back our products and services with their own $10,000 guarantee of satisfaction, because they trust us to get the job done right! ">
									<div class="banner">
										<strong>Satisfaction<span>Guaranteed</span></strong>
										<b>Call Us (817) 300-3298</b>
										<p>
											<span>&nbsp; &nbsp;   &nbsp; When it comes to credibility, there is nothing better than being a part of an organization that will hold a company accountable for their actions.&nbsp; &nbsp;  </span>
										</p>
									</div>
								</li>
								<li>
									<img src="images/img4.jpg" alt="When it comes to credibility, there is nothing better than being a part of an organization that will hold a company accountable for their actions.  The Good Contractors List trusted us enough to choose us to represent them.  They back our products and services with their own $10,000 guarantee of satisfaction, because they trust us to get the job done right! ">
									<div class="banner">
										<strong>Get<span>Started</span></strong>
										<b>Call Us (817) 300-3298</b>
										<p>
											<span>&nbsp; &nbsp;   &nbsp; We make it very easy to work with us.  Our professionals are <a href="Contact.aspx">here</a> for you to answer any questions or concerns.&nbsp; &nbsp;  </span>
										</p>
									</div>
								</li>
							</ul>
						</div>
					</div>

					<div class="wrap">
						<section class="cols">
							<div class="box">
								<div>
									<h2><span><a href="FAQ.aspx" class="LinkHeader">FAQ</a></span></h2>
									<figure><img src="images/page1_img1.jpg" alt="" ></figure>
									<p class="pad_bot1">At Wholesale Granite DFW, we believe in taking the personal approach. </p>
                                    <p class="pad_bot1">Our Mission is to serve our customers by building and installing the highest quality countertops with the best service at a fair price. </p>
									<a href="FAQ.aspx" class="button1">Read More</a>
								</div>
							</div>
						</section>
						<section class="cols pad_left1">
							<div class="box">
								<div>
									<h2><span><a href="Showrooms.aspx" class="LinkHeader">Visit our Showroom</a></span></h2>
									<figure><img src="images/page1_img2.jpg" alt="" ></figure>
									<p class="pad_bot1">We utilize the most sophisticated equipment with conventional production process to achieve the best quality in the shortest time. </p>
                                    <p class="pad_bot1">We strongly advise that you choose the slabs in person at our showroom.<br /></p>
									<a href="Showrooms.aspx" class="button1">Read More</a>
								</div>
							</div>
						</section>
						<section class="cols pad_left1">
							<div class="box">
								<div>
									<h2><span><a href="KitchenGallery.aspx" class="LinkHeader">Gallery of Kitchens</a></span></h2>
									<figure><img src="images/page1_img3.jpg" alt="" ></figure>
                                    <p class="pad_bot1">We started as a one man shop and grew steadily. We currently install hundreds of countertops per year.</p>
									<p class="pad_bot1">See examples of kitchen countertops and other granite and marble projects. <br /><br /></p>
									<a href="KitchenGallery.aspx" class="button1">Read More</a>
								</div>
							</div>
						</section>
					</div>
</article>
    </form>
</asp:Content>




<asp:Content ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="wrapper">
				<section class="col1 pad_left1">
					<h2>Gorgeous Wholesale Granite!</h2>
					<div class="wrapper">
                        <div>
                            <strong>Wholesale Granite DFW - Fort Worth</strong> is your super savings place for granite in Fort Worth, Texas.  Granite Fort Worth has the best granite available at rates that can not be beat.  We have agreements with all pertinent granite vendors and can offer wholesale granite prices to YOU!  Not only that but we were selected to represent <a href="http://www.thegoodcontractorslist.com/" target="_blank">The Good Contractors List</a> for wholesale granite and countertops!
                            <br /><br />
                        </div>
						<div class="cols">
							<div class="wrapper pad_bot2">
								<figure class="left marg_right1"><img src="images/page1_contactus.png" alt="" /></figure>
								<p>
									<a href="Contact.aspx">CONTACT US</a><br />
									We look forward to serving you and would love to hear from you.
								</p>
							</div>
							<div class="wrapper">
								<figure class="left marg_right1"><img src="images/page1_img5.png" alt="" /></figure>
								<p>
									<a href="Sinks.aspx">SINKS</a><br />
									Find the perfect sink for your needs at a great price.
                                    <br /> <br /> <br />
								</p>
							</div>
						</div>
						<div class="cols pad_left1">
							<div class="wrapper pad_bot2">
								<figure class="left marg_right1"><a href="#promo2" title="We will beat ANY competitors written estimate!"><img src="images/page1_img6.png" alt="BEST PRICE SPECIALS!" /></a></figure>
								<p>
									<a href="#promo2" title="We will beat ANY competitors written estimate!">SALE</a><br />
									Click your granite of choice, create Online Quote! 
								</p>
							</div>
							<div class="wrapper">
								<figure class="left marg_right1"><img src="images/page1_img7.png" alt="" /></figure>
								<p>
									<a href="Contact.aspx#form">FREE ESTIMATE</a> <br />
									Please feel free to fill out our request form for questions, comments, or to request a FREE Estimate.
								</p>
							</div>
						</div>

                                                	<div class="cols">
							<div class="wrapper pad_bot2">
								<figure class="left marg_right1"><img src="images/page1_tapemeasure.png"" alt="" /></figure>
								<p>
									<a href="onlinequote">FREE ONLINE QUOTE</a><br />
									<span style="font-size: small">Calculate the estimated price of the right countertop for your taste and budget.
								</span>
								</p>
							</div>
                           
						</div>
						<div class="cols pad_left1">
							<div class="wrapper">
								<figure class="left marg_right1"><img src="images/page1_img_alpha.png" alt="" /></figure>
								<p>
									<a href=""></a> <br />
									 
								</p>
							</div>
							
						</div>
					</div>
				</section>
				
                <section class="col2 pad_left1">
					<h2>Testimonials</h2>
					<ul class="testimonials">
						<li>
							<span>1</span>
							<p>
								“We were amazed at how beautiful our countertops turned out!  You completely changed the look of our kitchen.” <br />
								<img src="images/testimo_johncindy.png" alt="">
							</p>
						</li>
						<li>
							<span>2</span>
							<p>
								“Great job!  We were impressed with how quickly you were able to complete our granite countertops from start to finish.” <br />
								<img src="images/testimo_tonyd.png" alt="">
							</p>
						</li>
						<li>
							<span>3</span>
							<p>
								“...completed everything ahead of schedule. Thanks!” <br />
                                <img src="images/testimo_chelsear.png" alt="">
							</p>
						</li>
					</ul>
                     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                    <a href="Testimonials.aspx" class="activator" id="activator">Read More</a>

                            

				</section>


			</div>



</asp:Content>


<asp:Content ContentPlaceHolderID="ScriptsContentPlaceHolder" runat="server">
    <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="js/tms-0.3.js"></script>
    <script type="text/javascript" src="js/tms_presets.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
    <script type="text/javascript" src="js/jPages.js"></script>

     <script type="text/javascript">
            window.onload = function () {
                setTimeout(function () { document.getElementById('promo2').click(); }, 3000)
            }
    </script>
</asp:Content>