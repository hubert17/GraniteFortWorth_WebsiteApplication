<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreeEstimate.aspx.cs" Inherits="GraniteFortWorth_NewWebsite.FreeEstimate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>FREE ESTIMATE - DFW Wholesale Granite Fort Worth</title>
    <META NAME="Description" CONTENT="Your super savings place for granite in Fort Worth Texas. Granite Fort Worth has the best granite available at rates that can not be beat.  ">
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
    <script type="text/javascript" src="js/jquery-1.6.js" ></script>
    <script type="text/javascript" src="js/cufon-yui.js"></script>
    <script type="text/javascript" src="js/cufon-replace.js"></script>  
    <script type="text/javascript" src="js/Forum_400.font.js"></script>
    <script type="text/javascript" src="js/atooltip.jquery.js"></script> 
 
    <!--[if lt IE 9]>
	    <script type="text/javascript" src="js/html5.js"></script>
	    <style type="text/css">
		    .slider_bg {behavior:url(js/PIE.htc)}
	    </style>
    <![endif]-->
    <!--[if lt IE 7]>
	    <div style='clear:both;text-align:center;position:relative'>
		    <a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" alt="" /></a>
	    </div>
    <![endif]-->

    <style>
        html, body { /* Allow the #wrapper div to stretch 100% in both directions */
            height: 100%;
            width: 100%;
            margin: 0;
            overflow:hidden;
          }
        #wrapper { /* necessary because it for some reason doesn't work with the iframe */
            position: absolute;
            top: 110px;
            bottom: 0;
            left: 0;
            right: 0;
        }
        #frame {
            width: 100%;
            height: 100%;
            border:0;
        }
    </style>

</head>

<body id="page4">
    <form id="form1" runat="server">
    <div class="body6">
	<div class="body1">
    <div class="main">
    <!-- header -->
			    <header>
				    <h1><a href="default.aspx" id="logo">DFW Granite Logo</a></h1>
				    <nav>
					    <ul id="top_nav">
						    <li><a href="Default.aspx"><img src="images/icon_1.gif" alt=""></a></li>
						    <li><a href="#"><img src="images/icon_2.gif" alt=""></a></li>
						    <li class="end"><a href="mailto:dhitt0327@yahoo.com"><img src="images/icon_3.gif" alt=""></a></li>
					    </ul>
				    </nav>
				    <nav>
					    <ul id="menu">
						    <li><a href="Default.aspx">Home</a></li>
						    <li><a href="#">Granite Colors</a></li>
						    <li><a href="#">Marble Colors</a></li>
						    <li><a href="GraniteEdges.aspx">Edges</a></li>
						    <li><a href="FreeEstimate.aspx">Free Estimate</a></li>
					    </ul>
				    </nav>
			    </header>
    <!-- / header -->
      <div id="wrapper">
          <div style="height: 20px">&nbsp;&nbsp;&nbsp;</div>
            <iframe id="frame" src="FreeEstimate.html" />
        </div>


	</div>
   </div>
    </div>
    <!-- content -->

 

 



  
    <script type="text/javascript"> Cufon.now(); </script>


    </form>
</body>
</html>
