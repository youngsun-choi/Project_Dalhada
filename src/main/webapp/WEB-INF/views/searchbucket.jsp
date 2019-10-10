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
	<link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css"
   integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
   crossorigin=""/>
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

	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-t-30"> <!-- style="background-image: url('images/bg-02.jpg');" -->
		<ul id="results"></ul>
	</section>	


	<!-- Content page -->
	<section class="bg0 p-t-30 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-0-lg p-r-45">
						<!-- 검색결과 시작 -->   
						<c:if test="${ !empty searchList }">
	                  		<div class="row isotope-grid">
		                     	<c:forEach var="vo" items="${searchList}">
		                        	<div class="item-slick2 p-l-10 p-r-10 p-t-10 p-b-10 isotope-item women"> <!-- col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women -->
			                           	<!-- Block2 -->
			                           	<div class="block2">
			                             	 <a class="block3-img flex-c-m trans-04"> <!-- hov-img0  p-lr-15 -->
			                                 	<img class="js-show-modal-bucket" src="images/bucket/${ vo.image_path }" alt="IMG-PRODUCT">
			                              	</a>
			            
			            					<div class="block2-txt flex-w flex-t p-t-14"> <!-- p-t-14 -->
												<div class="block3-txt-child1 flex-col-l">
													<a id="${vo.selectedbucket_id }" class="js-show-modal-bucket stext-104 cl4 hov-cl1 trans-04 p-b-6">
														${vo.title }
													</a>
												</div>
											</div>
											<div class="flex-r-m"><!-- bor9 --><!-- p-r-10 m-r-11 -->
												<button id="${vo.selectedbucket_id}" class="heart fs-23 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addlike ${vo.className } tooltip100" data-tooltip="좋아요">
			                                    	<i class="zmdi zmdi-favorite"></i> 
			                                 	</button>
												<button data-id="${vo.selectedbucket_id}" data-image="${vo.image_path}" class="fs-23 cl4 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addlike tooltip100" data-tooltip="가져오기">
			                                    	<i class="fa fa-plus-square"></i> 
			                                 	</button>  
											</div>
			                           </div>
		                        	</div>
		                     	</c:forEach>
	               			</div>
		               		<!-- 페이징 시작 -->
							<c:if test="${!empty listCnt }">
								<div class="flex-c-m flex-w w-full p-t-10 m-lr--7">
									<c:if test="${pagination.curPage ne 1 }">
										<a href="${pageContext.request.contextPath}/searchbucket?curPage=1" class="flex-c-m how-pagination1 trans-04 m-all-7">
											<<
										</a>
									</c:if>
									<c:if test="${pagination.curPage ne 1}">
										<a href="${pageContext.request.contextPath}/searchbucket?curPage=${pagination.prevPage}" class="flex-c-m how-pagination1 trans-04 m-all-7">
											<
										</a>
									</c:if>
									<c:forEach var="pageNum" begin="${ pagination.startPage }"
										end="${pagination.endPage }">
										<c:choose>
											<c:when test="${pageNum eq  pagination.curPage}">
												<a href="${pageContext.request.contextPath}/searchbucket?curPage=${pageNum}" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1">
												${pageNum}</a>
											</c:when>
											<c:otherwise>
												<a href="${pageContext.request.contextPath}/searchbucket?curPage=${pageNum}" class="flex-c-m how-pagination1 trans-04 m-all-7">
												${pageNum}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if
										test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
										<a href="${pageContext.request.contextPath}/searchbucket?curPage=${pagination.nextPage}" class="flex-c-m how-pagination1 trans-04 m-all-7">
											>
										</a>
									</c:if>
									<c:if test="${pagination.curPage ne pagination.pageCnt }">
										<a href="${pageContext.request.contextPath}/searchbucket?curPage=${pagination.pageCnt}" class="flex-c-m how-pagination1 trans-04 m-all-7">
											>>
										</a>
									</c:if>
								</div>
							</c:if>
							<!-- 페이징 끝 -->
	               		</c:if>
		                <c:if test="${ empty searchList }">
		                  	<h2 class="txt-center">'${keyword}'에 대한 검색결과가 없습니다.</h2>
		                </c:if>  	
                  		<!-- 검색결과 끝 -->   
					</div>
				</div>
				
	
				<!-- 블로그 리뷰, 태그 시작 -->
				<div class="col-md-4 col-lg-3 p-b-80">
					<div class="side-menu">
						<div>
							<h4 class="mtext-112 cl2 p-b-33">
								Blogs
							</h4>

							<ul>
								<c:if test="${!empty naverBlogList}">
									<c:forEach var="vo" items="${naverBlogList}">
										<li class="bor18">
											<a href="${vo.link}" target="_blank" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
												${vo.title}
											</a>
										</li>
									</c:forEach>
								</c:if>
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
										<a href="${pageContext.request.contextPath}/searchbucket?searchTag=${tList.name}" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
											#${tList.name}
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
	
	<!-- Detail Modal -->
	<div class="wrap-modal-bucket js-modal-bucket p-t-60 p-b-20 font-DoHyeon">
		<div class="overlay-modal js-hide-modal-bucket"></div>

		<div class="container">
			<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal-bucket">
					<img src="images/icons/icon-close.png" alt="CLOSE">
				</button>

				<div class="row">
					<div id="left" class="col-md-6">
						<div class="p-l-25 p-r-30 p-lr-0-lg">
							<div class="wrap-slick3 flex-sb flex-w">
								<h4 id="bucket_title"class="mtext-105 cl2 p-b-14">
								</h4>
								<div class="gallery-lb">
									<div>
										<div class="pos-relative txt-center">
											<img class="modal_image" alt="IMG-PRODUCT">

											<a id="modal_image_expand" class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" >
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
							<div id="bucket_content" class="stext-102 cl3 p-t-23"></div>
							<div class="flex-m p-r-10 m-r-11 cl3">
								<a class="modal_heart fs-23 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addlike tooltip100" data-tooltip="Add to Like">
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
					
					<div id="right" class="col-md-6">
						<div class="p-r-50 p-t-5 p-lr-0-lg">
						<div class="stext-102 cl3 p-t-23">태그</div>
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
			<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal-create">
					<img src="images/icons/icon-close.png" alt="CLOSE">
				</button>				
					<div class="row p-all-10">
						<div id="left" class="col-md-6">
							<input type="text" id="title" class="form-control mb-4" placeholder="제목" maxlength="30">
				            <div class="file-field">
				              <div class="mb-4 txt-center"><!--image field-->
				                <img id="image" class="createimage " src="https://mdbootstrap.com/img/Photos/Others/placeholder.jpg"
				                  alt="example placeholder">
				              </div>
				              <div class="d-flex justify-content-center"><!--upload button-->
				                  <input type="file" id="inputimage" class="file-btn" onchange="readURL(this);" accept=".png, .jpg, .jpeg">
				              </div>
				            </div>
				            <textarea id="content" class="md-textarea form-control" rows="2" placeholder="내용"></textarea>		
							<div class="keep_login_container">
		                    	<div class="stext-102 cl3 p-t-23">태그</div>
		                    	<div id="create-dom" class="flex-w m-r--5"></div>
		                	</div>
					    </div>
					    <div id="right" class="col-md-6">
			                <div class="stext-102 cl3 p-t-10 mb-1">그룹</div>
					        <select id="groups-dom" class="browser-default custom-select mb-3"></select>
			            	<div class="stext-102 cl3 p-t-10">d-Day</div>
			                <input id="d-day" type="text" name="date" placeholder="Select Date.." data-input>
			                <div class="stext-102 cl3 p-t-23">위치</div>
			                <div class="mapid"></div>
			                <div class="warntest"></div>
							<div class="txt-center">
	       						<button id="create-submit" class="button-modal cl0 bg10">생성</button>
							    <button class="js-hide-modal-create button-modal cl13 bg0 btn-bd" data-dismiss="modal">취소</button>
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
	<script src="vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/sweetalert/sweetalert.min.js"></script>
<!--===============================================================================================-->
	<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"
   integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og=="
   crossorigin=""></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
<!--===============================================================================================-->
	<!-- Youtube api -->	
	<script src="js/app.js"></script>
    <script src="https://apis.google.com/js/client.js?onload=init"></script>
</body>
</html>