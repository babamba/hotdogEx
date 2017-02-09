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

<!-- CKEDITOR SCRIPT -->
<%-- <script src="${pageContext.request.contextPath}/assets/ckeditor/ckeditor.js"></script> --%>
<script src="//cdn.ckeditor.com/4.6.2/standard/ckeditor.js"></script>

<!-- ALERTIFY SCRIPT -->
<script src="${pageContext.request.contextPath}/assets/alertify/alertify.js"></script>

<!--VENDOR SCRIPT-->
<script
	src="${pageContext.request.contextPath}/assets/template/vendor/jquery/jquery-1.11.2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/template/vendor/plugins-compressed.js"></script>

<!-- User Profile -->
<script
	src="${pageContext.request.contextPath}/assets/js/userProfile.js"></script>
	
<!-- DASH-AVC/265 reference implementation SCRIPT-->
	<script src="http://cdn.dashjs.org/latest/dash.all.min.js"></script>	
	
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
					<c:import url="/WEB-INF/views/includes/navigation.jsp" />
					<!--END: NAVIGATION-->


				</div>
			</div>
		</header>
		<!-- END: HEADER -->



		<!-- PAGE TITLE -->
		<section id="page-title"
			class="page-title-parallax page-title-center text-dark"
			style="background-image:url(${pageContext.request.contextPath}/hotdog/image/user/${map.blogVo.logo_image})">
			<div class="container">
				<div class="page-title col-md-8">
					<h1>${map.blogVo.title}</h1>
					<span>${map.userVo.infomation}</span>
					
					<!-- profile modal  -->
					<button class="fancy-btn openProfile">
						<img
							src="${pageContext.request.contextPath}/hotdog/image/user/${map.userVo.users_image}">
					</button>
					<div class="modal-frame">
						<div class="modal">
							<div class="modal-inset">
								<div class="button closeProfile">
									<i class="fa fa-close"></i>
								</div>

								<div class="modal-body">
									<h3>${map.userVo.nickname}</h3>
									<p>${map.userVo.email}</p>

								</div>
							</div>
						</div>
					</div>
					<div class="modal-overlay">
					
					</div>
				</div>
			</div>
		</section>
		<!-- END: PAGE TITLE -->

		<!-- CONTENT -->
		<section class="content">
			<div class="container list_container">
				<div class="streaming_browser">
						 <div>
				            <video id="videoPlayer" controls></video>
				       	 </div>
					
						<div class="streaming_control">
							<button type='button' class='btn btn-info' id='left'><i id="left" class="material-icons">fast_rewind</i></button>
				    		<button type='button' class='btn btn-info' id='center'><i class="material-icons">filter_center_focus</i></button>
				    		<button type='button' class='btn btn-info' id='right'><i class="material-icons">fast_forward</i></button>
				
						<div class="togglebutton">
							<label> 
								<input type="checkbox" checked="checked">
							</label>
						</div>
					</div>
				</div>
			</div>

		</section>

		<!-- END: SECTION -->

		<!-- FOOTER -->
		<footer class="background-dark text-grey" id="footer">

			<div class="copyright-content">
				<div class="container">
					<div class="row">
						<div class="copyright-text col-md-6">
							&copy; 2017 Hotdog. &nbsp;&nbsp;<a target="_blank"
								href="http://www.inspiro-media.com">Bit Academy</a>
						</div>
						<div class="col-md-6">
							<div class="social-icons">
								<ul>
									<li class="social-facebook"><a href="#"><i
											class="fa fa-facebook"></i></a></li>
									<li class="social-twitter"><a href="#"><i
											class="fa fa-twitter"></i></a></li>
									<li class="social-google"><a href="#"><i
											class="fa fa-google-plus"></i></a></li>
									<li class="social-pinterest"><a href="#"><i
											class="fa fa-pinterest"></i></a></li>
									<li class="social-vimeo"><a href="#"><i
											class="fa fa-vimeo-square"></i></a></li>
									<li class="social-linkedin"><a href="#"><i
											class="fa fa-linkedin"></i></a></li>
									<li class="social-dribbble"><a href="#"><i
											class="fa fa-dribbble"></i></a></li>
									<li class="social-youtube"><a href="#"><i
											class="fa fa-youtube-play"></i></a></li>
									<li class="social-rss"><a href="#"><i
											class="fa fa-rss"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
		<!-- END: FOOTER -->

	</div>
	<!-- END: WRAPPER -->
	
	<!-- Theme Base, Components and Settings -->
	<script
		src="${pageContext.request.contextPath}/assets/template/js/theme-functions.js"></script>

	<!-- Custom js file -->
	<script
		src="${pageContext.request.contextPath}/assets/template/js/custom.js"></script>



	<!-- user profile modal -->
	<script>
	$(document).on('ready', function(){
	    $modal = $('.modal-frame');
	    $overlay = $('.modal-overlay');

	    /* Need this to clear out the keyframe classes so they dont clash with each other between ener/leave. Cheers. */
	    $modal.bind('webkitAnimationEnd oanimationend msAnimationEnd animationend', function(e){
	      if($modal.hasClass('state-leave')) {
	        $modal.removeClass('state-leave');
	      }
	    });

	    $('.closeProfile').on('click', function(){
	      $overlay.removeClass('state-show');
	      $modal.removeClass('state-appear').addClass('state-leave');
	    });

	    $('.openProfile').on('click', function(){
	      $overlay.addClass('state-show');
	      $modal.removeClass('state-leave').addClass('state-appear');
	    });

	  });
	</script>
	
	<!-- VIDEO Controller -->
	<script>
			var ip1 = "10.0.0.4";
		
            (function(){
                var url = "http://150.95.141.66:1935/live/${authUser.nickname}/stream/manifest.mpd";
                var player = dashjs.MediaPlayer().create();
                player.initialize(document.querySelector("#videoPlayer"), url, true);
                
                $("#left").click(function(){
                    $.ajax({
                        url:"http://150.95.141.66/test/cgi-bin/send.py",
                        type:"post",
                        data: { msg:"left", ip:ip1 },
                        success: function(){
                            console.log("success");
                        },
                        error : function(jqXHR, status, e) {
                        console.log(status + ":" + e);
                        }            
                    });
                });
                
                $("#center").click(function(){
                    $.ajax({
                        url:"http://150.95.141.66/test/cgi-bin/send.py",
                        type:"post",
                        data: { msg:"center", ip:ip1 },
                        success: function(){
                            console.log("success");
                        },
                        error : function(jqXHR, status, e) {
                        console.log(status + ":" + e);
                        }            
                    });
                });
                
                $("#right").click(function(){
                    $.ajax({
                        url:"http://150.95.141.66/test/cgi-bin/send.py",
                        type:"post",
                        data: { msg:"right", ip:ip1 },
                        success: function(){
                            console.log("success");
                        },
                        error : function(jqXHR, status, e) {
                        console.log(status + ":" + e);
                        }            
                    });
                });
            })();
       
       
    </script>


</body>
</html>