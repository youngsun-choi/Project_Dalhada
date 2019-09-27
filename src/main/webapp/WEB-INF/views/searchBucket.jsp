<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
	<link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
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
						<form class="form-inline flex-c-m h-full p-r-24" action="searchBucket" method="get">
	    					<div class="bor17 of-hidden pos-relative">
								<input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="searchKeyword" placeholder="Search" value="${ keyword }">
								<button type="submit" class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04" >
									<i class="zmdi zmdi-search"></i>
								</button>
							</div>
  						</form>
						<div class="flex-c-m h-full p-r-24">
							<a>버킷 +</a>
						</div>
						<div class="flex-c-m h-full p-r-24">
							<a href="memberForm">회원가입</a>
						</div>
						<div class="flex-c-m h-full p-r-24">
							<a href="loginmain">로그인</a>
						</div>	
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
					<form class="form-inline" action="searchBucket" method="get">
	    					<div class="bor17 of-hidden pos-relative">
								<input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="searchKeyword" placeholder="Search" value="${ keyword }">
								<button type="submit" class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04" >
									<i class="zmdi zmdi-search"></i>
								</button>
							</div>
  					</form>
				</li>
				<li>
					<a>버킷 +</a>
				</li>
				<li>
					<a href="memberForm">회원가입</a>
				</li>
				<li>
					<a href="login">로그인</a>
				</li>
			</ul>
		</div>
		<!-- Menu Mobile End -->
	</header>
	<!-- Header End -->

	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bg-02.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			동영상
		</h2>
	</section>	


	<!-- Content page -->
	<section class="bg0 p-t-62 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-45 p-r-0-lg"> 
						<!-- 검색결과 시작 -->	
						<div class="row isotope-grid">
						<c:if test="${ !empty searchList }">
							<c:forEach var="vo" items="${searchList}">
								<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
									<!-- Block2 -->
									<div class="block2">
										<div class="block2-pic hov-img0">
											<img class="js-show-modal-bucket"src="bucket/${ vo.image_path }" alt="IMG-PRODUCT">
										</div>
				
										<div class="block2-txt flex-w flex-t p-t-14">
											<div class="block2-txt-child1 flex-col-l ">
												<a href="#" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
													${ vo.title }
												</a>
											</div>
										</div>
										<div class="flex-r-m bor9 "><!-- p-r-10 m-r-11 -->
											<a id="${vo.selectedbucket_id}" class="heart fs-23 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addlike ${vo.className } tooltip100" data-tooltip="좋아요">
												<i class="zmdi zmdi-favorite"></i> 
											</a>
											<c:if test="${!empty status}"> <!-- 로그인 후 -->
												<a href="#" class="fs-23 cl4 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 tooltip100 js-show-modal1" data-tooltip="가져오기">
													<i class="fa fa-plus-square fs-23"></i> 
												</a>
											</c:if>
											<c:if test="${empty status}"> <!-- 로그인 전 -->
												<a href="#" class="fs-23 cl1 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 tooltip100" data-tooltip="가져오기">
													<i class="fa fa-plus-square fs-23"></i> 
												</a>
											</c:if>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
						<!-- 검색결과 끝 -->	
						
						<!-- 페이징 시작 -->
						<c:if test="${!empty listCnt }">
							<div class="flex-c-m flex-w w-full p-t-10 m-lr--7">
								<c:if test="${pagination.curPage ne 1 }">
									<a href="${pageContext.request.contextPath}/searchBucket?curPage=1" class="flex-c-m how-pagination1 trans-04 m-all-7">
										<<
									</a>
								</c:if>
								<c:if test="${pagination.curPage ne 1}">
									<a href="${pageContext.request.contextPath}/searchBucket?curPage=${pagination.prevPage}" class="flex-c-m how-pagination1 trans-04 m-all-7">
										<
									</a>
								</c:if>
								<c:forEach var="pageNum" begin="${ pagination.startPage }"
									end="${pagination.endPage }">
									<c:choose>
										<c:when test="${pageNum eq  pagination.curPage}">
											<a href="${pageContext.request.contextPath}/searchBucket?curPage=${pageNum}" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1">
											${pageNum}</a>
										</c:when>
										<c:otherwise>
											<a href="${pageContext.request.contextPath}/searchBucket?curPage=${pageNum}" class="flex-c-m how-pagination1 trans-04 m-all-7">
											${pageNum}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if
									test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
									<a href="${pageContext.request.contextPath}/searchBucket?curPage=${pagination.nextPage}" class="flex-c-m how-pagination1 trans-04 m-all-7">
										>
									</a>
								</c:if>
								<c:if test="${pagination.curPage ne pagination.pageCnt }">
									<a href="${pageContext.request.contextPath}/searchBucket?curPage=${pagination.pageCnt}" class="flex-c-m how-pagination1 trans-04 m-all-7">
										>>
									</a>
								</c:if>
							</div>
						</c:if>
						<!-- 페이징 끝 -->
					</div>
				</div>
				
	
				<!-- 블로그 리뷰, 태그 시작 -->
				<div class="col-md-4 col-lg-3 p-b-80">
					<div class="side-menu">
						<div>
							<h4 class="mtext-112 cl2 p-b-33">
								블로그 리뷰1
							</h4>

							<ul>
								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										Fashion
									</a>
								</li>

								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										Beauty
									</a>
								</li>

								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										Street Style
									</a>
								</li>

								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										Life Style
									</a>
								</li>

								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										DIY & Crafts
									</a>
								</li>
							</ul>
						</div>

						<div class="p-t-65">
							<h4 class="mtext-112 cl2 p-b-33">
								블로그 리뷰2
							</h4>

							<ul>
								<li class="flex-w flex-t p-b-30">
									<a href="#" class="wrao-pic-w size-214 hov-ovelay1 m-r-20">
										<img src="images/product-min-01.jpg" alt="PRODUCT">
									</a>

									<div class="size-215 flex-col-t p-t-8">
										<a href="#" class="stext-116 cl8 hov-cl1 trans-04">
											White Shirt With Pleat Detail Back
										</a>

										<span class="stext-116 cl6 p-t-20">
											$19.00
										</span>
									</div>
								</li>

								<li class="flex-w flex-t p-b-30">
									<a href="#" class="wrao-pic-w size-214 hov-ovelay1 m-r-20">
										<img src="images/product-min-02.jpg" alt="PRODUCT">
									</a>

									<div class="size-215 flex-col-t p-t-8">
										<a href="#" class="stext-116 cl8 hov-cl1 trans-04">
											Converse All Star Hi Black Canvas
										</a>

										<span class="stext-116 cl6 p-t-20">
											$39.00
										</span>
									</div>
								</li>

								<li class="flex-w flex-t p-b-30">
									<a href="#" class="wrao-pic-w size-214 hov-ovelay1 m-r-20">
										<img src="images/product-min-03.jpg" alt="PRODUCT">
									</a>

									<div class="size-215 flex-col-t p-t-8">
										<a href="#" class="stext-116 cl8 hov-cl1 trans-04">
											Nixon Porter Leather Watch In Tan
										</a>

										<span class="stext-116 cl6 p-t-20">
											$17.00
										</span>
									</div>
								</li>
							</ul>
						</div>

						<div class="p-t-50">
							<h4 class="mtext-112 cl2 p-b-27">
								Tags
							</h4>
							<!-- 태그명 찾기 -->
							<div class="flex-w m-r--5">
								<c:if test="${ !empty tagNameList }">
									<c:forEach var="tList" items="${tagNameList}">
										<a href="${pageContext.request.contextPath}/searchBucket?tagName=${tList}" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
											#${tList}
										</a>
									</c:forEach>
								</c:if> 
							</div>
						</div>
					</div>
				</div>
				<!-- 블로그 리뷰, 태그 끝 -->
			</div>
		</div>
	</section>	
	
		

	<!-- Footer -->
	<footer class="bg3 p-t-75 p-b-32">
	</footer>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>
	
	<!-- 그룹 Modal -->
	<div class="wrap-modal1-group js-modal-bucket p-t-60 p-b-20">
		<div class="overlay-modal1 js-hide-modal"></div>

		<div class="container">
			<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal">
					<img src="images/icons/icon-close.png" alt="CLOSE">
				</button>

				<div class="row">
					<div class="col-md-6 col-lg-5 p-b-30">
						<div class="p-r-50 p-t-5 p-lr-0-lg">
							<h4 class="mtext-105 cl2 js-name-detail p-b-14">
								그룹선택
							</h4>
							
							<!--  -->
							<div class="p-t-33">
								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">
										Size
									</div>

									<div class="size-204 respon6-next">
										<div class="rs1-select2 bor8 bg0">
											<select class="js-select2" name="time">
												<c:if test="${ !empty groupNameList }">
													<c:forEach var="gList" items="${groupNameList}">
														<option>${gList}</option>
													</c:forEach>
												</c:if> 
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>

								<div class="flex-w flex-r-m p-b-10">
									<div class="size-204 flex-w flex-m respon6-next">
										<button onclick="clickGetBtn" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
											확인
										</button>
										<button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
											취소
										</button>
									</div>
								</div>	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 그룹 Modal 끝 -->

		<!-- Modal -->
	<div class="wrap-modal-bucket js-modal-bucket p-t-60 p-b-20">
		<div class="overlay-modal js-hide-modal"></div>

		<div class="container">
			<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal">
					<img src="images/icons/icon-close.png" alt="CLOSE">
				</button>

				<div class="row">
					<div class="col-md-6 col-lg-7 p-b-30">
						<div class="p-l-25 p-r-30 p-lr-0-lg">
							<div class="wrap-slick3 flex-sb flex-w">
								<h4 id="bucketTitle"class="mtext-105 cl2 js-name-detail p-b-14">
								</h4>
								<div class="gallery-lb">
									<div data-thumb="images/slide-03.jpg">
										<div class="wrap-pic-w pos-relative">
											<img class="modalimage" src="images/slide-03.jpg" alt="IMG-PRODUCT">

											<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="images/slide-03.jpg">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
							<p id="bucketContent" class="stext-102 cl3 p-t-23">
							</p>
							<div class="flex-m bor9 p-r-10 m-r-11">
								<a id="${vo.selectedbucket_id }" class="heart fs-23 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addlike ${vo.className } tooltip100" data-tooltip="Add to Like">
									<i class="zmdi zmdi-favorite"></i> 
								</a>
								<p id="likecnt" class="cl6 stext-107" style="width: 40px"></p>
								<a href="#" class="fs-23 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist">
									<i class="fa fa-plus-square fa-lg"></i> 
								</a>
								<p id="getcnt" class="cl6 stext-107" style="width: 40px"></p>							
							</div>
						</div>			
					</div>
					
					<div class="col-md-6 col-lg-5 p-b-30">
						<div class="p-r-50 p-t-5 p-lr-0-lg">
						<div class="stext-102 cl3 p-t-23">태그</div>
							<div id="tags" class="flex-w p-t-4 m-r--5">
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
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
<!--===============================================================================================-->
	<script src="vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/sweetalert/sweetalert.min.js"></script>
<!--===============================================================================================-->
	<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"
   integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og=="
   crossorigin=""></script>
   <!--===============================================================================================-->
	<script>
	//가져오기 확인
	function clickGetBtn(){
		$.ajax({
			url : 'searchBucket',
			type : 'POST',
			data : {'bucket_id' : bucket_id,
					'selectedbucket_id' : selectedbucket_id},
			success : function(data){
			},
		    error : function(request, status, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:");
			}
		});
	}
	//가져오기
	/* function clickPlusButton(bucket_id, selectedbucket_id){
		$.ajax({
			url : 'searchBucket',
			type : 'POST',
			data : {'bucket_id' : bucket_id,
					'selectedbucket_id' : selectedbucket_id},
			success : function(data){
			},
		    error : function(request, status, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:");
			}
		});
	} */
	</script>
</body>
</html>