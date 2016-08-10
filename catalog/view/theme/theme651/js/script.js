var gl_path = jQuery('#gl_path').html();
function include(scriptUrl) {
	document.write('<script src="catalog/view/theme/' + gl_path + '/' + scriptUrl + '"></script>');
}

/* Easing library
========================================================*/
include('js/jquery.easing.1.3.js');

/* footer block
========================================================= */

;
$(window).load(function () {
	$(".block-progress").wrapAll("<div class='col-sm-6'></div>");
})

/* Parallax block
=========================================================*/

;
(function ($) {
	var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
	if ($('.parallax-items').length && width > 767) {
		var o = $('.parallax-items');
		$(document).ready(function () {
			o.RDParallax({});
		});
	};
})(jQuery);


/* ToTop
========================================================*/
;
(function ($) {
	var o = $('html');
	if (o.hasClass('desktop')) {
		include('js/jquery.ui.totop.js');

		$(document).ready(function () {
			$().UItoTop({easingType: 'easeOutQuart'});
		});
	}
})(jQuery);




/* Stick up menus
========================================================*/
;
(function ($) {
	var o = $('html');
	var menu = $('#stuck');
	if (o.hasClass('desktop') && menu.length) {
		include('js/scrollfix.min.js');

		$(window).load(function () {
			menu.scrollFix({
				style: false
			});
		});
	}
})(jQuery);


/* Top-Links Active
========================================================*/

;
(function ($) {
	$(document).ready(function(){
		var pgurl = window.location.href;
		$("#top-links a").each(function(){
			if($(this).attr("href") == pgurl || $(this).attr("href") == '' )
				$(this).addClass("active");
		});
	});
})(jQuery);

/* Stick up menus
========================================================*/
;
(function ($) {
	include('js/jquery.rd-navbar.min.js');
})(jQuery);

/* Unveil
========================================================*/
;
(function ($) {
	var o = $('.lazy img');

	if (o.length > 0) {
		include('js/jquery.unveil.min.js');

		$(document).ready(function () {
			$(o).unveil(0, function () {
				$(this).load(function () {
					$(this).parent().addClass("lazy-loaded");
				})
			});
		});

		$(window).load(function () {
			$(window).trigger('lookup.unveil');
			if ($('.nav-tabs').length) {
				$('.nav-tabs').find('a[data-toggle="tab"]').click(function () {
					setTimeout(function () {
						$(window).trigger('lookup.unveil');
					}, 400);
				})
			}
		});

	}
})(jQuery);

/* Magnificent
========================================================*/
;
(function ($) {
	var o = $('#image-additional');
	if (o.length > 0) {
		include('js/magnificent/jquery.ba-throttle-debounce.js');
		include('js/magnificent/jquery.bridget.js');
		include('js/magnificent/magnificent.js');

		$(document).ready(function () {

			o.find('li:first-child a').addClass('active');

			$('#product-image').bind("click", function (e) {
				var imgArr = [];
				o.find('a').each(function () {
					img_src = $(this).data("image");

                    //put the current image at the start
                    if (img_src == $('#product-image').find('img').attr('src')) {
                    	imgArr.unshift({
                    		href: '' + img_src + '',
                    		title: $(this).find('img').attr("title")
                    	});
                    }
                    else {
                    	imgArr.push({
                    		href: '' + img_src + '',
                    		title: $(this).find('img').attr("title")
                    	});
                    }
                 });
				$.fancybox(imgArr);
				return false;
			});


			o.find('[data-image]').click(function (e) {
				e.preventDefault();
				o.find('.active').removeClass('active');
				var img = $(this).data('image');
				$(this).addClass('active');
				$('#product-image').find('.inner img').each(function () {
					$(this).attr('src', img);
				})
			})

		});

}
})
(jQuery);


/* Bx Slider
========================================================*/
;
(function ($) {
	var o = $('#image-additional');
	var o2 = $('#gallery');
	if (o.length || o2.length) {
		include('js/jquery.bxslider/jquery.bxslider.js');
	}

	if (o.length) {
		$(document).ready(function () {
			$('#image-additional').bxSlider({
				mode: 'vertical',
				pager: false,
				controls: true,
				slideMargin: 13,
				minSlides: 4,
				maxSlides: 4,
				slideWidth: 88,
				nextText: '<i class="fa fa-chevron-down"></i>',
				prevText: '<i class="fa fa-chevron-up "></i>',
				infiniteLoop: false,
				adaptiveHeight: true,
				moveSlides: 1
			});
		});
	}

	if (o2.length) {
		include('js/photo-swipe/klass.min.js');
		include('js/photo-swipe/code.photoswipe.jquery-3.0.5.js');
		include('js/photo-swipe/code.photoswipe-3.0.5.min.js');
		$(document).ready(function () {
			$('#gallery').bxSlider({
				pager: false,
				controls: true,
				minSlides: 1,
				maxSlides: 1,
				infiniteLoop: false,
				moveSlides: 1
			});
		});
	}

})(jQuery);

/* FancyBox
========================================================*/
;
(function ($) {
	var o = $('.quickview');
	var o2 = $('#default_gallery');
	if (o.length > 0 || o2.length > 0) {
		include('js/fancybox/jquery.fancybox.js');
	}

	if (o.length) {
		$(document).ready(function () {
			o.fancybox({
				maxWidth: 800,
				maxHeight: 600,
				fitToView: false,
				width: '70%',
				height: '70%',
				autoSize: false,
				closeClick: false,
				openEffect: 'elastic',
				closeEffect: 'elastic',
				speedIn: 600,
				speedOut: 600
			});
		});
	}

})(jQuery);



/* Owl Carousel
========================================================*/
;
(function ($) {
	var o = $('.testimonials');
	if (o.length > 0) {
		$(document).ready(function () {
			o.owlCarousel({
                // Most important owl features
                items: 1,
                itemsCustom: false,
                singleItem: true,

                // Navigation
                pagination: false,
                navigation: true,
                navigationText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],


             });
		});
	}
})(jQuery);

/* Owl Carousel
========================================================*/
;
(function ($) {
	var o1 = $('.testimonials');
	var o2 = $('.box-carousel');
	if (o1.length > 0 || o2.length > 0) {
		document.write('<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js"></script>');
	}
	if (o1.length > 0) {
		$(document).ready(function () {
			o1.owlCarousel({
				// Most important owl features
				items: 1,
				itemsCustom: false,
				singleItem: true,
				// Navigation
				pagination: false,
				navigation: true,
				navigationText: ['<i class="material-design-keyboard54"></i>', '<i class="material-design-keyboard53"></i>'],
			});
		});
	}
	if (o2.length > 0) {
		$(document).ready(function () {
			$.each(o2, function () {
				if ($(this).parents('aside').length) {
					$(this).owlCarousel({
						// Most important owl features
						items: 1,
						itemsCustom: false,
						itemsDesktop: [1199, 1],
						itemsDesktopSmall: [991, 1],
						itemsTablet: [767, 1],
						itemsTabletSmall: false,
						itemsMobile: [479, 1],
						// Navigation
						pagination: false,
						navigation: true,
						navigationText: ['<i class="material-design-keyboard54"></i>', '<i class="material-design-keyboard53"></i>']
					});
				} else if ($(this).parents().hasClass('col-sm-9')){
					$(this).owlCarousel({
						// Most important owl features
						items: 3,
						itemsCustom: false,
						itemsDesktop: [1199, 3],
						itemsDesktopSmall: [991, 3],
						itemsTablet: [767, 1],
						itemsTabletSmall: false,
						itemsMobile: [480, 1],
						// Navigation
						pagination: false,
						navigation: true,
						navigationText: ['<i class="material-design-keyboard54"></i>', '<i class="material-design-keyboard53"></i>']
					});
				} else if ($(this).parents().hasClass('col-sm-6')){
					$(this).owlCarousel({
						// Most important owl features
						items: 2,
						itemsCustom: false,
						itemsDesktop: [1199, 2],
						itemsDesktopSmall: [991, 2],
						itemsTablet: [767, 1],
						itemsTabletSmall: false,
						itemsMobile: [480, 1],
						// Navigation
						pagination: false,
						navigation: true,
						navigationText: ['<i class="material-design-keyboard54"></i>', '<i class="material-design-keyboard53"></i>']
					});
				} else {
					$(this).owlCarousel({
						// Most important owl features
						items: 4,
						itemsCustom: false,
						itemsDesktop: [1199, 4],
						itemsDesktopSmall: [9991, 4],
						itemsTablet: [767, 1],
						itemsTabletSmall: false,
						itemsMobile: [480, 1],
						// Navigation
						pagination: false,
						navigation: true,
						navigationText: ['<i class="material-design-keyboard54"></i>', '<i class="material-design-keyboard53"></i>']
					});
				}
			});
		});
	}
})(jQuery);

///* GREEN SOCKS
// ========================================================*/
//;
//(function ($) {
//    var o = $('html');
//    if (o.hasClass('desktop') && o.find('body').hasClass('common-home')) {
//        include('js/greensock/jquery.gsap.min.js');
//        include('js/greensock/TimelineMax.min.js');
//        include('js/greensock/TweenMax.min.js');
//        include('js/greensock/jquery.scrollmagic.min.js');
//
//        function listBlocksAnimate(block, element, row, offset, difEffect) {
//            if ($(block).length) {
//                var i = 0;
//                var j = row;
//                var k = 1;
//                var effect = -1;
//
//                $(element).each(function () {
//                    i++;
//
//                    if (i > j) {
//                        j += row;
//                        k = i;
//                        effect = effect * (-1);
//                    }
//
//                    if (effect == -1 && difEffect == true) {
//                        ef = TweenMax.from(element + ':nth-child(' + i + ')', 0.5, {
//                            left: -1 * 200 - i * 300 + "px",
//                            alpha: 0,
//                            ease: Power1.easeOut
//                        })
//
//                    } else {
//                        ef = TweenMax.from(element + ':nth-child(' + i + ')', 0.5, {
//                            right: -1 * 200 - i * 300 + "px",
//                            alpha: 0,
//                            ease: Power1.easeOut
//                        })
//                    }
//
//                    var scene_new = new ScrollScene({
//                        triggerElement: element + ':nth-child(' + k + ')',
//                        offset: offset,
//                    }).setTween(ef)
//                        .addTo(controller)
//                        .reverse(false);
//                });
//            }
//        }
//
//        function listTabsAnimate(element) {
//            if ($(element).length) {
//                TweenMax.staggerFromTo(element, 0.3, {alpha: 0, rotationY: -90, ease: Power1.easeOut}, {
//                    alpha: 1,
//                    rotationY: 0,
//                    ease: Power1.easeOut
//                }, 0.1);
//            }
//        }
//
//        $(document).ready(function () {
//            controller = new ScrollMagic();
//        });
//
//        $(window).load(function () {
//            //if ($(".fluid_container").length) {
//            //    var welcome = new TimelineMax();
//            //
//            //    welcome.from(".fluid_container h2", 0.5, {top: -300, autoAlpha: 0})
//            //        .from(".fluid_container h4", 0.5, {bottom: -300, autoAlpha: 0});
//            //
//            //    var scene_welcome = new ScrollScene({
//            //        triggerElement: ".fluid_container",
//            //        offset: -100
//            //    }).setTween(welcome).addTo(controller).reverse(false);
//            //}
//        });
//    }
//})(jQuery);

/* EqualHeights
========================================================*/
;
(function ($) {
	var o = $('[data-equal-group]');
	if (o.length > 0) {
		include('js/jquery.equalheights.min.js');
	}
})(jQuery);

/* Toggle
 ========================================================*/
;
(function ($) {
    var o = $('.toggle');
    $(document).ready(function () {
        $('.toggle').click(function (e) {
            e.preventDefault();
            var tmp = $(this);
            o.each(function () {
                if ($(this).hasClass('active') && !$(this).is(tmp)) {
					$(this).parent().find('.toggle_cont').animate({marginTop:15, opacity:0},{duration:300, done:function(){$(this).css({'display':'none'});}});
					$(this).removeClass('active');
                }
            });
			
            $(this).toggleClass('active');
			
			if ($(this).hasClass('active')) {
				$(this).parent().find('.toggle_cont').css({'display':'block'}).animate({marginTop:0, opacity:1},300);
			} else {
				$(this).parent().find('.toggle_cont').animate({marginTop:15, opacity:0},{duration:300, done:function(){$(this).css({'display':'none'});}});	
			};
			
			if ($('.rd-mobilemenu').hasClass('active')) {
				$('.rd-mobilemenu').removeClass('active');
			};		
			
        });
        $(document).on('click touchstart', function (e) {
            var container = $(".toggle-wrap");
          if (!container.is(e.target) && container.has(e.target).length === 0 && container.find('.toggle').hasClass('active')) {
              container.find('.active').toggleClass('active').parent().find('.toggle_cont').animate({marginTop:15, opacity:0},{duration:300, done:function(){$(this).css({'display':'none'});}});
            }
        })
    });
})(jQuery);

/* Dropdown Toggle
 ========================================================*/
;
(function ($) {
    var o = $('.dropdown-toggle');
    $(document).ready(function () {
        $('.dropdown-toggle').click(function (e) {
            e.preventDefault();
            $(this).parent().find('.dropdown-menu').slideToggle();
        });
        
    });
})(jQuery);


(function ($) {
	var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
	if (width < 768) {
		$(document).ready(function () {
			$('.rd-mobilemenu_ul .rd-with-ul[href="#"]').click(function() {
				return false;
			});			
		});
	}
})(jQuery);

/* Radio Replacement
========================================================*/
;
(function ($) {
	var o = $('.radio');

	if (o.length) {
		$(window).load(function () {
			var input;
			var arrVal = [];
			o.each(function (i) {
				input = $(this).find('input[type="radio"]');
				if ($.inArray(input.attr('name') + input.attr('value'), arrVal) == -1) {
					input.attr('id', input.attr('name') + input.attr('value'))
					input.insertBefore($(this).find('label').attr('for', input.attr('name') + input.attr('value')));
					arrVal.push(input.attr('name') + input.attr('value'))
				} else {
					input.attr('id', input.attr('name') + input.attr('value') + i.toString());
					input.insertBefore($(this).find('label').attr('for', input.attr('name') + input.attr('value') + i.toString()));
					arrVal.push(input.attr('name') + input.attr('value') + i.toString());
				}
			})
		});
	}
	var o2 = $('label.radio-inline');
	if (o2.length) {
		$(document).ready(function () {
			var input;
			o2.each(function () {
				input = $(this).find('input[type="radio"]');
				input.attr('id', input.attr('name') + input.attr('value'))
				input.insertBefore($(this).attr('for', input.attr('name') + input.attr('value')));
			})
		});
	}
})(jQuery);


/* Accordion fix
========================================================*/
;
(function ($) {
	var o = $('#accordion');
	if (o.length) {
		include('js/jquery.selectbox-0.2.min.js');
		$(window).load(function () {
			$('body').delegate('.accordion-toggle', 'click', replaceForm);
			$('.accordion-toggle').trigger('click');
		});
	}
})(jQuery);


/* Checkbox Replacement
========================================================*/
;
(function ($) {
	var o = $('.checkbox');
	if (o.length) {
		$(document).ready(function () {
			var input;
			var arrVal = [];
			o.each(function (i) {
				input = $(this).find('input[type="checkbox"]');
				if ($.inArray(input.attr('name') + input.attr('value'), arrVal) == -1) {
					input.attr('id', input.attr('name') + input.attr('value'))
					input.insertBefore($(this).find('label').attr('for', input.attr('name') + input.attr('value')));
					arrVal.push(input.attr('name') + input.attr('value'))
				} else {
					input.attr('id', input.attr('name') + input.attr('value') + input.attr('value') + i.toString())
					input.insertBefore($(this).find('label').attr('for', input.attr('name') + input.attr('value') + input.attr('value') + i.toString()));
					arrVal.push(input.attr('name') + input.attr('value') + i.toString());
				}
			})
		});
	}

	var o2 = $('input[name=\'agree\'][type=\'checkbox\']');
	if (o2.length) {
		$(document).ready(function () {
			o2.attr('id', o2.attr('name') + o2.attr('value'));
			o2.parent().append('<label for="' + o2.attr('name') + o2.attr('value') + '"></label>');
			$('label[for="' + o2.attr('name') + o2.attr('value') + '"]').insertAfter(o2);

		});
	}

	var o3 = $('.checkbox-inline');
	if (o3.length) {
		var input;
		o3.each(function (i) {
			input = $(this).find('input[type="checkbox"]');
			input.attr('id', input.attr('name') + input.attr('value'))
			input.insertBefore($(this).attr('for', input.attr('name') + input.attr('value')));

		})
	}
})(jQuery);


/* DatetimePicker
========================================================*/
;
(function ($) {
	$('.date').datetimepicker({
		pickTime: false,
		defaultDate: moment().add(1,'days'),
	minDate: moment().add(1,'days'),
	maxDate: moment().add(30,'days')
	});

	$('.datetime').datetimepicker({
		pickDate: true,
		pickTime: true
	});

	$('.time').datetimepicker({
		pickDate: false
	});
	d = new Date();
var days = [
    'SUN',
    'MON',
    'TUE',
    'WED',
    'THU',
    'FRI',
    'SAT'
];
//console.log($('.date').val());
	var catlist = $("#7day-catlist").html();
	var catArr = Array('20');
	var mealType = $("#mealType").val();
	var catNameArr = Array('Signature Entries');
	$('.date').on('change',function(){
		$("#weekdayPlanner").remove();
		var str;
		var tab_content;
		var final_str='';
		var d = parseInt($("input[name='option[42]']").val().substr(8));
		for(var m=1;m<=mealType;m++){
			var area_exp;
			var inout;
			if(m==1){
				area_exp='true';
				inout='in';
			}
			else{
				area_exp = '';
				inout='';
			}
			//str = '<div data-toggle="collapse" data-target="#meal'+m+'" aria-expanded="'+area_exp+'">Meal '+m+'</div>';
			
			str = '<div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" data-parent="#weekdayPlanner" href="#meal'+m+'">Meal '+m+'</a></h4></div>';
	
			str += '<div id="meal'+m+'"  class="week-panel panel-collapse collapse '+inout+'" aria-expanded="true">';
			str += '<ul class="nav nav-tabs">';
			tab_content = '<div class="tab-content">';
			for(var i=1;i<=7;i++){
				var x = d+i-1;
				if(x>=7)
				x=x%7;
				if(i==1)
				var act_clas='active';
				else
				var act_clas='';
				str += '<li class="'+act_clas+'"><a href="#tab-days'+m+'-'+x+'" data-toggle="tab">'+days[x]+'</a></li>';
				var faceboxStr='<a href="index.php?route=product/7days/getProduct&product_id=51&mealType='+mealType+'&meal='+m+'&mealDay='+i+'" rel="facebox">Custom Meal</a>';
				for(var c=0;c<catArr.length;c++){
					faceboxStr = faceboxStr + '<br><a href="index.php?route=product/7days/getCategory&category='+catArr[c]+'&meal='+m+'&mealType='+mealType+'&mealDay='+i+'" rel="facebox">'+catNameArr[c]+'</a>';
				}
				tab_content += '<div id="tab-days'+m+'-'+x+'" class="tab-pane '+act_clas+'"><span>Create your combination of meals from below categories for '+days[x]+'</span><br>'+faceboxStr+'</div>';
			}	
			//str += '</div>';
			tab_content+='</div>';
			/*str += '</ul>'+tab_content+'</div>';
			str += '</div>';*/
			final_str += str+'</ul>'+tab_content+'</div></div>';
			
		}
		
			
			//str += '</ul>'+tab_content;
			
			
			$("#input-option42").parent('div').after('<div class="panel-group" id="weekdayPlanner">'+final_str+'</div>');
	});
	$(".date").trigger('change');

	$(document).ready(function () {
		$('.date,.datetime,.time').each(function () {
			var $this = $(this);
			$(this).find('.btn').click(function () {
				var body = $('body');
				if (body.hasClass('ajax-overlay-open')) {
					var open;
					setTimeout(function () {
						open = $('body').find('.bootstrap-datetimepicker-widget.picker-open');
						if (open.hasClass('top')) {
							open.css('bottom', $(window).height() - ($this.offset().top - $('.ajax-overlay').offset().top));
						}
					}, 10);
				}
			})

		})
	});

	$(document).ready(function () {
		$('.date, .datetime, .time').on('dp.show', function () {
			$('.date, .datetime, .time').not($(this)).each(function () {
				$(this).data("DateTimePicker").hide();
			});
		});
		$(this).on('click touchstart', function () {
			$('.date, .datetime, .time').each(function () {
				$(this).data("DateTimePicker").hide();
			});
		})

	});

})(jQuery);

/* Ajax-Add-to-Cart Upload File
========================================================*/
;(function ($) {
	var o = $('button[id^=\'button-upload\']');
	if (o.length) {
		$('button[id^=\'button-upload\']').on('click', function() {
			var node = this;
			$('#form-upload').remove();
			$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
			$('#form-upload input[name=\'file\']').trigger('click');
			if (typeof timer != 'undefined') {
				clearInterval(timer);
			}
			timer = setInterval(function() {
				if ($('#form-upload input[name=\'file\']').val() != '') {
					clearInterval(timer);
					$.ajax({
						url: 'index.php?route=tool/upload',
						type: 'post',
						dataType: 'json',
						data: new FormData($('#form-upload')[0]),
						cache: false,
						contentType: false,
						processData: false,
						beforeSend: function() {
							$(node).button('loading');
						},
						complete: function() {
							$(node).button('reset');
						},
						success: function(json) {
							$('.text-danger').remove();

							if (json['error']) {
								$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
							}

							if (json['success']) {
								alert(json['success']);

								$(node).parent().find('input').attr('value', json['code']);
							}
						},
						error: function(xhr, ajaxOptions, thrownError) {
							alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
						}
					});
				}
			}, 500);
		});
}
})(jQuery);

/* Select Replacement
========================================================*/
;
(function ($) {
	var o = $('select');
	if (o.length) {
		include('js/jquery.selectbox-0.2.min.js');
		$(document).ready(function () {
			o.removeClass('form-control');
			o.selectbox({
				effect: "slide",
				speed: 400
			})
			var zone = $('select[name=\'zone_id\']');
			if (zone.length) {
				setTimeout(function () {
					zone.selectbox('detach');
					zone.selectbox('attach');
				}, 900);
				$('select[name=\'country_id\']').on('change', function () {
					setTimeout(function () {
						zone.selectbox('detach');
						zone.selectbox('attach');
					}, 300);
				})
			}

		});
	}
})(jQuery);


/* Textarea Replacement
========================================================*/
;
(function ($) {
	var o = $('textarea');
	if (o.length) {
		$(document).ready(function () {
			o.removeClass('form-control');

		});
	}
})(jQuery);

/* Quantity Counter
========================================================*/
;
(function ($) {
	var o = $('input[name*="quantity"]');
	$(document).ready(function () {
		$('.counter-minus').click(function (e) {
			e.preventDefault();
			input = $(this).parent().find('input[name*="quantity"]');
			if (input.val() > 1){
				value = parseInt(input.val()) - 1;
				input.val(value);
			}
		})
		$('.counter-plus').click(function (e) {
			e.preventDefault();
			input = $(this).parent().find('input[name*="quantity"]');
			value = parseInt(input.val()) + 1;
			input.val(value);
		})
	});
})(jQuery);


$(document).ready(function () {
	if ($('.breadcrumb').length) {
		var o = $('.breadcrumb li:last-child');
		var str = o.find('a').html();
		o.find('a').css('display', 'none');
		o.append('<span>' + str + '</span>');
	}
});

var flag = true;

function respResize() {
	var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;

	if ($('aside').length) {
		var leftColumn = $('aside');
	} else {
		return false;
	}


	if (width > 767) {
		if (!flag) {
			flag = true;
			leftColumn.insertBefore('#content');
			if (window.twttr != undefined){
				twtrefresher.doRefresh();
			}
			$('.col-sm-3 .box-heading').unbind("click");

			$('.col-sm-3 .box-content').each(function () {
				if ($(this).is(":hidden")) {
					$(this).slideToggle();
				}
			})
		}
	} else if (flag) {
		flag = false;

		if ($('.clr').length == 0) {
			$('#content .product-layout').each(function (i) {
				if (i % 2 == 0) {
					$(this).addClass('clr');
				}
			});
		}
		leftColumn.insertAfter('#content');
		if (window.twttr != undefined){
			twtrefresher.doRefresh();
		}
		$('.col-sm-3 .box-content').each(function () {
			if (!$(this).is(":hidden")) {
				$(this).parent().find('.box-heading').addClass('active');
			}
		});

		$('.col-sm-3 .box-heading').bind("click", function () {
			if ($(this).hasClass('active')) {
				$(this).removeClass('active').parent().find('.box-content').slideToggle();
			}else {
				$(this).addClass('active');
				$(this).parent().find('.box-content').slideToggle();
			}
		})
	}
}

$(window).load(respResize);
$(window).resize(function () {
	clearTimeout(this.id);
	this.id = setTimeout(respResize, 500);
});


function replaceForm() {
	var o = $('.radio');
	var input;
	o.each(function () {
		input = $(this).find('input[type="radio"]');
		input.attr('id', input.attr('name') + input.attr('value'));
		input.insertBefore($(this).find('label').attr('for', input.attr('name') + input.attr('value')));
	});
	o = $('label.radio-inline');
	o.each(function () {
		input = $(this).find('input[type="radio"]');
		input.attr('id', input.attr('name') + input.attr('value'));
		input.insertBefore($(this).attr('for', input.attr('name') + input.attr('value')));
	});
	o = $('.checkbox');
	o.each(function () {
		input = $(this).find('input[type="checkbox"]');
		input.attr('id', input.attr('name') + input.attr('value'));
		input.insertBefore($(this).find('label').attr('for', input.attr('name') + input.attr('value')));
	});
	o = $('input[name=\'agree\'][type=\'checkbox\']');
	if (o.length) {
		o.attr('id', o.attr('name') + o.attr('value'));
		o.parent().append('<label for="' + o.attr('name') + o.attr('value') + '"></label>');
		$('label[for="' + o.attr('name') + o.attr('value') + '"]').insertAfter(o);
	}
	o = $('select');
	o.selectbox({
		effect: "slide",
		speed: 400
	});
	var o = $('textarea');
	o.removeClass('form-control');
	var zone = $('select[name=\'zone_id\']');
	if (zone.length) {
		var timerId = 0;
		zone.each(function (i) {
			if ($(this).prev().find('.sbOptions li').length == 0) {
				var tmp = $(this);
				timerId = setInterval(function () {
					tmp.selectbox('detach');
					tmp.selectbox('attach');
					if (tmp.prev().find('.sbOptions li').length != 0) {
						clearInterval(timerId);
					}
				}, 300);
			}
		})

		$('select[name=\'country_id\']').on('change', function () {
			setTimeout(function () {
				zone.selectbox('detach');
				zone.selectbox('attach');
			}, 300);

		})
	}
}


