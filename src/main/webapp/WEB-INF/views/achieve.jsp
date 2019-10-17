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
	<header class="cd-main-header txt-center flex flex-center">
		<a href="javascript:history.back();">
			<i id="back" class="fas fa-sign-in-alt fa-flip-horizontal fa-2x cl0"></i>
		</a>
	    <h1 class="p-l-15">달하다님의 버킷리스트</h1>
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
					          <!-- <img src="images/achieve/cd-icon-picture.svg" alt="Picture"> -->
					        </div> 
						
							<!-- cd-timeline__content -->
					        <div class="cd-timeline__content text-component">
					          <img data-id="${vo.selectedbucket_id }" class="js-show-modal-bucket p-b-5" src="images/bucket/${vo.bucketImage_path}">
					          <p data-id="${vo.selectedbucket_id }" class="js-show-modal-bucket color-contrast-medium">${vo.title}</p>
					
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
	    
			
			<!-- Back to top -->
			<div class="btn-back-to-top" id="myBtn">
				<span class="symbol-btn-back-to-top">
					<i class="zmdi zmdi-chevron-up"></i>
				</span>
			</div>
	</section> 
	
	<%@ include file="modal_detail.jsp" %>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.perfect-scrollbar/0.6.10/js/perfect-scrollbar.jquery.js"></script>
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
	<script src="js/util.js"></script>
	<script src="js/swipe-content.js"></script> 
	<script src="js/achieve.js"></script>
	<script src="js/main.js"></script>
</body>
</html>