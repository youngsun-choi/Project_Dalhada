<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>
<head>
	<title>Login Page</title>
   <!--Made with love by Mutiullah Samim -->
   
	<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>


<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>Sign In</h3>
			</div>
			<BR>
			<div class="card-body">
				<form id="loginForm" method="POST" action="/prject/login">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" id="id" name="id" placeholder="아이디" required class="form-control" placeholder="ID">
						
					</div>
					<BR>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" id="password" name="password" placeholder="비밀번호" required class="form-control" placeholder="password">
					</div>
							<!-- 네이버 로그인 창으로 이동 -->
							<div id="naver_id_login" style="text-align: center"><a href="${url}">
								<img width="223"
									src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
							</div>
						<div class="form-group">
						<button id="submit" type="button" class="btn float-right login_btn">로그인</button>
					</div>
					<div id="loginError"></div>
				</form>
				
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					Don't have an account?<a href="/dalhada/memberform">Sign Up</a>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
var referer='';
$(document).ready(function(){
	
	$("#submit").click(function(){
		var id = $("#id").val();
		var pwd = $("#password").val();

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
					if(document.referrer.includes('logout')||document.referrer.includes('memberform')||document.referrer.includes('loginmain'))
						referer="http://localhost:8000/dalhada/main";
					location.href=referer;
				}
			}
		});
	});
});
</script>
</body>
</html>