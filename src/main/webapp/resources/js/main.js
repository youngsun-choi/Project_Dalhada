
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
        if($('.js-show-filter').hasClass('show-filter')) {
            $('.js-show-filter').removeClass('show-filter');
            $('.panel-filter').slideUp(400);
        }    
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
	                    selectedbucket_id : $(this).attr('data-id'),
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
    var map_detail;
    $('.js-show-modal-bucket').on('click',function(e){
        e.preventDefault();
        $.ajax({
			url: "main/modaldetail",
            type: "POST",
            data: {"selectedbucket_id": $(this).attr('data-id')},
            success: function (data) {
            	$('#bucket_title').html(data.title);
            	$('#get_member_id').html("<a>"+data.get_member_id+"</a>"+"'s");
            	$('#by_member_id').html("by. "+"<a>"+data.by_member_id+"</a>");
            	$('#detail_image').attr("src", "images/bucket/"+data.bucketImage_path);
            	$('#modal_image_expand').attr("href", "images/bucket/"+data.bucketImage_path);
            	$('#bucket_content').text(data.content);
            	$('.detail_content').perfectScrollbar({theme: 'mytheme'});
            	$('#detail_address').html(data.address);
            	var tags = data.tags;
            	var tagdom = $('#detail_tags');
            	tagdom.html("");
            	for(var i=0; i<tags.length; i++)
            		tagdom.append('<button type="button" class="modal-tag modal-tag-detail flex-c-m stext-107 size-301 p-lr-15 trans-04 m-r-5 m-b-5">#'+tags[i]+'</button>');
            	$('#detail_address').html(data.address);
            	var flag = data.lat+data.lng!=0?true:false;
            	var latlng = flag?[data.lat, data.lng]:[37.566, 126.978];
            	map_detail = L.map('mapid_detail').setView(latlng, 13);
        		L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
        			maxZoom: 18,
        			attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
        				'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
        				'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
        			id: 'mapbox.streets'
        		}).addTo(map_detail);
        		if(flag)
        			L.marker([data.lat, data.lng], {icon: L.icon({iconUrl: 'images/flag.svg', iconSize: [35,35]})}).addTo(map_detail);
            	
        		$('.modal_get_btn').attr("data-id", data.bucket_id).attr("data-value", data.selectedbucket_id);
            	$('.modal_heart').attr("data-id", data.selectedbucket_id).addClass(data.className).on('click', function(){
    				var action;
    				var cnt = $('#likecnt').text();
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
    	                    selectedbucket_id : $(this).attr('data-id'),
    	                    action : action
    	                },
    	                success: function (data) {
    	                	$('#likecnt').text(data);
    	                	if(data==-1)
    	                		window.location.href = "loginmain";
    	                }
    				})
    			});;
            	$('#likecnt').text(data.like_cnt);
            }
		})
        
        $('.js-modal-bucket').addClass('show-modal-bucket');
    });
    $('.js-hide-modal-bucket').on('click',function(){
    	map_detail.remove();
        $('.js-modal-bucket').removeClass('show-modal-bucket');
        if($('.modal_heart').hasClass('js-addedlike')){
        	$('.modal_heart').removeClass('js-addedlike');
        	$('#heart'+$('.modal_heart').attr('data-id')).addClass('js-addedlike');
        }else{
        	$('#heart'+$('.modal_heart').attr('data-id')).removeClass('js-addedlike');
        }
        $('.modal_heart').off();
    }); 
    
    /*==================================================================
    [ Show create modal ]*/
	var map_create;
	var lat = 0.0;
	var lng = 0.0;
    $('.js-show-modal-create').on('click',function(e){ 	
    	e.preventDefault();
	    $.ajax({
	    	url: "main/getgrouptag",
	        type: "POST",
	        success: function (data) {
	         	var groups = data[0];
	           	var tags = data[1];
	           	var groupdom = $("#create-groups-dom");
	           	groupdom.append("<option value='0'>-----------</option>")
	           	for(var i = 0; i < groups.length; i++ ){
	           		groupdom.append("<option value='"+groups[i].id+"'>"+groups[i].name+"</option>");
	           	}
	           	var tagdom = $("#create-tag-dom");
	           	for(var i=0; i<tags.length; i++)
	           		tagdom.append('<button type="button" value="'+tags[i].id+'" class="create-modal-tag flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">#'+tags[i].name+'</button>');	            	
	           	tag_click($('.create-modal-tag'));
	           	$("#create-d-day").flatpickr({
        		    dateFormat: "Y.m.d"
        		});
	           	map_create = L.map('mapid_create').setView([37.566, 126.978], 5);
	    		L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
	    			maxZoom: 18,
	    			attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
	    				'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
	    				'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
	    			id: 'mapbox.streets'
	    		}).addTo(map_create);
	    		var popup = L.popup().setLatLng([37.566, 126.978]).setContent("지도에서 장소를 선택해보세요.").openOn(map_create);
	    		
	    		var marker;
	    		map_create.on('click', function(e){
	    			if(popup) popup.remove();
	    			if(marker) marker.remove();
	    			var latlng = e.latlng;
	    			lat = latlng.lat;
	    			lng = latlng.lng;
	    			marker = L.marker([lat, lng], {icon: L.icon({iconUrl: 'images/flag.svg', iconSize: [35,35]})}).addTo(map_create);  			
	    		})
	           },
	           error : function(){
	           	console.log("error");
		       }
	    })
			
		$('.js-modal-create').addClass('show-modal-create');
    });
    /*[click create cancel button]*/
    $('.js-hide-modal-create').on('click',function(){
    	clear_createForm();
    	map_create.remove();
    	$('.js-modal-create').removeClass('show-modal-create');
    }); 
    /*[click create submit button]*/
    $('#create-submit').click(function(){
    	var title = $("#create-title").val();
    	var file = $('#input_image')[0].files[0];
    	var content =  $("#create_content").val();	 
		var list = [];
    	$("#create-tag-dom .modal-tag-click").each(function(i){list.push($(this).val());})
    	
    	var msg = '';
    	if(file == undefined)
    		msg += "사진 ";
    	if(title=='')
    		msg += "제목 ";
    	if(content == "")
    		msg += "내용 ";
    	if(msg.length!=0)
    		msg += "이 비어있습니다."
    	if(list.length==0)
    		msg +="태그를 지정해주세요.\n"
    	
    	if(msg.length!=0)
    		$(".create-warntest").text(msg);
    	else{
    		var formData = new FormData();
        	formData.append("title", title);
        	formData.append("content", content);
        	formData.append("taglist", list);
        	formData.append("file", file);
        	formData.append("group_id", parseInt($("#create-groups-dom").val()));
        	formData.append("d_day", $("#create-d-day").val());
        	formData.append("address", $("#create-location").val());
			formData.append("lat", parseFloat(lat));
			formData.append("lng", parseFloat(lng));
        	$.ajax({
				url: "createbucket",
				type:"post",
				processData: false,
                contentType: false,
				data: formData,
				sucess : function(){
					$('.js-modal-create').removeClass('show-modal-create');
				},
				complete : function(){
					clear_createForm();
					map_create.remove();
					$('.js-modal-create').removeClass('show-modal-create');
					window.location.reload(true);
				}
			});
    	}
	});
   
    /*==================================================================
    [ Show edit modal ]*/
    $('.js-show-modal-edit').on('click',function(e){ 	
    	e.preventDefault();
    	var id = $(this).attr('data-id');
	        $.ajax({
				url: "main/geteditinfo",
	            type: "POST",
	            data: {"selectedbucket_id": id},
	            success: function (data) {
	            	var group_list = data.group_list;
	            	var tag_list = data.tag_list;
	            	var my_tags = data.my_tags;
	            	
	            	$("#editedbucket_id").val(id);
	            	$("#edit_title").val(data.title);
	            	$("#edit_image").attr("src", "images/bucket/"+data.image_path);
	            	$("#edit_content").val(data.content);
	            	var groupdom = $("#edit-groups-dom");
	            	groupdom.append("<option value='0'>-----------</option>")
	            	for(var i = 0; i < group_list.length; i++ )
	            		groupdom.append("<option value='"+group_list[i].id+"'>"+group_list[i].name+"</option>");
	            	$('#edit-groups-dom').find('option[value='+data.group_id+']').attr('selected', 'selected');
	            	
	            	var tagdom = $("#edit-tag-dom");
	            	for(var i=0; i<tag_list.length; i++)
	            		tagdom.append('<button type="button" value="'+tag_list[i].id+'" class="edit-modal-tag flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">#'+tag_list[i].name+'</button>');	            	
	            	tag_click($('.edit-modal-tag'));
	            	var my_tags = data.my_tags;
	            	for(var i = 0; i<my_tags.length; i++)
	            		$('#edit-tag-dom').find('button[value='+my_tags[i]+']').removeClass('bor7').addClass('modal-tag-click').removeClass('cl6');
	            	$('#edit-d-day').flatpickr({
	        		    dateFormat: "Y.m.d",
	        		    defaultDate: [data.d_day]
	        		});
	            },
	            error : function(){
	            	console.log("error");
		        }
			})
			
			$('.js-modal-edit').addClass('show-modal-edit');
    });
    /*[click edit cancel button]*/
    $('.js-hide-modal-edit').on('click',function(){
    	clear_form('#edit');
    	$('.js-modal-edit').removeClass('show-modal-edit');
    }); 
    /*[click edit submit button]*/
    $('#edit-submit').click(function(){
    	var title = $("#edit_title").val();
    	var content =  $("#edit_content").val();
		var list = [];
    	$("#edit-tag-dom .modal-tag-click").each(function(i){list.push($(this).val());})
    	
    	var msg = '';
    	
    	if(title=='')
    		msg += "제목 ";
    	if(content == "")
    		msg += "내용 ";
    	if(msg.length!=0)
    		msg += "이 비어있습니다."
    	if(list.length==0)
    		msg +="태그를 지정해주세요.\n"
    			
    	if(msg.length!=0)
    		$("#edit-warntest").text(msg);
    	else{
    		var formData = new FormData();
    		formData.append("selectedbucket_id", $("#editedbucket_id").val());
        	formData.append("title", title);
        	formData.append("content", content);
        	formData.append("taglist", list);
        	formData.append("group_id", parseInt($("#edit-groups-dom").val()));
        	formData.append("d_day", $("#edit-d-day").val());
			$.ajax({
				url: "updatebucket",
				type:"post",
				processData: false,
                contentType: false,
				data: formData,
				complete : function(){
					$('.js-modal-edit').removeClass('show-modal-edit');
					clear_form('#edit');
				}
			});
    	}
	});
    /*==================================================================
    [ Show get modal ]*/
    $('.js-show-modal-get').on('click',function(e){ 	
    	e.preventDefault();
    	var id = $(this).attr("data-id");
	        $.ajax({// 제목 이미지path 내용 태그(전부/버킷's) 그룹(전부/버킷's) 날짜 위도 경도
				url: "main/geteditinfo",
	            type: "POST",
	            data: {"selectedbucket_id": $(this).attr('data-value')}
	            ,
	            success: function (data) {
	            	var group_list = data.group_list;
	            	var tag_list = data.tag_list;
	            	var my_tags = data.my_tags;
	            	
	            	$("#bucket_id").val(id);
	            	$("#get_title").val(data.title);
	            	$("#get_image").attr("src", "images/bucket/"+data.image_path);
	            	$("#get_content").val(data.content);
	            	var groupdom = $("#get-groups-dom");
	            	groupdom.append("<option value='0'>-----------</option>")
	            	for(var i = 0; i < group_list.length; i++ )
	            		groupdom.append("<option value='"+group_list[i].id+"'>"+group_list[i].name+"</option>");
	            	$('#get-groups-dom').find('option[value='+data.group_id+']').attr('selected', 'selected');
	            	
	            	var tagdom = $("#get-tag-dom");
	            	for(var i=0; i<tag_list.length; i++)
	            		tagdom.append('<button type="button" value="'+tag_list[i].id+'" class="get-modal-tag flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">#'+tag_list[i].name+'</button>');	            	
	            	tag_click($('.get-modal-tag'));
	            	var my_tags = data.my_tags;
	            	for(var i = 0; i<my_tags.length; i++)
	            		$('#get-tag-dom').find('button[value='+my_tags[i]+']').removeClass('bor7').addClass('modal-tag-click').removeClass('cl6');
	            	$('#get-d-day').flatpickr({
	        		    dateFormat: "Y.m.d",
	        		    defaultDate: [data.d_day]
	        		});
	            },
	            error : function(){
	            	console.log("error");
		        }
			})
			
			$('.js-modal-get').addClass('show-modal-get');
    });
    /*[click edit cancel button]*/
    $('.js-hide-modal-get').on('click',function(){
    	clear_form('#get');
    	$('.js-modal-get').removeClass('show-modal-get');
    }); 
    /*[click edit submit button]*/
    $('#get-submit').click(function(){
    	var title = $("#get_title").val();
    	var content =  $("#get_content").val();
		var list = [];
    	$("#get-tag-dom .modal-tag-click").each(function(i){list.push($(this).val());})
    	
    	var msg = '';
    	if(title=='')
    		msg += "제목 ";
    	if(content == "")
    		msg += "내용 ";
    	if(msg.length!=0)
    		msg += "이 비어있습니다."
    	if(list.length==0)
    		msg +="태그를 지정해주세요.\n"
    			
    	if(msg.length!=0)
    		$("#get-warntest").text(msg);
    	else{
    		var formData = new FormData();
    		formData.append("selectedbucket_id", parseInt($("#bucket_id").val()));
        	formData.append("title", title);
        	formData.append("content", content);
        	formData.append("tag_id", list);
        	formData.append("group_id", parseInt($("#get-groups-dom").val()));
        	formData.append("d_day", $("#get-d-day").val());
			$.ajax({
				url: "insertgetbucket",
				type:"post",
				processData: false,
                contentType: false,
				data: formData,
				complete : function(){
					$('.js-modal-get').removeClass('show-modal-get');
					clear_form('#get');
					window.location.reload(true);
				}
			});
    	}
	});
})(jQuery);
var clear_createForm = function(){
	$('input').val('');
	$('#create-content').val('');
	$('.createimage').attr("src", "https://mdbootstrap.com/img/Photos/Others/placeholder.jpg");
	if((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1)) {
	 	$("#input_image").replaceWith($("#input_image").clone(true));
	} else {
	   	$("#input_image").val("");
	}
	$('#create-groups-dom').html('');
	$('#create-tag-dom').html('');
	$('#create-d-day').val('');
	$(".create-warntest").text("");
}
var clear_form = function(flag){
	$(flag+'-groups-dom').html('');
	$(flag+'-tag-dom').html('');
	$(flag+'-d-day').val('');
	$(flag+'-tag-dom').html('');
	$(flag+'-location').val('');
	$(flag+"-warntest").text('');
}
var tag_click = function(tags){
	tags.each(function(){
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
