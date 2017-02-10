<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->

<html class="no-js">
<!--<![endif]-->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/images/favicon.png">
<title>Hot dog</title>

<head>
<!--  News Feed css 파일 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/newsfeed/animate.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/newsfeed/li-scroller.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/newsfeed/slick.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/newsfeed/theme.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/newsfeed/style.css">

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

<!-- User Profile -->
<script
	src="${pageContext.request.contextPath}/assets/js/userProfile.js"></script>
<link
	href="${pageContext.request.contextPath}/assets/css/userProfile.css"
	rel="stylesheet">
<body>



	<div class="wrapper">

		<!-- HEADER -->
		<header id="header" class="header-transparent">
			<div id="header-wrap">
				<div class="container">

					<!--LOGO-->
					<div id="logo">
						<a href="${pageContext.request.contextPath}" class="logo"
							data-dark-logo="images/logo-dark.png"> <img
							src="${pageContext.request.contextPath}/assets/img/hotdog_logo-01.png"
							alt="Hotdog Logo">
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
					<div id="top-search">
						<a id="top-search-trigger"><i class="fa fa-search"></i><i
							class="fa fa-close"></i></a>
						<form action="search-results-page.html" method="get">
							<input type="text" name="q" class="form-control" value=""
								placeholder="Start typing & press  &quot;Enter&quot;">
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



		<!-- PAGE TITLE -->
		<section id="page-title"
			class="page-title-parallax page-title-center text-dark"
			style="background-image:url(${pageContext.request.contextPath}/assets/template/images/parallax/page-title-parallax.jpg)">
			<div class="container">
			  <div class="page-title col-md-8">
					<h1>뉴스피드</h1>
					
	
				</div>
			</div>
		</section>
		<!-- END: PAGE TITLE -->


		<!-- CONTENT -->
		
		<!-- 최근 이웃글 타이틀    ( 링크 부여  )-->
		<div class="latest_newsarea"> <span>Latest News</span>
			      <ul id="ticker01" class="news_sticker">
			      <c:forEach items="${latest_news }"	var="vo" varStatus="status">
			      	<li><a href="${pageContext.request.contextPath }/community/newsfeed/detail?no=${vo.post_no}">${vo.nickname} : ${vo.title }</a></li>
			      </c:forEach>
			      </ul>
		 </div>
		 
		 <!-- 최근 이웃글 중 조회수,댓글이 높은 순 (링크 부여)-->
		  <div class="thumbnail_slider_area">
		      <div class="owl-carousel">
		       <c:forEach items="${top_ten }"	var="vo" varStatus="status">
		        <div class="signle_iteam">
		         <img src="${pageContext.request.contextPath}/hotdog/image/user/${vo.post_image}">
		          <img src="${pageContext.request.contextPath}/hotdog/image/user/${vo.users_image}">
		          <div class="sing_commentbox slider_comntbox">
		            <p><i class="fa fa-calendar"></i>${vo.regdate }</p>
		            <a href="#"><i class="fa fa-comments"></i>count</a></div>
		          <a class="slider_tittle" href="#">제목</a></div>
		        </c:forEach>
		        
    	</div>
		
			
		<!-- END: CONTENT -->

		<!-- FOOTER -->
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
		<!-- END: FOOTER -->

	</div>
	<!-- END: WRAPPER -->
	<!-- Theme Base, Components and Settings -->
	<script
		src="${pageContext.request.contextPath}/assets/template/js/theme-functions.js"></script>

	<!-- Custom js file -->
	<script
		src="${pageContext.request.contextPath}/assets/template/js/custom.js"></script>
		
		<!--  News Feed JS-->
	<script src="${pageContext.request.contextPath}/assets/js/newsfeed/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/newsfeed/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/newsfeed/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/newsfeed/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/newsfeed/jquery.li-scroller.1.0.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/newsfeed/custom.js"></script>
		

</body>
</html>