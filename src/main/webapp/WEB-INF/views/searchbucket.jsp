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
	<link rel="stylesheet" type="text/css" href="vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.css">
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
			                                 	<img id="${vo.selectedbucket_id }" class="js-show-modal-bucket" src="images/bucket/${ vo.image_path }" alt="IMG-PRODUCT">
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
												<button class="fs-23 cl4 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addlike tooltip100" data-tooltip="가져오기">
			                                    	<i data-id="${vo.bucket_id}" id="${vo.selectedbucket_id}" class="js-show-modal-get fa fa-plus-square"></i> 
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
	
	<%@ include file="modal.jsp" %>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>
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
<!--===============================================================================================-->
	<!-- Youtube api -->	
	<script src="js/app.js"></script>
    <script src="https://apis.google.com/js/client.js?onload=init"></script>
</body>
</html>