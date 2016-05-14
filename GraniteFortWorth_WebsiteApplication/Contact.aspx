<%@ Page Title="CONTACT US" Language="C#" MasterPageFile="~/SiteClassic.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<META NAME="Description" CONTENT="10011 Harmon Road Suite 101 Fort Worth Texas 76177 Telephone:(817) 300-3298 ">
<script src="Script/jquery.validate.js" type="text/javascript"></script>
<script src="Script/jquery.blockUI.js" type="text/javascript"></script>

<script type="text/javascript">
    $.validator.setDefaults({
        submitHandler: function () {            

            //$("#contactForm").submit();
            //<input name="submit" type="submit" value="Submit" />
            //<a href="#" class="button1" onclick="document.getElementById('contactForm').submit()">Submit</a>
        }
    });

    $().ready(function () {
        // validate the comment form when it is submitted
        $("#contactForm").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                }
            }
        });

        $("#fancybox-manual-b").click(function () {
            $.fancybox.open({
                href: 'ContactThanks.html',
                type: 'iframe',
                padding: 5
            });
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

            <!-- fancyBox -->
        <link rel="stylesheet" href="/FancyBox/css/jquery.fancybox.css?v=2.0.5" type="text/css" media="screen" />
        <script type="text/javascript" src="/FancyBox/js/jquery.fancybox.pack.js?v=2.0.5"></script>

    <style>
        .line1 {background:url(/images/line_vert1.gif) 310px 0 repeat-y}
        .line2 {background:url(/images/line_vert1.gif) 930px 0 repeat-y}
        #contactForm .input {width:200px;height:18px;background:#faf3ed;padding:1px 5px;color:#220000;font:14px Georgia, "Times New Roman", Times, serif;margin:0;float:left}
        #contactForm textarea {overflow:auto;width:100%;height:163px;background:#faf3ed;padding:1px 5px;color:#220000;font:14px Georgia, "Times New Roman", Times, serif;margin:0}
        #name, #street, #city, #phone, #email {
            width: 40%;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                <div class="wrap">
					<div class="box">
						<div>
							<h2 class="letter_spacing"><span>Contact Form</span><a name="form"></a></h2>
                            Please feel free to fill out our request form for questions, comments, or to request a FREE Estimate.<br />
							<form id="contactForm" action="contact.ashx">
								<div>
									<div class="wrapper">
										<span>Name:</span>
                                         <input id="name" name="name" class="txtField required"/>
									</div>

									<div class="wrapper">
										<span>Street:</span>
										<input id="street" name="street" class="txtField  required" />							
									</div>

									<div class="wrapper">
										<span>City:</span>
										<input id="city" name="city" class="txtField  required" />							
									</div>

									<div class="wrapper">
										<span>Phone:</span>
										<input id="phone" name="phone" class="txtField" />						
									</div>

									<div class="wrapper">
										<span>E-mail:</span>
										<input id="email" name="email" class="txtField  required" />							
									</div>

									<div class="textarea_box">
										Explain Your Needs in Detail:<br />
										<textarea name="message" cols="1" rows="1" class="txtField required" id="Textarea1"></textarea>							
									</div>
                                    <input name="http_user_agent" id="http_user_agent" type="hidden" value="dfw.desktop" />
                                    <a id="fancybox-manual-b" href="javascript:;" class="button1" onclick="document.getElementById('contactForm').submit()">Submit</a>

                                    </div>
							</form>
						</div>
					</div>
				</div>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
            <div class="wrapper">
				<section class="pad_left1">
					<div class="wrapper">
						<div class="cols">
							<h2>Our Contacts<a name="detail"></a></h2>
						</div>
						<div class="col3 pad_left1">
							<h2><a href="http://www.daltile.com/products/stone">Dal-Tile Stone Showrooms</a></h2>
						</div>
					</div>
					<div class="line1">
						<div class="wrapper line2">
							<div class="cols">
								<div class="wrapper pad_bot1">
									<p>We look forward to serving you and would love to hear from you.  Please feel free to give us a call or fill out our <a href="Contact.aspx">request form</a> with any questions, comments, or requests for a free estimate.</p>
									<p class="address">
										<em>Office Location:</em><br />
                                        <strong>DFW Wholesale Granite</strong><br />
                                        10011 Harmon Road <br />
                                        Suite 101<br />
                                        Fort Worth Texas  76177<br /><br />
										<span><em>Telephone:</em></span><strong>(817) 300-3298</strong><br />
										<span><em>E-mail:</em></span><a href="mailto:dhitt0327@gmail.com">info@granitesouthlake.com</a>
                                        <span><em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </em></span><a href="mailto:info@granitefortworth.net">info@granitefortworth.net</a>                                        
									</p>
								</div>
							</div>
							<div class="col3 pad_left1">
								<p>
									<strong>Dal-Tile Natural Stone Center - Fort Worth </strong>
                                    <br />
                                    6323 West Airport Freeway
                                    <br />
                                    Haltom City TX 76117 <br />
                                    682-647-1100
								    <br />
                                    <strong><em>Hours of Operation: </em> </strong>Mon-Fri 9am-4:30pm, Sat 10am-2pm
								</p>
                                <p>
									<strong>Dal-Tile Natural Stone Center - Dallas </strong>
                                    <br />
                                    2250 LBJ Freeway Suite 300
                                    <br />
                                    Dallas TX 75234&nbsp; <br />
                                    972-620-8427
								<strong><em>
                                    <br />
                                    Hours of Operation:</em> </strong>Mon-Fri 8am-4:30pm, Sat 10am-2pm
								</p>
                                <h2><a href="http://imcstone.com/" target="_blank">IMC Stone Showrooms</a></h2>
                                <p>
                                    <strong>IMC Stone - Fort Worth&nbsp;
                                    <br />
                                    </strong>2100 Handley Ederville Road <br />
                                    Fort Worth TX 76118
                                    <br />
								<strong><em>
                                    Hours of Operation:</em> </strong>Mon-Fri 8am-5pm, Sat 9am-1pm</p>
                                <p>
                                    <strong>IMC Stone - Dallas
                                    <br />
                                    </strong>11180 Zodiac Lane
                                    <br />
                                    Dallas TX 75229
                                    <br />
								<strong><em>
                                    Hours of Operation:</em> </strong>Mon-Fri 8am-5pm, Sat 9am-1pm</p>
                                
                                    <h3><a href="http://www.levantina.com/us/" target="_blank">Levantina Stone Showroom</a>
                                    </h3><p>11180 Zodiac Lane
                                    <br />
                                    Dallas TX 75229
                                    <br />
								<strong><em>
                                    Hours of Operation:</em> </strong>Mon-Fri 8am-5pm, Sat 9am-1pm</p>




                                <br />**********************************************
								<em><h3>For the best price and quality on tile and other flooring and backspalsh products!</h3></em>
                                <h2>Floor and Decor Outlet</h2>
                                <p>
                                2540 East Pioneer Parkway
                                <br />
                                Arlington Texas 76010
                                <br />
                                817-274-2030
                                <br />
                                Mon-Fri 7am-9pm, Sat 8am-9pm, Sun 11am-6pm
                                </p>
                                <p>
                                    Fort Worth - 6801 NE 820 Loop 820
                                    <br />
                                    North Richland Hills Tx 76180

                                </p>
                                <p>
                                    Dallas - 2350 Alberta Drive
                                    <br />
                                    Dallas TX 75229</p>
                                <p><strong><em>Web: </em></strong><a href="http://www.flooranddecor.com" target="_blank">www.flooranddecor.com</a></p>

                                <p>
                                We have been sending all of our customers to Floor And Decor Outlet for the last seven years. They have consistantly provided the best service, price and quality of any tile outlet in the metroplex.
                                </p>
							</div>
						</div>
					</div>
				</section>
			</div>

</asp:Content>