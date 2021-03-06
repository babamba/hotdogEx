<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	
	
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">
	<title>HOTDOG | Security Page</title>

	<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/assets/template/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/template/vendor/fontawesome/css/font-awesome.min.css"
	type="text/css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/template/vendor/animateit/animate.min.css"
	rel="stylesheet">

<!-- Vendor css -->
<link
	href="${pageContext.request.contextPath}/assets/template/vendor/owlcarousel/owl.carousel.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/template/vendor/magnific-popup/magnific-popup.css"
	rel="stylesheet">

<!-- Template base -->
<link
	href="${pageContext.request.contextPath}/assets/template/css/theme-base.css"
	rel="stylesheet">


<!-- Template elements -->
<link
	href="${pageContext.request.contextPath}/assets/template/css/theme-elements.css"
	rel="stylesheet">


<!-- Responsive classes -->
<link
	href="${pageContext.request.contextPath}/assets/template/css/responsive.css"
	rel="stylesheet">

<!--[if lt IE 9]>
		<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->

<!-- Template color -->
<link
	href="${pageContext.request.contextPath}/assets/template/css/color-variations/blue.css"
	rel="stylesheet" type="text/css" media="screen" title="blue">

<!-- LOAD GOOGLE FONTS -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,800,700,600%7CRaleway:100,300,600,700,800"
	rel="stylesheet" type="text/css" />

<!-- CSS CUSTOM STYLE -->
<link
	rel="${pageContext.request.contextPath}/assets/template/stylesheet"
	type="text/css" href="css/custom.css" media="screen" />

<!--VENDOR SCRIPT-->
<script
	src="${pageContext.request.contextPath}/assets/template/vendor/jquery/jquery-1.11.2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/template/vendor/plugins-compressed.js"></script>
	
<!-- alert -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/alertify/alertify.core.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/alertify/alertify.default.css">

<script src="${pageContext.request.contextPath}/assets/alertify/alertify.js"></script>


</head>

<body class="wide">
	

	<!-- WRAPPER -->
	<div class="wrapper">

		<!-- HEADER -->
		<header id="header" class="header-transparent header-dark">
			<div id="header-wrap">
				<div class="container">

					<!--LOGO-->
					<div id="logo">
						<a href="${pageContext.request.contextPath }/" class="logo"
							data-dark-logo="${pageContext.request.contextPath}/assets/img/hotdog_logo_02.png"> <img
							src="${pageContext.request.contextPath}/assets/img/hotdog_logo_02.png" alt="Polo Logo">
						</a>
					</div>
					<!--END: LOGO-->

					<!--MOBILE MENU -->
					<div class="nav-main-menu-responsive">
						<button class="lines-button x">
							<span class="lines"></span>
						</button>
					</div>
					<!--END: MOBILE MENU -->
				</div>
			</div>
		</header>
		<!-- END: HEADER -->


		<!-- SECTION -->
		<section class="parallax fullscreen" style="background: 
			linear-gradient(rgba(0, 0, 0, 0.65),rgba(0, 0, 0, 0.65)),url(${pageContext.request.contextPath}/assets/img/security.jpg); background-size:cover;">
			<div class="background-overlay"></div>
			<div class="container container-fullscreen">
				<div class="text-middle text-light">
					<div class="row">
						<div class="col-md-4 col-md-offset-4 p-30">
							<div class="col-md-12 text-center">
								<h3>보안 페이지 - 2차 비밀번호 설정</h3>
								<p>유저들의 안전한  HOTDOG 사용을 위한 2차 비밀번호 생성.</p>
							</div>
							<form class="form-transparent-fields" method="post" action="${pageContext.request.contextPath }/user/account/secretmodify">
							
								<label class="col-md-12">2차비밀번호 설정( 1000 ~ 999999 )</label>
								<div class="col-md-12 form-group">
									<label class="sr-only">Password</label>
									<input type="password" id="secretNumber" value="" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;' placeholder="Secret password" name="sec_pass_word" class="form-control input-lg">

								</div>
								
								<label class="col-md-12">한번 더 비밀번호를 입력해주세요.</label>
								<div class="col-md-12 form-group">
									<label class="sr-only">Password</label>
									<input id="secretNumberCheck" type="password" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;' value="" placeholder="Please Enter once more" name="sec_pass_word" class="form-control input-lg">

								</div>
								<br>
								<br>
								<div class="col-md-12 form-group text-center">
									<button class="btn btn-primary" type="submit" id="secretNumberSave">2차 비밀번호 저장</button>
									<button type="button" class="btn btn-danger"><a href="${pageContext.request.contextPath}/blog/${authUser.nickname}" style="color:white;">Cancel</a></button>
								</div>
							</form>

							

						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- END: SECTION -->


	</div>
	<!-- END: WRAPPER -->


	<!-- Theme Base, Components and Settings -->
	<script src="${pageContext.request.contextPath}/assets/template/js/theme-functions.js"></script>

	<!-- Custom js file -->
	<script src="${pageContext.request.contextPath}/assets/template/js/custom.js"></script>

	<script>
		// 클릭시 비교
		var secretNumber;
		var secretNumberCheck;
		
		$(function(){
			
			$("#secretNumberSave").click(function(){
				
				secretNumber = $("#secretNumber").val();
				secretNumberCheck = $("#secretNumberCheck").val();
				
				if( secretNumber > 999999 ){
					alertify.error(" Typing 1000 ~ 999999 Please");
					return false;
				}	
				if( secretNumber < 1000){
					alertify.error(" Typing 1000 ~ 999999 Please");
					return false;
				}
				if(secretNumber != secretNumberCheck){
					alertify.error("입력한  보안번호가 일치하지 않습니다");
					return false;
				}
				return true;
			})
		})		
	
	// 문자를 빼버리고 숫자만 입력받기
		function onlyNumber(event){
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
				return;
			else
				return false;
		}
		function removeChar(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
				return;
			else
				event.target.value = event.target.value.replace(/[^0-9]/g, "");
		}
	</script>
	<script>
	$(function(){
		$(".redirect-btn").click(function(){
			history.go(-1);
		})
	})
	</script>

</body>

</html>
