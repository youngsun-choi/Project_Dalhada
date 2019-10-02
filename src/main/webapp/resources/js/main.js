
(function ($) {
    "use strict";

    /*[ Load page ]
    ===========================================================*/
    $(".animsition").animsition({
        inClass: 'fade-in',
        outClass: 'fade-out',
        inDuration: 1500,
        outDuration: 800,
        linkElement: '.animsition-link',
        loading: true,
        loadingParentElement: 'html',
        loadingClass: 'animsition-loading-1',
        loadingInner: '<div class="loader05"></div>',
        timeout: false,
        timeoutCountdown: 5000,
        onLoadEvent: true,
        browser: [ 'animation-duration', '-webkit-animation-duration'],
        overlay : false,
        overlayClass : 'animsition-overlay-slide',
        overlayParentElement : 'html',
        transition: function(url){ window.location.href = url; }
    });
    
    /*[ Back to top ]
    ===========================================================*/
    var windowH = $(window).height()/2;

    $(window).on('scroll',function(){
        if ($(this).scrollTop() > windowH) {
            $("#myBtn").css('display','flex');
        } else {
            $("#myBtn").css('display','none');
        }
    });

    $('#myBtn').on("click", function(){
        $('html, body').animate({scrollTop: 0}, 300);
    });


    /*==================================================================
    [ Fixed Header ]*/
    var headerDesktop = $('.container-menu-desktop');
    var wrapMenu = $('.wrap-menu-desktop');

    if($('.top-bar').length > 0) {
        var posWrapHeader = $('.top-bar').height();
    }
    else {
        var posWrapHeader = 0;
    }
    

    if($(window).scrollTop() > posWrapHeader) {
        $(headerDesktop).addClass('fix-menu-desktop');
        $(wrapMenu).css('top',0); 
    }  
    else {
        $(headerDesktop).removeClass('fix-menu-desktop');
        $(wrapMenu).css('top',posWrapHeader - $(this).scrollTop()); 
    }

    $(window).on('scroll',function(){
        if($(this).scrollTop() > posWrapHeader) {
            $(headerDesktop).addClass('fix-menu-desktop');
            $(wrapMenu).css('top',0); 
        }  
        else {
            $(headerDesktop).removeClass('fix-menu-desktop');
            $(wrapMenu).css('top',posWrapHeader - $(this).scrollTop()); 
        } 
    });


    /*==================================================================
    [ Menu mobile ]*/
    $('.btn-show-menu-mobile').on('click', function(){
        $(this).toggleClass('is-active');
        $('.menu-mobile').slideToggle();
    });

    var arrowMainMenu = $('.arrow-main-menu-m');

    for(var i=0; i<arrowMainMenu.length; i++){
        $(arrowMainMenu[i]).on('click', function(){
            $(this).parent().find('.sub-menu-m').slideToggle();
            $(this).toggleClass('turn-arrow-main-menu-m');
        })
    }

    $(window).resize(function(){
        if($(window).width() >= 992){
            if($('.menu-mobile').css('display') == 'block') {
                $('.menu-mobile').css('display','none');
                $('.btn-show-menu-mobile').toggleClass('is-active');
            }

            $('.sub-menu-m').each(function(){
                if($(this).css('display') == 'block') { console.log('hello');
                    $(this).css('display','none');
                    $(arrowMainMenu).removeClass('turn-arrow-main-menu-m');
                }
            });
                
        }
    });   
    /*==================================================================
    [ Login ]*/   
    var referer='';
	$(document).ready(function(){
		$("#submit").click(function(){
			var id = $("#id").val();
			var pwd = $("#password").val();
			referer =  document.referrer;
			if(id==""){
				$("#loginError").text("아이디를 입력하세요.").css("color", "red");		
				return;
			}else if(pwd==""){
				$("#loginError").text("비밀번호를 입력하세요.").css("color", "red");		
				return;
			}
			$.ajax({
				url : '/dalhada/login?id='+id+'&password='+pwd,
				type : 'post',
				success : function(data){
					if(data == "false"){
							$("#loginError").text("아이디와 비밀번호가 일치하지 않습니다.").css("color", "red");	
					}else{
						if(referer.includes('logout')||referer.includes('memberForm'))
							referer="http://localhost:8000/dalhada/main";
						location.href=referer;
					}
				}
			});
		});
	});

    /*==================================================================
    [ Isotope ]*/
    var $topeContainer = $('.isotope-grid');
    var $filter = $('.filter-tope-group');

    // filter items on button click
    $filter.each(function () {
        $filter.on('click', 'button', function () {
            var filterValue = $(this).attr('data-filter');
            $topeContainer.isotope({filter: filterValue});
        });
        
    });

    // init Isotope
    $(window).on('load', function () {
        var $grid = $topeContainer.each(function () {
            $(this).isotope({
                itemSelector: '.isotope-item',
                layoutMode: 'fitRows',
                percentPosition: true,
                animationEngine : 'best-available',
                masonry: {
                    columnWidth: '.isotope-item'
                }
            });
        });
    });

    var isotopeButton = $('.filter-tope-group button');

    $(isotopeButton).each(function(){
        $(this).on('click', function(){
            for(var i=0; i<isotopeButton.length; i++) {
                $(isotopeButton[i]).removeClass('how-active1');
            }

            $(this).addClass('how-active1');
        });
    });

    /*==================================================================
    [ Filter / Search product ]*/
    $('.js-show-filter').on('click',function(){
        $(this).toggleClass('show-filter');
        $('.panel-filter').slideToggle(400);

        if($('.js-show-search').hasClass('show-search')) {
            $('.js-show-search').removeClass('show-search');
            $('.panel-search').slideUp(400);
        }    
    });

    $('.js-show-search').on('click',function(){
        $(this).toggleClass('show-search');
        $('.panel-search').slideToggle(400);
alret("search")
        if($('.js-show-filter').hasClass('show-filter')) {
            $('.js-show-filter').removeClass('show-filter');
            $('.panel-filter').slideUp(400);
        }    
    });




    /*==================================================================
    [ Bucket ]*/
    $('.js-show-cart').on('click',function(){
        $('.js-panel-cart').addClass('show-header-cart');
    });

    $('.js-hide-cart').on('click',function(){
        $('.js-panel-cart').removeClass('show-header-cart');
    });

    /*==================================================================
    [ +/- heart ]*/
    $('.heart').each(function(){
			$(this).on('click', function(){
				var action;
				if($(this).hasClass('js-addedlike')){
					$(this).removeClass('js-addedlike');
					action = "delete";
				}else{
					$(this).addClass('js-addedlike');
					action = "insert";
				}
				$.ajax({
					url: "main/like/",
	                type: "POST",
	                data: {
	                    selectedbucket_id : $(this).attr("id"),
	                    action : action
	                },
	                success: function (result) {
	                	if(result!=1){
	                		window.location.href = "loginmain";
	                	}
	                },
	                error : function(request, status, error){
	    				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:");
	    			}
				})
				
			});
		});

    /*==================================================================
    [ Rating ]*/
    $('.wrap-rating').each(function(){
        var item = $(this).find('.item-rating');
        var rated = -1;
        var input = $(this).find('input');
        $(input).val(0);

        $(item).on('mouseenter', function(){
            var index = item.index(this);
            var i = 0;
            for(i=0; i<=index; i++) {
                $(item[i]).removeClass('zmdi-star-outline');
                $(item[i]).addClass('zmdi-star');
            }

            for(var j=i; j<item.length; j++) {
                $(item[j]).addClass('zmdi-star-outline');
                $(item[j]).removeClass('zmdi-star');
            }
        });

        $(item).on('click', function(){
            var index = item.index(this);
            rated = index;
            $(input).val(index+1);
        });

        $(this).on('mouseleave', function(){
            var i = 0;
            for(i=0; i<=rated; i++) {
                $(item[i]).removeClass('zmdi-star-outline');
                $(item[i]).addClass('zmdi-star');
            }

            for(var j=i; j<item.length; j++) {
                $(item[j]).removeClass('zmdi-star');
            }
        });
    });
    
    /*==================================================================
    [ Show modal ]*/
    $('.js-show-modal-bucket').on('click',function(e){
        e.preventDefault();
        
        $.ajax({
			url: "main/modaldetail",
            type: "POST",
            data: {
                
            },
            success: function (data) {
            	
            },
            error : function(){
            	
	        }
		})
        var map = L.map('mapid').setView([51.505, -0.09],  10);
    	L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
    		maxZoom: 18,
    		attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
    			'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
    			'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
    		id: 'mapbox.streets'
    	}).addTo(map);
        
        $('.js-modal-bucket').addClass('show-modal-bucket');
    });

    $('.js-hide-modal').on('click',function(){
        $('.js-modal-bucket').removeClass('show-modal-bucket');
    }); 
    
    /*==================================================================
    [ Show group modal ]*/
    //가져오기 버튼 눌렀을 때
    $('.getBtn').on('click',function(e){ 
        e.preventDefault();
        //$(this).addClass('js-addedlike'); //가져오기 버튼 색깔 바뀌게
        var selectedbucket_id = $(this).data("id");
        var image = "bucket/"+$(this).data("image");
        var title, content, address, lat, lng;
        var tags = [];
        $.ajax({
            url: 'searchbucket/get',
            type: "POST",
            data: {
            	selectedbucket_id : selectedbucket_id
            },
            success: function (result) {
            	console.log(result.tags);
            	title = result.title;
            	content = result.content;
            	tags = result.tags;
            	$.each(tags, function(index,value){
            		console.log(index+" "+value.tag_id);
            	});
            	address = result.address;
            	lat = result.lat;
            	lng = result.lng;
            	if(result!=""){
            		$('.js-modal-bucket2').addClass('show-modal-bucket');
            		$('input[name=title]').attr('value',title);
            		$('img#imagePath').attr('src',image);
            		$('input[name=content]').attr('value',content);
            		$('input[name=address]').attr('value',address);
            		$('input[name=lat]').attr('value',lat);
            		$('input[name=lng]').attr('value',lng);
            	}else{
            		window.location.href = "loginmain";
            	}
            },
            error : function(request, status, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:");
			}
        });
    });
    
    //가져오기 닫기버튼
    $('.js-hide-modal').on('click',function(){
        $('.js-modal-bucket2').removeClass('show-modal-bucket');
    });
    
})(jQuery);