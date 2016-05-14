$(document).ready(function() {
	
	bodyId = $("body").attr("id");
	
	switch(bodyId) {
		
	case "index":
	//begin index scripts


	   $(".select-store").hover(function() {
			$(".next-pop-bgd").show();
		}, 
		  function() {
			$(".next-pop-bgd").hide();
		});

	break; // end index scripts
	
	case "calculator":
	    //begin calculator scripts
	
		$('form').get(0).reset(); 
		$("a.calc").click(function(){var type=$(this).attr("type");$(".calculator").hide();$("#"+type+"").show();});
		$("a.close-calc").click(function(){$(".calculator").hide();testInputs();});

		$("a.show-guide").click(function(){$(".calculator").hide();$(".guide").show();});
		$("a.close-guide").click(function(){$(".guide").hide();testInputs();});

		$(".calc-row input.length").keyup(function() {
			var depthInput = $(this).next("input.depth");
			var length = parseFloat($(this).val());
			var depth = parseFloat(depthInput.val());
			if (isNaN(depth)){depth=0;}
			if (isNaN(length)){length=0;}
			total = (length*depth);
			total = roundIt(total);
			total = fixIt(total);
			depthInput.next("input.area").val(total);
			var parent = $(this).parent().parent().attr("id");
			calculate(parent);
		});

		$(".calc-row input.depth").keyup(function() {
			var lengthInput = $(this).prev("input.length");
			var depth = parseFloat($(this).val());
			var length = parseFloat(lengthInput.val());
			if (isNaN(depth)){depth=0;}
			if (isNaN(length)){length=0;}
			total = (length*depth);
			total = roundIt(total);
		    total = fixIt(total);
			$(this).next("input.area").val(total);
			var parent = $(this).parent().parent().attr("id");
			calculate(parent);
		});

		$(".calc-row input.area").keyup(function() {
			var parent = $(this).parent().parent().attr("id");
			calculate(parent);
		});

		$(".short-input input").focus(function() {
		  $(this).css("color","#707070");
		  $(this).css("text-align","right");
		  if ($(this).val() == "Square Feet" || $(this).val() == "Linear Feet") $(this).val("");
		  if ($(this).val()=="0") $(this).val("");
		  testInputs();
		});

		$(".calculator input, .short-input input").focus(function() {
		  if ($(this).val() == 0 ) $(this).val("");
		});

		$(".calculator input, .short-input input").blur(function() {
		  	value = parseFloat($(this).val());
			if (isNaN(value)) value=0;
			value = roundIt(value);
		    value = fixIt(value);
			$(this).val(value);
		});


		$(".short-input input").keyup(function() {
			value = parseFloat($(this).val());
			if (isNaN(value)) value=0;
			value = value*1;
			changeVal = $(this).attr("id").replace("-measure","");
			$("#"+changeVal+" .total2").val(value);
		});


		$(".short-input input").change(function() {
			testInputs();
		});

		$(".short-input input").blur(function() {
			testInputs();
		});


	break; // end calculator scripts
		
	case "surface":
	//begin surface scripts
		$("a.surface").click(function(){
			var surface = $(this).attr("id");
			$("#surface-type").val(surface);
			$("a.surface").removeClass('selected');
			$(this).addClass('selected');
			showNext();
		});
		
		$("a.light-cont-close").click(function(){
			$(this).parent().fadeOut();
			hideLight();
		});
		
		$("a.info").click(function(){
			var surfaceName = $(this).attr("id").replace("-info","");
			showLight();
			$("#"+surfaceName+"-light").fadeIn();
		});
		
		$('a.info').hover(
	    function() {
			var surfaceName = $(this).attr("id").replace("-info","");
		     $("#"+surfaceName+" h4").addClass("green");
	    },
	    function() {
			var surfaceName = $(this).attr("id").replace("-info","");
		     $("#"+surfaceName+" h4").removeClass("green");
	  	});

	break; // end surface scripts
	
	case "choice":
		
		if ($("body").hasClass("color-page")) loadColors();
	    if ($("body").hasClass("edges-page") && ($(".choice-row").length > 1)) checkArrows($(".colors-row-active").attr("row"));
		if ($("body").hasClass("edges-page")) edgesCount();
		loadHandlers();		
		
		$(".sort-price").click(function(){

			if ($(this).attr("id") == "high") {
				colorsObj.sort(compareHigh);
			}
			else {
				colorsObj.sort(compareLow);
			}
			$(".colors").html("");
			loadColors();
			$(".sort-price").removeClass('sort-price-selected');
			$(".sort-name").removeClass('sort-name-selected');
			$(this).addClass('sort-price-selected');
		});
		
		$(".sort-name").click(function(){

			if ($(this).attr("id") == "alpha") {
				colorsObj.sort(compareAlpha);
			}
			else {
				colorsObj.sort(compareOmega);
			}
			$(".colors").html("");
			loadColors();
			$(".sort-name").removeClass('sort-name-selected');
			$(".sort-price").removeClass('sort-price-selected');
			$(this).addClass('sort-name-selected');
		});
		
		$(".filter-price").click(function(){
			if ($(this).attr("selected")=="yes") {
				$(this).attr("selected","no");
				$(this).removeClass("selected-filter");
				$(".colors").html("");
				loadColors();
				if ($('.filter-price[selected="yes"]').length == 0) $("#show-all").addClass("selected-filter");
			}
			else {
				$(".filter-price").attr("selected","no");
				$(".filter-price").removeClass("selected-filter");
				$(this).attr("selected","yes");
				$(".colors").html("");
				loadColors();
				$(this).addClass("selected-filter");
				$("#show-all").removeClass("selected-filter");
			}
		});
		
		$("#show-all").click(function(){
			if ($(this).hasClass("selected-filter")) {
				return false
			}
			else {
				$(".filter-price").attr("selected","no");
				$(".filter-price").removeClass("selected-filter");
				$(".colors").html("");
				loadColors();
				$(this).addClass("selected-filter");
			}
		});
	

		
		$("a.right-arrow").click(function(){
		    if ($(this).hasClass("right-arrow-on")) {
				$(".colors-row-active").addClass("hide")
				$(".colors-row-active").next('.choice-row').addClass("colors-row-active");
				$(".hide").removeClass('colors-row-active hide');
				$(".mag-pop").hide();
				var row = $(".colors-row-active").attr("row");
				checkArrows(row);
				if ($("body").hasClass("edges-page")) edgesCount();
			}
			else return false;
		});
		
		$("a.left-arrow").click(function(){
			if ($(this).hasClass("left-arrow-on")) {
				$(".colors-row-active").addClass("hide")
				$(".colors-row-active").prev('.choice-row').addClass("colors-row-active");
				$(".hide").removeClass('colors-row-active hide');
				$(".mag-pop").hide();
				var row = $(".colors-row-active").attr("row");
				checkArrows(row); 
				if ($("body").hasClass("edges-page")) edgesCount();
			}
			else return false;
		});
		
		$(".show-difference").click(function(){
			if ($('.difference').is(":visible")) $('.difference').hide();
			else $('.difference').show();
		    
		});
		
		$(".difference").click(function(){
			$(".difference").hide()
		});
		

        if ($(".edges-page .selected").length) {
			$(".edges .choice-row").removeClass("colors-row-active");
		
			var edgesSelected = $(".edges .selected").parent().parent()
			edgesSelected.addClass("colors-row-active");
			if (edgesSelected.parent().attr("multiple")=="yes") {
				var row = edgesSelected.attr("row");
				checkArrows(row);
			}
	    }
		
		if ($(".color-page .selected").length) {
				$(".choice-row").removeClass("colors-row-active");
				var selected = $(".selected").parent().parent();
				selected.addClass("colors-row-active");
				if (selected.parent().attr("multiple")=="yes") {
					var row = selected.attr("row");
					checkArrows(row);
				}
		
	    }
	
	break; // end color scripts
	
	case "sink":
	//begin sink scripts


	checkProvideSink();
	checkAddSink();
    checkSink();
	
	$(".mag").click(function(){
		$(".mag-pop img").attr("src","");
		var pos = $(this).position();
		var src = $(this).attr("large-image");
		var txt = $(this).next().find("h4").text();
		var series = $(this).next().attr("series");
		var pTop = pos.top - 340;
		var pLeft = pos.left + 55;
		if (src != "") $(".mag-pop img").attr("src",src);
		else $(".mag-pop img").attr("src","/images/large-blank.gif")
		$(".mag-pop").css("margin-top",pTop);
		$(".mag-pop").css("margin-left",pLeft);
		$(".mag-pop h5").text(txt);
		$(".mag-pop").show();
	});
	
	$(".mag-pop-close, .mag-pop").click(function(){
		$(".mag-pop").hide();
	});
 
	$("a.right-arrow").click(function(){
		if ($(this).hasClass("right-arrow-on")) {
			$(".active-sink-group").addClass("hide");
			$(".active-sink-group").next('.add-sink-group').addClass("active-sink-group");
			$(".hide").removeClass('active-sink-group hide');
			$("#num").html($(".active-sink-group").attr("num"));
			var row = $(".active-sink-group").attr("row");
			checkArrows(row);
		}
		else return false;
	});
	
	$("a.left-arrow").click(function(){
		if ($(this).hasClass("left-arrow-on")) {
			$(".active-sink-group").addClass("hide");
			$(".active-sink-group").prev('.add-sink-group').addClass("active-sink-group");
			$(".hide").removeClass('active-sink-group hide');
			$("#num").html($(".active-sink-group").attr("num"));
			var row = $(".active-sink-group").attr("row");
			checkArrows(row);
		}
		else return false;
	});
	
	$(".add-sink-wide a.done").click(function(){
	    if ($(this).attr("disabled")!="disabled") {
			$(".add-sink .add-choice").html("");
			$(".add-sink-wide input").each(function() {
		  		var val = parseFloat($(this).val())
				if (val>0) {
					var id = $(this).attr("id")+"-choice";
					var par = $(this).parent().parent().parent();
					var short = par.find(".short-title").html();
					var app = "<p>"+short+"  – <span class='orange'>"+val+"</span></p>";
					$(".add-sink .add-choice").append(app);
				}
		    });
			$(".add-sink-wide").hide(); 
			$(".provide-sink-wide").hide();
			checkAddSink();
			checkSink();
			showBack();
			hideDone();
		}
		else return false;
	});
	
	$(".provide-sink-wide a.done").click(function(){
		if ($(this).attr("disabled")!="disabled") {
			$("#top-mount-choice").html($("#topmount_count").val());
			$("#undermount-choice").html($("#undermount_count").val());
		    $("#cast-iron-choice").html($("#castiron_count").val());
			$(".add-sink-wide").hide(); 
			$(".provide-sink-wide").hide();
			checkProvideSink();
			checkSink();
			showBack();
			hideDone();
		}
		else return false;
	});
	
	$(".add-sink-wide a.cancel").click(function(){
		$(".add-sink-wide").hide(); 
		$(".provide-sink-wide").hide();
		checkSink();showBack();hideDone();
	});
	
	$(".add-sink-wide input").focus(function(){
		if ($(this).val()=="0") $(this).val("");
		showDone();
 	});
	
	$(".provide-sink-wide select").change(function(){
		showDone();
	});
	
	
	$(".add-sink").click(function(){
		$(".add-sink-wide").show();
	 	$(".provide-sink-wide").hide();
	   hideNext();hideBack();
	});	
	
	$(".provide-sink-wide a.cancel").click(function(){
		$(".provide-sink-wide").hide();		
		$(".add-sink-wide").hide();
	    checkSink();showBack();hideDone();
	});
	
	$(".provide-sink").click(function(){
		$(".provide-sink-wide").show();
		$(".add-sink-wide").hide();
	    hideNext();hideBack();
	});
	
	$(".no-sink").click(function(){
		$(".no-sink").addClass("sink-cont-edit");
		checkSink();
	});
	
	$("a.info-sm").click(function(){
		var sinkName = $(this).attr("id").replace("-shadow","");
		$("#"+sinkName+"-light").fadeIn();
		showLight();
	});
	
	$('a.info-sm').hover(
    function() {
	     $(this).prev("span").addClass("green");
    },
    function() {
		$(this).prev("span").removeClass("green");
  	});
	
	$("a.light-cont-close").click(function(){
		$(this).parent().fadeOut();
		hideLight();
	});
	
	$(".more-link").toggle(function() {
	  moreLink();
	}, function() {
	  lessLink();
	});
	
	
	$("#undermount_count").change(function(){
		if ($(this).val() != "0") {
			var underValue = parseInt($(this).val());
			var castVal = $('#castiron_count').val();
			var castPrice = parseFloat($('#castiron_count').attr("cast"));
			$('#castiron_count').find('option').remove();
			$('#castiron_count').append('<option value="0">Select</option>');
			for(i=1;i<=underValue;i++)
			   {
				 var tempPrice = (i*castPrice);
			     $('#castiron_count').append('<option value='+i+'>'+i+' - Add $'+(Math.round(tempPrice*100)/100).toFixed(2)+'</option>');
			   }
		  
			$("#castiron_count option[value='"+castVal+"']").attr('selected', 'selected');
			$(".cast-cont").show();
		}
		else $(".cast-cont").hide();
	});
	
	break; // end sink scripts

	case "corners":
	//begin corner scripts

		$(".corner-input").blur(function() {
			var totalRadius = 0;
			var totalCost = 0;
			$("tr.radius").each(function() {
		      radius = parseInt($(this).find(".corner-input").val());
				if (isNaN(radius)) {
					radius=0;
					$(this).find(".corner-input").val("0");
				}
			   $(this).find(".corner-input").val(radius);
			  cost = parseFloat($(this).find(".cost").html());
			  if (isNaN(cost)) cost=0;
			  
			
			  totalRadius = totalRadius + radius;	
			  totalCost = totalCost + (cost*radius);
			  totalCost = roundIt100(totalCost);
		    });
		  	$(".corner-total").html(totalRadius);
			$(".corner-price-total").html("$"+totalCost);
		});
		
		$(".corner-input").focus(function() {
			if ($(this).val()=="0") $(this).val("");
		});	
		
		$("tr.radius").hover(function() {
			radiusSrc = $(this).attr("src");
			$("img.radius-image").attr("src",radiusSrc);
			$(this).addClass("orange");}
				, 
				  function() {
					$(this).removeClass("orange");
			});

	break; // end corner scripts	
	
	case "additional":
	//begin additional scripts
		
		$("input").focus(function() {
			if ($(this).val()=="0") $(this).val("");
		});	
		
		$("input").blur(function() {
			curval = $(this).val();
			$(this).val(Math.ceil(curval));
		});
	break; // end additional scripts
	
	case "estimate":
	//begin estimate scripts


		$(".compare-close").click(function(){
			$(".compare-estimate").fadeOut();
			hideLight();
		});

        function showCompareEstimates()
        {

            showLight();
            $(".compare-estimate").fadeIn();
        }
		$(".compare").click(function(){
                        //if($(this).attr('href') == "#compare")
                        //{
                            showCompareEstimates();
                        //}
		});
                if(window.location.hash.indexOf("compare") > -1)
                {
                    showCompareEstimates();
                }
		
		$(".info-sink").click(function(){
			$(".more-sink").slideToggle();
			$(this).parent().toggleClass("sink-on")
		});
		
		$('a.info-sink').hover(
	    function() {
		     $(this).parent().addClass("green");
	    },
	    function() {
			$(this).parent().removeClass("green");
	  	});

	break; // end estimate scripts

	case "designer":
	//begin estimate scripts


		$("textarea").click(function(){
			if ($(this).val() == "Best time to contact me, contact by phone or email, special instructions") $(this).val("");
		});



	break; // end estimate scripts
	
	} //switch
	
	(function($) {
	  var cache = [];
	  $.preLoadImages = function() {
	    var args_len = arguments.length;
	    for (var i = args_len; i--;) {
	      var cacheImage = document.createElement('img');
	      cacheImage.src = arguments[i];
	      cache.push(cacheImage);
	    }
	  }
	})(jQuery)
	
	$('.buttons input[type="image"]').each(function(){
		var nextSrc = $(this).attr("src").replace(".png","-hover.png"); 
		jQuery.preLoadImages(nextSrc);
    });
	
	$(".next").click(function() {
		if ($(this).css("opacity")!="1") {
			return false;
			$(".next-pop").show();
		}
	});
	
	$(".next").hover(function() {
		if ($(this).css("opacity")!="1") {
			$(".next-pop-bgd").show();
		}
		}
		, 
		  function() {
			$(".next-pop-bgd").hide();
	});

	$('.buttons input[type="image"]').hover(function() {
			var nextSrc = $(this).attr("src").replace(".png","-hover.png"); 
			$(this).attr("src",nextSrc);
		}
		, 
		  function() {
			var nextSrc = $(this).attr("src").replace("-hover.png",".png"); 
			$(this).attr("src",nextSrc);
	});		
	
	$("input.red").click(function() {
			$(this).val("");
			$(this).removeClass("red");
	});
	
	if ($.browser.msie && $.browser.version.substr(0,1)<7) {
	 	ieScripts();
	}
	
	
});

function loadColors(){
	var tot = 0;
	var pages = 0;
	var choice = $("#choice-type").val();
	var choiceType = "";
	$(".mag-pop").hide();
	$(".no-choices").hide();
	$(".colors").attr("multiple","no");
	$(".right-arrow").removeClass("right-arrow-on");$(".left-arrow").removeClass("left-arrow-on");
	
	for(var i = 0; i < colorsObj.length; i++) { 
		  if (choice == colorsObj[i].colorId) choiceType = "selected";
		  var goodGo = true;
		  if ($('.filter-price[selected="yes"]')) {
			 colorPriceLoop = parseFloat(colorsObj[i].colorPrice);
			 $('.filter-price[selected="yes"]').each(function() {
				 highPrice = parseFloat($(this).attr("high"));
				 lowPrice = parseFloat($(this).attr("low"));
				 if (colorPriceLoop>highPrice || colorPriceLoop<lowPrice) goodGo = false;
				 else {goodGo = true; return false;}
				;
			  });
		  }
		  if (goodGo) {
			  $(".colors").append('<div class="choice-cont" num="'+(tot+1)+'" >\n<a class="mag" large-image="'+colorsObj[i].largeImg+'"><img src="../../images/mag.png" alt="" /></a>\n<a class="choice '+choiceType+'" name="'+colorsObj[i].colorId+'" series="The Absolute Black 3cm Series">\n<img src="'+colorsObj[i].colorImg+'" alt="" />\n<div>\n<h4>'+colorsObj[i].colorName+'</h4>\n<p>$'+colorsObj[i].colorPrice.toFixed(2)+' / sq. ft.</p>\n</div>\n</a>\n</div>');
			  if(tot==8) $(".colors").attr("multiple","yes");
			  tot++;
			  choiceType = "";
	      }
	}
	
	var lis = $(".choice-cont");
	for(var i = 0; i < lis.length; i+=8) {
	  var active = "";
	  var row = "";	
	  if (i==0) {active = "colors-row-active";row="first"};
	  if ((i+8)>=lis.length) row="last";
	  lis.slice(i, i+8).wrapAll("<div class='choice-row "+active+"' page='"+(pages+1)+"' row='"+row+"'></div>\n");
	  pages++;
	}
	

	if (tot == 0) $(".no-choices").show();
	$("#num-total").html(tot);
	$("#page-total").html(pages);
	adjNum();
	if ($(".active-color").attr("multiple")=="yes") checkArrows($(".colors-row-active").attr("row"));
	
	loadHandlers();
			
}

function edgesCount() {
	var currentNum = "0"
    $("#num").html($(".colors-row-active .choice-cont:not(.none):first").attr("num")+"-"+$(".colors-row-active .choice-cont:not(.none):last").attr("num"));
	$("#page").html($(".colors-row-active").attr("page"));
	$("#num-total").html($(".choice-cont:not(.none)").length);
	$("#page-total").html($(".choice-row").length);
}

function loadHandlers() {
	$(".mag").click(function(){
		$(".mag-pop img").attr("src","");
		var pos = $(this).position();
		var src = $(this).attr("large-image");
		var txt = $(this).next().find("h4").text();
		var series = $(this).next().attr("series");
		var pTop = pos.top - 465;
		var pLeft = pos.left + 5;
		if (src != "") $(".mag-pop img").attr("src",src);
		else $(".mag-pop img").attr("src","/images/large-blank.gif");
		$(".mag-pop").css("margin-top",pTop);
		$(".mag-pop").css("margin-left",pLeft);
		$(".mag-pop h5").text(txt);
		$(".mag-pop").show();
	});
	
	$(".mag-pop-close, .mag-pop").click(function(){
		$(".mag-pop").hide();
	});
	
	$(".choice-cont:not(.none) a.choice").click(function(){
		var color = $(this).attr("name");
		$("#choice-type").val(color);
		$("a.choice").removeClass('selected');
		$(this).addClass('selected');
		showNext();
	});
}

function adjNum() {
	var currentNum = "0"
	if ($("#num-total").html() != "0") currentNum = $(".colors-row-active .choice-cont:first").attr("num")+"-"+$(".colors-row-active .choice-cont:last").attr("num");
    $("#num").html(currentNum);
	$("#page").html($(".colors-row-active").attr("page"));
}


function calculate(parentCalc) {
	var total = 0;
	$("#"+parentCalc+"").children().children("input.area").each(function() {
        var child = $(this);
		childVal = parseFloat(child.val());
		if (isNaN(childVal)){childVal=0;}
		total = (total+childVal);
		total = roundIt(total);;		
    });
	var divBy = parseFloat($("#"+parentCalc+" .divide").text());
	var total2 = (total/divBy);
	total2 = roundIt(total2);
	total2 = fixIt(total2);	
	total = fixIt(total);	
	$("#"+parentCalc+" input.total1").val(total);
	$("#"+parentCalc+" input.total2").val(total2);
	$("#"+parentCalc+"-measure").css("color","#707070");
	$("#"+parentCalc+"-measure").css("text-align","right");
    $("#"+parentCalc+"-measure").val(total2);
}

function testInputs() {
	var ready = true;
  	$(".short-input input.req").each(function() {
  		if (isNaN($(this).val())) ready = false;
    });
	
	if (ready == true) {
		showNext();
	}
}

function showNext() {
	$(".next").css("opacity","1.0");
	$(".next").css("filter","alpha(opacity=100)");
	$(".next").attr("disabled","");
}

function hideNext() {
	$(".next").css("opacity","0.4");
	$(".next").css("filter","alpha(opacity=40)");
	$(".next").attr("disabled","disabled");
}

function showBack() {
	$(".back").css("opacity","1.0");
	$(".back").css("filter","alpha(opacity=100)");
	$(".back").attr("disabled","");
}

function hideBack() {
	$(".back").css("opacity","0.4");
	$(".back").css("filter","alpha(opacity=40)");
	$(".back").attr("disabled","disabled");
}

function hideDone() {
	$(".done").css("opacity","0.4");
	$(".done").css("filter","alpha(opacity=40)");
	$(".done").attr("disabled","disabled");
}

function showDone() {
	$(".done").css("opacity","1.0");
	$(".done").css("filter","alpha(opacity=100)");
	$(".done").attr("disabled","");
}

function hideLight() {
	$(".light ").fadeOut();
	if ($.browser.msie && $.browser.version.substr(0,1)<7) {
		$("select").show();
	}
}

function showLight() {
	$(".light ").fadeIn();
	if ($.browser.msie && $.browser.version.substr(0,1)<7) {
		$("select").hide();
	}
}

function checkArrows(row) { 
	if (row == "first") {$(".right-arrow").addClass("right-arrow-on");$(".left-arrow").removeClass("left-arrow-on");}
	else if (row == "last") {$(".left-arrow").addClass("left-arrow-on");$(".right-arrow").removeClass("right-arrow-on");}
	else{$(".left-arrow").addClass("left-arrow-on");$(".right-arrow").addClass("right-arrow-on");}
	if ($("#sink").length) {}
	else adjNum();
}

function roundIt(total) {
	return Math.ceil(total);
}

function roundIt100(total) {
	return Math.ceil(total);
}

function fixIt(total) {
	return Math.ceil(total);
}

function compareHigh(a,b) {
  if (a.colorPrice > b.colorPrice)
     return -1;
  if (a.colorPrice < b.colorPrice)
    return 1;
  return 0;
}

function compareLow(a,b) {
  if (a.colorPrice < b.colorPrice)
     return -1;
  if (a.colorPrice > b.colorPrice)
    return 1;
  return 0;
}

function compareAlpha(a,b) {
  if (a.colorName < b.colorName)
     return -1;
  if (a.colorName > b.colorName)
    return 1;
  return 0;
}

function compareOmega(a,b) {
  if (a.colorName > b.colorName)
     return -1;
  if (a.colorName < b.colorName)
    return 1;
  return 0;
}

function checkAddSink() {
	var edit = false;
	var freeCount = 0;
    var showCount = 0;
	$(".add-sink-wide input").each(function() {
		
		var val = parseFloat($(this).val());
		var free = $(this).parent().attr("free");
		if (val>0) {
			edit = true;
			if (free=="yes") freeCount = freeCount+val;
			showCount++
		}
	});
	
	if(edit) {$(".add-sink").addClass("sink-cont-edit");$(".no-sink").removeClass("sink-cont-edit");}
	else $(".add-sink").removeClass("sink-cont-edit");
	checkNoSink();
	
	var freeMessage = "";
	if (freeCount==1) freeMessage = "You qualify for a free sink.";
	if (freeCount>1) freeMessage = "Multi-sink discount applied. ";
	
	$(".add-message").html(freeMessage);
	
	if (showCount>2) $(".more-link").show();
	else $(".more-link").hide();
}
function checkProvideSink() {
	var edit = false;
	$(".provide-sink-wide select").each(function() {
		val = $(this).val();
		if (val != "0") {
			edit = true;
		}
	});
	if(edit){ $(".provide-sink").addClass("sink-cont-edit");$(".no-sink").removeClass("sink-cont-edit");}
	else $(".provide-sink").removeClass("sink-cont-edit");
	checkNoSink();
}
function checkNoSink() {
	if ($(".provide-sink").hasClass("sink-cont-edit") || $(".add-sink").hasClass("sink-cont-edit")) $(".no-sink").addClass("sink-cont-grey");
	else $(".no-sink").removeClass("sink-cont-grey");
}

function checkSink() {
	if ($(".sink-cont-edit").length) showNext();
	else hideNext();
}

function moreLink() {
	$(".add-sink div.sink-cont-bottom").animate({'height':'340px','margin-top':'-205px'},500); 
	$(".add-choice").animate({'height':'200px','margin-top':'8px'},500); 
	$(".more-link").html("less");
}

function lessLink() {
  	$(".add-sink div.sink-cont-bottom").animate({'height':'135px','margin-top':'0px'},500); 
	$(".add-choice").animate({'height':'40px','margin-top':'3px'},500); 
	$(".more-link").html("more");
}

function ieScripts() {
 $('.surfaces .selected').hover(
    function() {
      $(this).addClass('over');
    },
    function() {
      $(this).removeClass('over');
  });
  $('.surface').hover(
    function() {
      $(this).addClass('surface-hover');
    },
    function() {
      $(this).removeClass('surface-hover');
  });
  $('.right-arrow-on').hover(
    function() {
      $(this).addClass('right-arrow-on-hover');
    },
    function() {
      $(this).removeClass('right-arrow-on-hover');
  });
  $('.left-arrow-on').hover(
    function() {
      $(this).addClass('left-arrow-on-hover');
    },
    function() {
      $(this).removeClass('left-arrow-on-hover');
  });
  $('.sink-cont-grey').hover(
    function() {
      $(this).addClass('sink-cont-grey-hover');
    },
    function() {
      $(this).removeClass('sink-cont-grey-hover');
  });
  $('.add-sink-cell').hover(
    function() {
      $(this).addClass('add-sink-cell-hover');
    },
    function() {
      $(this).removeClass('add-sink-cell-hover');
  });
  $('.sink-cont').hover(
    function() {
      $(this).addClass('sink-cont-hover');
    },
    function() {
      $(this).removeClass('sink-cont-hover');
  });
  $('.choice').hover(
    function() {
      $(this).addClass('choice-hover');
    },
    function() {
      $(this).removeClass('choice-hover');
  });
}