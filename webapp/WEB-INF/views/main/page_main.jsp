<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	
	
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">
	<title>Hot Dog</title>

	<!-- Bootstrap Core CSS -->
	<link href="${pageContext.request.contextPath}/assets/template/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/assets/template/vendor/fontawesome/css/font-awesome.min.css" type="text/css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/assets/template/vendor/animateit/animate.min.css" rel="stylesheet">

	<!-- Vendor css -->
	<link href="${pageContext.request.contextPath}/assets/template/vendor/owlcarousel/owl.carousel.css" rel="stylesheet">
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
	<link href="${pageContext.request.contextPath}/assets/template/css/color-variations/red-dark.css" rel="stylesheet" type="text/css" media="screen" title="blue">

	<!-- LOAD GOOGLE FONTS -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,800,700,600%7CRaleway:100,300,600,700,800" rel="stylesheet" type="text/css" />

	<link href="http://fonts.googleapis.com/css?family=Roboto:400,300,800,700,600" rel="stylesheet" type="text/css" />

	<!-- CSS CUSTOM STYLE -->
    <link rel="${pageContext.request.contextPath}/assets/template/stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/template/css/custom.css" media="screen" />

    <!--VENDOR SCRIPT-->
    <script src="${pageContext.request.contextPath}/assets/template/vendor/jquery/jquery-1.11.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/template/vendor/plugins-compressed.js"></script>
    
    <!-- User Profile -->
	<script src="${pageContext.request.contextPath}/assets/js/userProfile.js"></script>
	<link href="${pageContext.request.contextPath}/assets/css/userProfile.css" rel="stylesheet">

	<script src="${pageContext.request.contextPath}/assets/js/board_list.js"></script>
</head>

<body class="boxed background-white">
	

	<!-- WRAPPER -->
	<div class="wrapper">
		<!-- HEADER -->
		<header id="header">
			<div id="header-wrap">
				<div class="container">
					
					<!--LOGO-->
					<div id="logo">
						<a href="${pageContext.request.contextPath}" class="logo"
							data-dark-logo="images/logo-dark.png"> <img
							src="${pageContext.request.contextPath}/assets/img/hotdog_logo_02.png"
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
						<form action="${pageContext.request.contextPath}/search" method="get">
							<input type="text" name="keyword" class="form-control" value=""
								placeholder="검색어를 입력해주세요.">
						</form>
					</div>
					<!--END: TOP SEARCH -->

					
				</div>
			</div>
		</header>
		<!-- END: HEADER -->
		
		<!-- INSPIRO SLIDER -->
        <div  class="inspiro-slider" >
            <!-- Slide 1 -->
            <div class="slide background-overlay-dark"  data-vide-bg="${pageContext.request.contextPath}/assets/img/dog_video.mp4">

                <div class="container">
                	<div class="col-md-6 col-sm-12 col-xs-12">
	                    <div class="slide-captions col-md-12 col-sm-12 col-xs-12">
	                        <!-- Captions -->
	                        <h2 class="text-center">Hot Dog</h2>
	                        <h4 class="m-b-40 text-center">핫도그 커뮤니티에 오신 걸 환영해요!</h4>
	                       	<a class="text-center button transparent effect fill-vertical col-md-12 col-sm-12 col-xs-4 " href="${pageContext.request.contextPath}/community"><span>커뮤니티 게시판으로!</span></a>
	                        <!-- End: Captions -->
	                    </div>
                    </div>
                    
                 <!-- authUser info  부분  -->
                 <c:choose>
					<c:when test="${empty authUser}">
							<div class="col-md-4 col-sm-4 col-xs-4 pull-right">
								<div id="book">
								
										<div class="row text-center">
											<div class="col-md-12 col-sm-12 col-xs-12">
												<label>핫도그를 시작하세요!</label>
											</div>
										</div>
										
										
									<div class="row">
											<div class="col-md-12 col-sm-12 col-xs-12 text-center">	
												<a href="${pageContext.request.contextPath}/loginpage"><div class="button transparent effect fill-vertical col-md-12 col-sm-12 col-xs-4 text-center"><span>로그인 & 회원가입</span></div></a>
											</div>
									</div> 
								
								</div>
							</div>
						</c:when>
					
						<c:otherwise>
						<div class="col-md-5 col-sm-5 col-xs-5 pull-right" >
								<div id="book" class="col-md-12 col-sm-12 col-xs-12" >
										
										
											
												
											
									
										<div class="col-md-12 col-sm-12 col-xs-12 text-center">
											<button class="fancy-btn openProfile" style="position:relative; display:inline-block; left:-1%; margin-bottom:-38px;">
												<img src="${pageContext.request.contextPath}/hotdog/image/user/${authUser.users_image}">
											</button>
										</div>
										
										<div class="col-md-12 col-sm-12 col-xs-12">
											<div class="row">
												
											
												<div class="col-md-6 col-sm-6 col-xs-6 text-center">
													<label style="margin-top:10px;">"${authUser.nickname}"님</br>안녕하세요!</label>
												</div> 
												
												<div class="col-md-6 col-sm-6 col-xs-6 text-center">
													<a class="button transparent full-rounded" href="${pageContext.request.contextPath}/user/logout" ><span>로그아웃</span></a>
												</div>
											</div>
										</div>
									
									<div class="auth_nav col-md-12 col-sm-12 col-xs-12" style="margin:0px; padding:0px" >
										<div class="row">
												<!-- <a class="button transparent effect fill-vertical col-md-4 col-sm-4 col-xs-4 text-center" href="#" ><span>블로그</span></a>
												<a class="button transparent effect fill-vertical col-md-4 col-sm-4 col-xs-4 text-center" href="#" ><span>뉴스피드</span></a>
												<a class="button transparent effect fill-vertical col-md-4 col-sm-4 col-xs-4 text-center" href="#" ><span>스트리밍</span></a> -->
										
												<a href="${pageContext.request.contextPath}/blog/${authUser.nickname}"><div class="button transparent effect fill-vertical col-md-4 col-sm-12 col-xs-4 text-center"><span>블로그</span></div></a>
												<a href="${pageContext.request.contextPath}/community/newsfeed"><div class="button transparent effect fill-vertical col-md-4 col-sm-4 col-xs-4 text-center"><span>뉴스피드</span></div></a>
												<a href="${pageContext.request.contextPath}/blog/${authUser.nickname}/streaming"><div class="button transparent effect fill-vertical col-md-4 col-sm-4 col-xs-4 text-center"><span>스트리밍</span></div></a>								
										</div>
									</div>
								</div>
							
							</div>
						</c:otherwise>
			    	</c:choose>
					<!-- authUser info  부분  -->
					</div>
                </div>
       		 </div>

		<script>
		
		
		
		
		</script>
		


		<!-- NEWS GRID -->
		<section class="p-t-40 p-b-40">
			<div class="container">
				<div class="grid-articles grid-articles-v2 best_hotdog">
				
				</div>
			</div>
		</section>
		<!-- END: NEWS GRID -->
	
		<!-- ADVERTISEMENT -->
		<section class="p-t-20 p-b-40">
			<div class="container">
			<div class="marketing-box">ADVERTISEMENT</div>
			</div>
		</section>
			<!-- END: ADVERTISEMENT -->
		
			<!-- post 최신 글 9개 불러오는 ajax list -->
	
		
		<!-- CATEGORIES -->
		<section class="p-t-0 p-b-40">
			<div class="container">
				<div class="row">
					<div class="col-md-4 board_category_list">
						<div class="heading-fancy heading-line">
							<h4><a href="${pageContext.request.contextPath}/community/freeboard">프리톡!</a></h4>
						</div>
						
						<!-- ajax category List -->
						<div class="post-thumbnail-list">
						
							<div class="post-thumbnail-entry free_List">
								
							
							</div>
							
							
						</div>
						
					</div>
					
					
					
					<div class="col-md-4">
						<div class="heading-fancy heading-line board_list">
							<h4><a href="${pageContext.request.contextPath}/community/galleryboard">갤러리톡!</a></h4>
						</div>
							
							
						<div class="post-thumbnail-list">
							<div class="post-thumbnail-entry gallery_list">
								
								
							</div>
							
						</div>
					</div>
					
					
					<div class="col-md-4">
						<div class="heading-fancy heading-line board_List">
							<h4><a href="${pageContext.request.contextPath}/community/diaryboard">다이어리톡!</a></h4></div>
						<div class="post-thumbnail-list">
							<div class="post-thumbnail-entry diary_list">
								
							</div>

						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- END: HIGHTLIGHTS -->

		<!-- ADVERTISEMENT -->
		<section class="p-t-0 p-b-40">
			<div class="container">
			<div class="marketing-box">ADVERTISEMENT</div>
			</div>
		</section>
			<!-- END: ADVERTISEMENT -->


		<!-- CALL TO ACTION -->
		<!-- <div class="jumbotron jumbotron-fullwidth background-colored text-light m-b-0">
			<div class="container">
				<h3>Ready to purchase POLO Template?</h3>
				<p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
				<a href="#" class="button transparent rounded"><span>Purchase</span></a>
			</div>
		</div> -->
		<!-- END: CALL TO ACTION -->
	
			
		<!-- FOOTER -->
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
		<!-- END: FOOTER -->	

	</div>
	<!-- END: WRAPPER -->

	<!-- GO TOP BUTTON -->
	<a class="gototop gototop-button" href="#"><i class="fa fa-chevron-up"></i></a>

	<!-- Theme Base, Components and Settings -->
	<script src="${pageContext.request.contextPath}/assets/template/js/theme-functions.js"></script>

	<!-- Custom js file -->
	<script src="${pageContext.request.contextPath}/assets/template/js/custom.js"></script>

	

</body>

</html>
