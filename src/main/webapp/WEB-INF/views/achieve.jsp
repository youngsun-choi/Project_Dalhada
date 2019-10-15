<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>dalhada</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<script>document.getElementsByTagName("html")[0].className += " js";</script>
<!--===============================================================================================-->	
	<link rel="stylesheet" href="css/style.css">
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
<body>
	<header class="cd-main-header text-center flex flex-column flex-center">
	    <h1>달하다님의 버킷리스트</h1>
  	</header>
  	
  	<div class="txt-center">
  		<c:if test="${!empty ageList}">
  			<c:forEach var="aList" items="${ageList}">
  				<form action="achieve" method="POST" style="display:inline;">
  					<input type="hidden" name="age" value="${aList}">
		  			<button type="submit" class="button-modal cl0 bg10">${aList}0대 때</button>
		  		</form>
		  	</c:forEach>
	  	</c:if>
	</div>
	<section class="cd-timeline js-cd-timeline">
		<c:if test="${!empty achieveList}">
			<!-- cd-timeline__container 시작 -->
		    <div class="container max-width-lg cd-timeline__container">
		    	<!-- cd-timeline__block -->
		    	<c:forEach var="vo" items="${achieveList}">
		    		<div class="cd-timeline__block">
				      	<!-- cd-timeline__img -->
				        <div class="cd-timeline__img cd-timeline__img--picture">
				          <img src="images/achieve/cd-icon-picture.svg" alt="Picture">
				        </div> 
				
						<!-- cd-timeline__content -->
				        <div class="cd-timeline__content text-component js-show-modal-bucket">
				          <img src="images/bucket/${vo.bucketImage_path}">
				          <p class="color-contrast-medium">${vo.title}</p>
				
				          <div class="flex justify-between items-center">
				            <span class="cd-timeline__date">완료일 : ${vo.complete_date}</span>
				          </div>
				        </div> 
				   </div> 
		     	</c:forEach>
		    </div>
		    <!-- cd-timeline__container 끝-->
	    </c:if>
	    <c:if test="${empty achieveList}">
	    	<h2 class="txt-center">완료된 버킷이 없습니다.</h2>
	    </c:if>
	    
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
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- Back to top -->
			<div class="btn-back-to-top" id="myBtn">
				<span class="symbol-btn-back-to-top">
					<i class="zmdi zmdi-chevron-up"></i>
				</span>
			</div>
	</section> 
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
	<script src="js/util.js"></script>
	<script src="js/swipe-content.js"></script> 
	<script src="js/achieve.js"></script>
	<script src="js/main.js"></script>
</body>
</html>