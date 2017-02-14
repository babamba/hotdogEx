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
	

	<!-- WRAPPER -->
	<div class="wrapper">

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
						<form action="search-results-page.html" method="get">
							<input type="text" name="q" class="form-control" value="" placeholder="Start typing & press  &quot;Enter&quot;">
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
			<section id="page-title" class="page-title-parallax page-title-center text-dark" style="background-image:url(${pageContext.request.contextPath}/assets/template/images/parallax/page-title-parallax.jpg);">
				<div class="container">
					<div class="page-title col-md-8">
						<h1>News Feed</h1>
						<span>이웃들의 소식을 한눈에 확인하세요 !</span>
					</div>
					<div class="breadcrumb col-md-4">
						<ul>
							<li><a href="#"><i class="fa fa-home"></i></a>
							</li>
							<li><a href="${pageContext.request.contextPath}">Home</a>
							</li>
							<li><a href="${pageContext.request.contextPath}/community">Community</a>
							</li>
							<li class="active"><a href="${pageContext.request.contextPath}/community/newsfeed">News feed</a>
							</li>
						</ul>
					</div>
				</div>
			</section>
			<!-- END: PAGE TITLE -->
			
			<!-- CONTENT -->
			<section class="content">
				<div class="container">
					<div class="row">
					<!-- Blog post-->
					<div class="post-content col-md-9" >
				
					<c:forEach items="${latest_news }"	var="vo" varStatus="status">	
						<!-- Blog image post-->
						<div class="post-item">
							<div class="post-image">
							<a href="#">
								<img alt="" src="${pageContext.request.contextPath }/hotdog/image/user/${vo.post_image}">
							</a>
							</div>
							<div class="post-content-details">
								<div class="post-title">
									<h3><a href="#">${vo. title}</a></h3>
								</div>
								<div class="post-info">
									<span class="post-autor">Post by: <a href="${pageContext.request.contextPath }/blog/${vo.nickname}">${vo.nickname }</a></span>
								</div>
								<div class="post-description">
									<p>불러온 리스트들의 글내용....image 파일을 제외하고 어떻게 불러올까...</p>
		
									<div class="post-read-more">
										<a class="read-more" href="${pageContext.request.contextPath }/post/${vo.nickname}/postView?post_no=${vo.post_no}">read more <i class="fa fa-long-arrow-right"></i></a>
									</div>
								</div>
							</div>
		
							<div class="post-meta">
								<div class="post-date">
									<span class="post-date-day">${vo.regdate }</span>
								</div>
		
								<div class="post-comments">
									<a href="#">
										<i class="fa fa-comments-o"></i>
										<span class="post-comments-number">${vo.count }</span>
									</a>
								</div>
							</div>
						</div>
				</c:forEach>
					<div id="addList"></div>
			</div>
			
			<!-- END: Blog post-->
			<script>
				var isEnd = false;
				var page = 0;
				
				var fetch=function(){
					
					if(isEnd == true ){
						return;
					}
					++page;
					
					
					$.ajax({
						url: "${pageContext.request.contextPath }/community/newsfeed/fetch?page=" + page,
						type: "get",
						dataType: "json",
						data:"",
						success: function( response ) { // response.result = "success" or "fail"
														// response.data = [{}, {}, {}...]
							if( response.result != "success" ) {
								console.error( response.message );
								isEnd = true;
								return;
							}
							
							// rendering
							$( response.data ).each( function(index, vo){
								render( vo, false );
							});
							
							if( response.data.length < 5 ) {
								isEnd = true;
							}
						},
						error: function( jqXHR, status, e ) {
							console.error( status + ":" + e );
						}
					});
				}
				
				var render = function( vo, mode ) {
					// 현업에서는 이부분을 template library ex) ejs
					var htmls = 
						'<div class="post-item">'+
							'<div class="post-image">'+
								'<a href="#">'+
									'<img alt="" src="${pageContext.request.contextPath }/hotdog/image/user/'+vo.post_image+
								' "></a>'+
							'</div>'+
							'<div class="post-content-details">'+
								'<div class="post-title">'+
									'<h3><a href="#">' + vo. title + '</a></h3>'+
								'</div>'+
								'<div class="post-info">'+
									'<span class="post-autor">Post by: <a href="#">'+ vo.nickname +'</a></span>'+
								'</div>'+
								'<div class="post-description">'+
									'<p>불러온 리스트들의 글내용....image 파일을 제외하고 어떻게 불러올까...</p>'+
									'<div class="post-read-more">'+
										'<a class="read-more" href="${pageContext.request.contextPath }/post/'+ vo.nickname +'/postView?post_no='+ vo.post_no +'">read more <i class="fa fa-long-arrow-right"></i></a>'+
									'</div>'+
								'</div>'+
							'</div>'+
							'<div class="post-meta">'+
								'<div class="post-date">'+
									'<span class="post-date-day">'+ vo.regdate +'</span>'+
								'</div>'+
								'<div class="post-comments">'+
									'<a href="#">'+
										'<i class="fa fa-comments-o"></i>'+
										'<span class="post-comments-number">'+ vo.count +'</span>'+
									'</a>'+
								'</div>'+
							'</div>'+
						'</div>';
						
					
						$( "#addList" ).append( htmls );
					
				}
				
				$(window).scroll( function(){
					var $window = $(this);
					var scrollTop = $window.scrollTop();
					var windowHeight = $window.height();
					var documentHeight = $( document ).height();
					
					// 스크롤 바가 바닥까지 왔을 때( 10px 덜 왔을 때 )
					if( scrollTop + windowHeight + 20 > documentHeight ) {
						//console.log( "call fetchList" );
						fetch();
					}
				});
				

			</script>



			<!-- Sidebar-->
			<div class="sidebar sidebar-modern col-md-3">

				<!--widget search-->
				<div class="widget clearfix widget-search">
                            <form action="${pageContext.request.contextPath }/community/newsfeed/search" method="get" class="form-inline">
                                <div class="input-group">
                                    <input type="text" name="search" placeholder="누구의 글을 찾나요?" class="form-control">
                                    <span class="input-group-btn">
										<button type="submit" class="btn color btn-primary"><i class="fa fa-search"></i></button>	
									</span>
                                </div>
                            </form>
                        </div>
				<!--end: widget search-->

				<!--widget archive-->
				<div class="widget clearfix widget-archive">
					<h4 class="widget-title">명예의 전당</h4>
					<c:forEach items="${total_top }"	var="vo" varStatus="status">	
					<ul class="list list-lines">
						<li><a href="${pageContext.request.contextPath }/post/${vo.nickname}/postView?post_no=${vo.post_no}">${vo.title } : ${vo.nickname }</a></li>
					</ul>
					</c:forEach>
				</div>
				<!--end: widget archive-->

				<!--widget slider-->
				<div class="widget clearfix widget-slider">
					<h4 class="widget-title">Top News</h4>
					<div class="post-slider">
						<div class="carousel" data-carousel-dots="true" data-carousel-col="1" data-carousel-autoplay="true">
							<c:forEach items="${top_ten }"	var="vo" varStatus="status">
							<img alt="image" src="${pageContext.request.contextPath }/hotdog/image/user/${vo.post_image}">
							</c:forEach>
						</div>
					</div>
				</div>
				<!--end: widget slider -->

				

				<!--widget flickr-->
				<div class="widget clearfix widget-flickr">
					<h4 class="widget-title">내 이웃들</h4>
					<div data-flickr-images="12" data-flickr-id="52617155@N08" class="flickr-widget"></div>
				</div>
				<!--end: widget flickr-->

				<!--widget blog articles-->
				<div class="widget clearfix widget-blog-articles"> 
					<h4 class="widget-title">최근 활동한 이웃들</h4>
					<ul class="list-posts list-medium">
						<c:forEach items="${recent_users }"	var="vo" varStatus="status">
						<li><a href="${pageContext.request.contextPath }/post/${vo.nickname}/postView?post_no=${vo.post_no}">${vo.nickname } : ${vo.title }</a>
							<small>${vo.regdate }</small>
						</li>
						</c:forEach>
					</ul>
				</div>
				<!--end: widget blog articles-->


				<!--widget contact us-->
				<div class="widget clearfix widget-contact-us" style="background-image: url('images/world-map.png'); background-position: 50% 55px; background-repeat: no-repeat">
					<h4 class="widget-title">Contact us</h4>
					<ul class="list-large list-icons">
						<li><i class="fa fa-map-marker"></i>
							<strong>Address:</strong> BIT Academy - HotDog Team
							<br>Seoul, Kodrea</li>
						<li><i class="fa fa-phone"></i><strong>Phone:</strong> (010) 1234-5678 </li>
						<li><i class="fa fa-envelope"></i><strong>Email:</strong> <a href="#">hotdog.bit2017@gmail.com</a>
						</li>
						<li><i class="fa fa-clock-o"></i>Monday - Friday: <strong>09:00 - 18:00</strong>
							<br>Saturday, Sunday: <strong>Closed</strong>
						</li>
					</ul>
				</div>
				<!--end: widget contact us-->
				
				<!--widget tags -->
				<div class="widget clearfix widget-tags">
					<h4 class="widget-title">Tags</h4>
					<div class="tags">
						<a href="">HotDog</a>
						<a href="">PetCam</a>
						<a href="">Streaming</a>
						<a href="">SNS</a>
						<a href="">Raspberry Pi</a>
						<a href="">Python</a>
						<a href="">Java</a>
						<a href="">Vod</a>
						<a href="">Diary</a>
						<a href="">Android</a>
					</div>
				</div>
				<!--end: widget tags -->

			</div>
			<!-- END: Sidebar-->
		</div>
	</div>
</section>
<!-- END: SECTION -->
	</div>
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
		
	

</body>
</html>