<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Result</title>

<!--<![endif]-->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/images/favicon.png">
<title>Hot dog</title>

<head>

<!-- Bootstrap Core CSS -->
<link href="${pageContext.request.contextPath}/assets/template/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/template/vendor/fontawesome/css/font-awesome.min.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/template/vendor/animateit/animate.min.css" rel="stylesheet">

<!-- Vendor css -->
<link href="${pageContext.request.contextPath}/assets/template/vendor/owlcarousel/owl.carousel.css"	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/template/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

<!-- Template base -->
<link href="${pageContext.request.contextPath}/assets/template/css/theme-base.css" rel="stylesheet">

<!-- Template elements -->
<link href="${pageContext.request.contextPath}/assets/template/css/theme-elements.css" rel="stylesheet">

<!-- Responsive classes -->
<link href="${pageContext.request.contextPath}/assets/template/css/responsive.css" rel="stylesheet">

<!--[if lt IE 9]>
		<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->

<!-- Template color -->
<link href="${pageContext.request.contextPath}/assets/template/css/color-variations/blue.css" rel="stylesheet" type="text/css" media="screen" title="blue">

<!-- LOAD GOOGLE FONTS -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,800,700,600%7CRaleway:100,300,600,700,800" rel="stylesheet" type="text/css" />

<!-- CSS CUSTOM STYLE -->
<link rel="${pageContext.request.contextPath}/assets/template/stylesheet" type="text/css" href="css/custom.css" media="screen" />

<!--VENDOR SCRIPT-->
<script	src="${pageContext.request.contextPath}/assets/template/vendor/jquery/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/template/vendor/plugins-compressed.js"></script>

<!-- User Profile -->
<script src="${pageContext.request.contextPath}/assets/js/userProfile.js"></script>
<link href="${pageContext.request.contextPath}/assets/css/userProfile.css" rel="stylesheet">
		
<body class="wide">

</head>
<body>
		<!-- HEADER -->
		<header id="header" class="header-transparent">
			<div id="header-wrap">
				<div class="container">

					<!--LOGO-->
					<div id="logo">
						<a href="${pageContext.request.contextPath}" class="logo" data-dark-logo="images/logo-dark.png">
							<img src="${pageContext.request.contextPath}/assets/img/hotdog_logo-01.png" alt="HotDog Logo">
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

					<!--TOP SEARCH -->
					<div id="top-search"> <a id="top-search-trigger"><i class="fa fa-search"></i><i class="fa fa-close"></i></a>
						<form action="${pageContext.request.contextPath}/search }" method="get">
							<input type="text" name="keyword" class="form-control" value="" placeholder="Start typing & press  &quot;Enter&quot;">
						</form>
						
					</div>
					<!--END: TOP SEARCH -->
					<!--NAVIGATION-->
					<div class="navbar-collapse collapse main-menu-collapse navigation-wrap">
							<div class="container">
								<nav id="mainMenu" class="main-menu mega-menu">
									<ul class="main-menu nav nav-pills">
									
									    <!-- authUser 블로그 메인 -->
										<li><a href="${pageContext.request.contextPath}"><i class="fa fa-home"></i></a>
										
										<!-- 커뮤니티 메인 -->
										<li><a href="${pageContext.request.contextPath}/community">커뮤니티 메인</a></li>
									
									</ul>
								</nav>
							</div>
					</div>
					<!--END: NAVIGATION-->
				</div>
			</div>
		</header>
		<!-- END: HEADER -->
					
		<!-- SECTION IMAGE FULLSCREEN -->
		<section class="fullscreen background-overlay" data-vide-bg="${pageContext.request.contextPath }/hotdog/image/user/Typing" data-vide-options="position: 0% 50%">
			<div class="container-fluid">
				<div class="container-fullscreen">
					<div class="text-middle text-center text-light">
						<i class="fa fa-bullseye"></i>
						<h3 class="m-b-0">Typing</h3>
						<h2 class="text-medium m-t-0">What you want?</h2>
						<p class="lead">Hot Dog team</p>
						<a class="button button-light rounded" href="#">Search bar</a>						
					</div>


				</div>
			</div>
		</section>
		<!-- END: SECTION IMAGE FULLSCREEN -->
		
</body>

	<!-- FOOTER -->
	<c:import url="/WEB-INF/views/includes/footer.jsp" />
	<!-- END: FOOTER -->
	
	<!-- Theme Base, Components and Settings -->
	<script
		src="${pageContext.request.contextPath}/assets/template/js/theme-functions.js"></script>

	<!-- Custom js file -->
	<script
		src="${pageContext.request.contextPath}/assets/template/js/custom.js"></script>
		
	
</html>