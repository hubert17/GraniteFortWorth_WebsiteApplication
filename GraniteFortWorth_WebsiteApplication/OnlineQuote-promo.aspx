<%@ Page Title="Slab Promo" Language="C#" MasterPageFile="~/SiteClassic.Master" AutoEventWireup="true" CodeBehind="OnlineQuote-promo.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.OnlineQuote_promo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <META NAME="Description" CONTENT="Please click on an image below for a larger view. Santa Cecelia G287, New Venetian Gold G215, SF Installed Granite Fort Worth Southlake Texas">
        <!-- Add mousewheel plugin (this is optional) -->
	    <script type="text/javascript" src="/Scripts/jquery.mousewheel-3.0.6.pack.js"></script>

        <link rel="stylesheet" href="css/coolthumbcaps.css" type="text/css" media="screen" />


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

    <!-- border-bottom: #e2dbc7 5px solid; -->
  <style>
      #content2 {padding-bottom:0px;}

      .searchtextbox {width:200px;height:26px;padding:1px 5px;color:#220000;font:14px Georgia, "Times New Roman", Times, serif;margin:0;}
      .searchlabel {vertical-align: middle}

        /*Creates blingking text*/
        .blink {
          animation: blink .5s steps(5, start) infinite;
          -webkit-animation: blink .5s steps(5, start) infinite;
        }
        @keyframes blink {
          to {
            visibility: hidden;
          }
        }
        @-webkit-keyframes blink {
          to {
            visibility: hidden;
          }
        }
 
      </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
<form id="form1" runat="server">
    <div class="wrapper">
				<section class="col1 pad_left1">
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSourcePromoLabels">
                        <ItemTemplate>
                            <h2><%# Eval("SlabPromoLabel") %></h2>
                            <h3><%# Eval("SlabPromoDesc") %></h3>
                            <p class="blink" style="font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;font-style:italic;font-size:large;margin-top:20px;">Mouseover the photo to see price. Left click for Online Quote.</p>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSourcePromoLabels" runat="server" ConnectionString="<%$ ConnectionStrings:DFWGraniteDBConnectionString %>" ProviderName="<%$ ConnectionStrings:DFWGraniteDBConnectionString.ProviderName %>" SelectCommand="SELECT [SlabPromoLabel], [SlabPromoDesc] FROM [tblSETTINGS] WHERE ([ID] = 1)"></asp:SqlDataSource>




    
  <div>
    <ul id="coolthumbcaps">
          <!-- Image Caption 6 -->
        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SlabPromoSqlDataSource">
        <ItemTemplate>
            <ul id="coolthumbcaps">
            <li class="box">
                <a href='<%# Eval("SlabColorID", "OnlineQuote-custinfo.aspx?SlabColorID={0}") %><%# Eval("ImageFilename","&img={0}") %>'>
                <img class="image-scale" src='<%# Eval("ImageFilename", "images/Slabs/thumb/{0}") %>' />
                <span class="caption scale-caption">
                    <h3><%# Eval("SlabColor") %>&nbsp<span><%# Eval("SlabPromoPrice","{0:c}") %></span></h3>
                    <p class="blink"><%# Eval("SlabPromoNotes") %></p>
                </span>
                <span class="caption simple-caption">
                    <p><%# Eval("SlabColor") %></p>
                </span>
                </a>
            </li>
            </ul>
        </ItemTemplate>
        </asp:Repeater>
      </ul>
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
                
    <div>
        

<asp:SqlDataSource ID="SlabPromoSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DFWGraniteDBConnectionString %>" ProviderName="<%$ ConnectionStrings:DFWGraniteDBConnectionString.ProviderName %>" SelectCommand="SELECT SlabPromoID, SlabColorID, SlabColor, SlabPromoPrice, SlabPromoNotes, Inactive, ImageFilename FROM SlabPromoQry WHERE (Inactive = False) AND (Inactive = False)"></asp:SqlDataSource>


                </div>
			

</div>
</form>
</asp:Content>

