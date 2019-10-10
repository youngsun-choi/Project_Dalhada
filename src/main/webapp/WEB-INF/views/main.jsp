<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>dalhada</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->	
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.css">
<!--===============================================================================================-->
	<link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css"
	   integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
	   crossorigin=""/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body class="animsition">
	<!-- Header -->
	<header class="header-v2">
		<!-- Header desktop -->
		<div class="container-menu-desktop trans-03">
			<div class="wrap-menu-desktop">
				<nav class="limiter-menu-desktop p-l-45">
					
					<!-- Logo desktop -->		
					<a href="main" class="logo">
						<img src="images/icons/logo-01.png" alt="IMG-LOGO">
					</a>
					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m h-full">
						<form id="searchForm" class="form-inline flex-c-m h-full p-r-24" action="searchbucket" method="get">
	    					<div class="bor17 of-hidden pos-relative">
								<input class="searchKeyDown stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" 
								name="searchKeyword" placeholder="Search" value="${ keyword }" autocomplete="off">
								<button type="submit" class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04" >
									<i class="zmdi zmdi-search"></i>
								</button>
							</div>
  						</form>
						<c:if test="${empty sessionScope.id}">
							<div class="flex-c-m h-full p-r-24">
								<a href="memberform">회원가입</a>
							</div>
							<div class="flex-c-m h-full p-r-24">
								<a href="loginmain">로그인</a>
							</div>	
						</c:if>
						<c:if test="${!empty sessionScope.id}">
							<div class="flex-c-m h-full p-r-24">
								<p class="js-show-modal-create hov-cl1">버킷 +</p>
							</div>
							<div class="flex-c-m h-full p-r-24">
								<a href="mypage">마이페이지</a>
							</div>
							<div class="flex-c-m h-full p-r-24">
								<a href="logout">로그아웃</a>
							</div>
						</c:if>
					</div>
				</nav>
			</div>	
		</div>
		<!-- Header desktop End -->

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->		
			<div class="logo-mobile">
				<a href="main"><img src="images/icons/logo-01.png" alt="IMG-LOGO"></a>
			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
			</div>
		</div>
		<!-- Header Mobile End -->

		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="main-menu-m">
				<li>
					<form id="searchForm" class="form-inline" action="searchbucket" method="get">
	    					<div class="bor17 of-hidden pos-relative">
								<input class="searchKeyDown stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" 
								name="searchKeyword" placeholder="Search" value="${ keyword }" autocomplete="off">
								<button type="submit" class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04" >
									<i class="zmdi zmdi-search"></i>
								</button>
							</div>
  					</form>
				</li>
				<c:if test="${empty sessionScope.id}">
					<li>
						<a href="memberForm">회원가입</a>
					</li>
					<li>
						<a href="loginmain">로그인</a>
					</li>
				</c:if>
				<c:if test="${!empty sessionScope.id}">
					<li>
						<a class="js-show-modal-create hov-cl1">버킷+</a>
					</li>
					<li>
						<a href="memberForm">마이페이지</a>
					</li>
					<li>
						<a href="loginmain">로그아웃</a>
					</li>
				</c:if>
			</ul>
		</div>
		<!-- Menu Mobile End -->
	
	</header>
	<!-- Header End -->

	<!-- Bucket -->
	<section class="sec-product bg0 p-t-25 p-b-20">
		<div class="container">
			<div class="p-b-5">
				<h3 class="ltext-90 cl5 respon1">
					인기순 버킷
				</h3>
			</div>
			<!-- Tab01 -->
			<div class="tab01">
				<!-- Tab panes -->
				<div class="tab-content p-t-5">
					<!-- - -->
					<div class="tab-pane fade show active" id="best-seller" role="tabpanel">
						<!-- Slide2 -->
						<div class="wrap-slick2">
							<div class="slick2">
							<c:forEach var="vo" items="${TOPlist}">
								<div class="item-slick2 p-l-15 p-r-15">
									<!-- Block2 -->
									<div class="block2">
										<div class="block2-wrap">
											<a class="block2-img flex-c-m p-lr-15 trans-04">
												<img id="${vo.selectedbucket_id }"  class="js-show-modal-bucket " src="images/bucket/${vo.image_path }" alt="IMG-PRODUCT">
											</a>
										</div>
										<div class="block2-txt flex-w flex-t p-t-14">
											<div class="block2-txt-child1 flex-col-l ">
												<a id="${vo.selectedbucket_id }" class="js-show-modal-bucket stext-104 cl4 hov-cl1 trans-04 p-b-6">
													${vo.title }
												</a>
											</div>
											
											<div class="block2-txt-child2 flex-r p-t-3">
												<a id="${vo.selectedbucket_id }" class="heart fs-23 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addlike ${vo.className } tooltip100" data-tooltip="Add to Like">
													<i class="zmdi zmdi-favorite"></i> 
												</a>
												<button class="fs-23 cl4 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addlike tooltip100" data-tooltip="가져오기">
			                                    	<i data-id="${vo.bucket_id}" id="${vo.selectedbucket_id}" class="js-show-modal-get fa fa-plus-square"></i> 
			                                 	</button> 
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer class="bg3 p-t-75 p-b-32">

	</footer>

	<!-- Detail Modal -->
	<div class="wrap-modal-bucket js-modal-bucket p-t-60 p-b-20">
		<div class="overlay-modal js-hide-modal-bucket"></div>

		<div class="container">
			<div class="bg0 p-t-30 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal-bucket">
					<img src="images/icons/icon-close.png" alt="CLOSE">
				</button>

				<div class="row">
					<div id="left" class="col-md-6">
						<div class="p-l-25 p-r-30 p-lr-0-lg">
							<div class="wrap-slick3 flex-sb flex-w">
								<h4 id="bucket_title"class="ltext-107 cl2 p-b-14"></h4>
								<div class="gallery-lb">
									<div class="pos-relative txt-center">
										<img class="modal_image" id="detail_image" alt="IMG-PRODUCT">
										<a id="modal_image_expand" class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" >
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
							</div>
							<div id="bucket_content" class="mtext-110 cl3 p-t-23 p-b-23"></div>
							<div class="flex-m p-r-10 m-r-11 cl3">
								<a class="modal_heart fs-23 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addlike tooltip100" data-tooltip="Add to Like">
									<i class="zmdi zmdi-favorite"></i>
								</a>
								<p id="likecnt" class="cl6 stext-107" style="width: 40px"></p>
								<a href="#" class="fs-23 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist">
									<i class="fa fa-plus-square fa-lg"></i> 
								</a>						
							</div>
						</div>			
					</div>
					
					<div id="right" class="col-md-6">
						<div class="p-r-50 p-t-5 p-lr-0-lg">
							<div class="stext-102 cl3 p-t-40">태그</div>
							<div id="detail_tags" class="flex-w p-t-4 m-r--5">
			                </div>
			                <div class="stext-102 cl3 p-t-23">위치</div>
						    <div id = 'mapid'>
							</div>
						 </div>
							<!--  -->
							<div class="flex-w flex-m p-l-100 p-t-40 respon7">
								
								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook">
									<i class="fa fa-facebook"></i>
								</a>

								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter">
									<i class="fa fa-twitter"></i>
								</a>

								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Google Plus">
									<i class="fa fa-google-plus"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	<!-- Create Modal -->
	<div class="wrap-modal-bucket js-modal-create p-t-60 p-b-20 font-DoHyeon">
		<div class="overlay-modal js-hide-modal-create"></div>

		<div class="container">			
			<div class="bg0 p-t-30 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal-create">
					<img src="images/icons/icon-close.png" alt="CLOSE">
				</button>				
					<div class="row p-all-10">
						<div class="col-md-6">
							<input type="text" id="create-title" class="form-control mb-4" placeholder="제목" maxlength="30">
				            <div class="image-field">
				              <div class="mb-4 txt-center"><!--image field-->
				                <img id="image" class="createimage " src="https://mdbootstrap.com/img/Photos/Others/placeholder.jpg"
				                  alt="example placeholder">
				              </div>
				              <div class="d-flex justify-content-center"><!--upload button-->
				                  <input type="file" id="inputimage" class="file-btn" onchange="readURL(this);" accept=".png, .jpg, .jpeg">
				              </div>
				            </div>
				            <textarea id="create_content" class="md-textarea form-control p-t-10" rows="2" placeholder="내용"></textarea>		
							<div class="keep_login_container">
		                    	<div class="stext-102 cl3 p-t-23">태그</div>
		                    	<div id="create-tag-dom" class="flex-w m-r--5"></div>
		                	</div>
					    </div>
					    <div class="col-md-6">
			                <div class="stext-102 cl3 p-t-40 mb-1">그룹</div>
					        <select id="create-groups-dom" class="browser-default custom-select mb-3"></select>
			            	<div class="stext-102 cl3 p-t-10">d-Day</div>
			                <input id="create-d-day" class="d-day" type="text" name="date" placeholder="Select Date.." data-input>
			                <div class="stext-102 cl3 p-t-23">위치</div>
			                <div class="mapid"></div>
			                <div class="create-warntest"></div>
							<div class="txt-center">
	       						<button id="create-submit" class="button-modal cl0 bg10">생성</button>
							    <button class="js-hide-modal-create button-modal cl13 bg0 btn-bd" data-dismiss="modal">취소</button>
						    </div>
			            </div>
					</div>
			</div>
		</div>				
	</div>

	<!-- Edit Modal -->
	<div class="wrap-modal-bucket js-modal-edit p-t-60 p-b-20 font-DoHyeon">
		<div class="overlay-modal js-hide-modal-edit"></div>

		<div class="container">			
			<div class="bg0 p-t-30 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal-edit">
					<img src="images/icons/icon-close.png" alt="CLOSE">
				</button>				
					<div class="row p-all-10">
						<div class="col-md-6">
							<input type="text" id="edit_title" class="form-control mb-4" maxlength="30">
				            <div class="gallery-lb">
								<div class="pos-relative txt-center">
									<img class="modal_image" id="edit_image" alt="IMG-PRODUCT">
									<a id="modal_image_expand" class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" >
										<i class="fa fa-expand"></i>
									</a>
								</div>
							</div>
				            <textarea id="edit_content" class="md-textarea form-control p-t-10" rows="2"></textarea>		
							<div class="keep_login_container">
		                    	<div class="stext-102 cl3 p-t-23">태그</div>
		                    	<div id="edit-tag-dom" class="flex-w m-r--5"></div>
		                	</div>
					    </div>
					    <div class="col-md-6">
			                <div class="stext-102 cl3 p-t-40 mb-1">그룹</div>
					        <select id="edit-groups-dom" class="browser-default custom-select mb-3"></select>
			            	<div class="stext-102 cl3 p-t-10">d-Day</div>
			                <input id="edit-d-day" class="d-day" type="text" name="date" placeholder="Select Date.." data-input>
			                <div class="stext-102 cl3 p-t-23">위치</div>
			                <div class="mapid"></div>
			                <div class="edit-warntest"></div>
							<div class="txt-center">
								<input type="hidden" id="editedbucket_id"/>
	       						<button id="edit-submit" class="button-modal cl0 bg10">수정</button>
							    <button class="js-hide-modal-edit button-modal cl13 bg0 btn-bd" data-dismiss="modal">취소</button>
						    </div>
			            </div>
					</div>
			</div>
		</div>				
	</div>
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>
<!--===============================================================================================-->
	<script src="vendor/slick/slick.min.js"></script>
	<script src="js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
<!--===============================================================================================-->
	<script src="vendor/isotope/isotope.pkgd.min.js"></script>
<!--=================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<!--===============================================================================================-->
	<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"
   integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og=="
   crossorigin=""></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
	<script>
	    function readURL(input) {
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();
	            reader.onload = function (e) {
	                $('#image').attr('src', e.target.result);
	            };
	            reader.readAsDataURL(input.files[0]);
	        }
	    }
	</script>
</body>
</html>