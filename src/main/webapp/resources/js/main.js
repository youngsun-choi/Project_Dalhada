
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
                if($(this).css('display') == 'block') { 
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
					url: "main/like",
	                type: "POST",
	                data: {
	                    selectedbucket_id : $(this).attr("id"),
	                    action : action
	                },
	                success: function (data) {
	                	if(data==-1)
	                		window.location.href = "loginmain";
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
    [ Show detail modal ]*/
    $('.js-show-modal-bucket').on('click',function(e){
        e.preventDefault();
        $.ajax({
			url: "main/modaldetail",
            type: "POST",
            data: {"selectedbucket_id": $(this).attr('id')}
            ,
            success: function (data) {
            	$('#bucket_title').html(data.title);
            	$('.modal_image').attr("src", "images/bucket/"+data.bucketImage_path);
            	$('#modal_image_expand').attr("href", "images/bucket/"+data.bucketImage_path);
            	$('#bucket_content').text(data.content);
            	var tags = data.tags;
            	var tagdom = $('#detail_tags');
            	console.log(tags);
            	for(var i=0; i<tags.length; i++)
            		tagdom.append('<button type="button" class="modal-tag modal-tag-detail flex-c-m stext-107 size-301 p-lr-15 trans-04 m-r-5 m-b-5">#'+tags[i]+'</button>');
            	$('.modal_heart').attr("id", data.bucket_id).addClass(data.className).on('click', function(){
    				var action;
    				if($(this).hasClass('js-addedlike')){
    					$(this).removeClass('js-addedlike');
    					action = "delete";
    				}else{
    					$(this).addClass('js-addedlike');
    					action = "insert";
    				}
    				$.ajax({
    					url: "main/like",
    	                type: "POST",
    	                data: {
    	                    selectedbucket_id : $(this).attr("id"),
    	                    action : action
    	                },
    	                success: function (data) {
    	                	if(data==-1)
    	                		window.location.href = "loginmain";
    	                }
    				})
    				
    			});;
            	$('#likecnt').text(data.like_cnt);
            	$('#getcnt').text(data.like_cnt);
            },
            error : function(){
            	
	        }
		})
        /*var map = L.map('mapid').setView([51.505, -0.09],  10);
    	L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
    		maxZoom: 18,
    		attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
    			'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
    			'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
    		id: 'mapbox.streets'
    	}).addTo(map);*/
        
        $('.js-modal-bucket').addClass('show-modal-bucket');
    });
    $('.js-hide-modal-bucket').on('click',function(){
        $('.js-modal-bucket').removeClass('show-modal-bucket');
        
    }); 
    /*==================================================================
    [ searchKeyDown ]*/
    $('.searchKeyDown').keydown(function(e){ //엔터키 눌렀을 때
    	if(e.keyCode == 13){
    		$('form#searchForm').submit();
    	}
    });
    
    /*==================================================================
    [ Show create modal ]*/
    
    $('.js-show-modal-create').on('click',function(e){ 	
    	e.preventDefault();
	        $.ajax({
				url: "main/getgrouptag",
	            type: "POST",
	            success: function (data) {
	            	var groups = data[0];
	            	var tags = data[1];
	            	var groupdom = $("#groups-dom");
	            	groupdom.append("<option value='0'>-----------</option>")
	            	for(var i = 0; i < groups.length; i++ ){
	            		groupdom.append("<option value='"+groups[i].id+"'>"+groups[i].name+"</option>");
	            	}
	            	var tagdom = $("#create-dom");
	            	for(var i=0; i<tags.length; i++)
	            		tagdom.append('<button type="button" value="'+tags[i].id+'" class="modal-tag flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">#'+tags[i].name+'</button>');	            	
	            	tag_click();
	            },
	            error : function(){
	            	console.log("error");
		        }
			})
			
			$('.js-modal-create').addClass('show-modal-create');
    });
    /*[click cancel button]*/
    $('.js-hide-modal-create').on('click',function(){
    	clearform();
    	$('.js-modal-create').removeClass('show-modal-create');
    }); 
    /*[click submit button]*/
    $('#create-submit').click(function(){
    	var title = $("#title").val();
    	var file = $('input[type=file]')[0].files[0];
    	var content =  $("#content").val();

		var list = [];
    	$(".modal-tag-click").each(function(i){list.push($(this).val());})
    	
    	var msg = '';
    	if(list.length==0)
    		msg+="태그를 지정해주세요.\n"
    	if(title=='')
    		msg = "제목 ";
    	if(file == undefined)
    		msg += "사진 ";
    	if(content == "")
    		msg += "내용 ";
    			
    	if(msg.length!=0)
    		$(".warntest").text(msg+"이 없습니다.");
    	else{
    		var formData = new FormData();
        	formData.append("title", title);
        	formData.append("content", content);
        	formData.append("taglist", list);
        	formData.append("file", file);
        	formData.append("g_id", $("#groups-dom").val());
        	formData.append("d_day", $("#d-day").val());
			$.ajax({
				url: "createbucket",
				type:"post",
				processData: false,
                contentType: false,
				data: formData
				,
				sucess : function(){
					$('.js-modal-create').removeClass('show-modal-create');
				},
				complete : function(){
					clearform();
					$('.js-modal-create').removeClass('show-modal-create');
				}
			});
    	}
	});
})(jQuery);

var clearform = function(){
	$('input').val('');
	$('#content').val('');
	$('.createimage').attr("src", "https://mdbootstrap.com/img/Photos/Others/placeholder.jpg");
	if((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1)) {
	 	$("inputimage").replaceWith($("inputimage").clone(true));
	} else {
	   	$("inputimage").val("");
	}
	$('#groups-dom').find('option:first').attr('selected', 'selected');
	$('.modal-tag').each(function(){
		$(this).addClass('bor7');
        $(this).removeClass('modal-tag-click');
        $(this).addClass('cl6');
		});
}
var tag_click = function(){
	$('.modal-tag').each(function(){
		$(this).on('click',function(){
			if($(this).hasClass('modal-tag-click')){
				$(this).addClass('bor7');
        		$(this).removeClass('modal-tag-click');
        		$(this).addClass('cl6');
			}else{
				$(this).removeClass('cl6');
        		$(this).removeClass('bor7');
        		$(this).addClass('modal-tag-click');
			}
		});
	})
}
