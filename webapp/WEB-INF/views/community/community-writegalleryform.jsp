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
<script src="${pageContext.request.contextPath}/assets/ckeditor/ckeditor.js"></script>
<!-- <script src="//cdn.ckeditor.com/4.6.2/standard/ckeditor.js"></script> -->
<script src="${pageContext.request.contextPath}/assets/ckeditor/plugins/uploadimage/plugin.js"></script>
<script src="${pageContext.request.contextPath}/assets/ckeditor/plugins/widget/plugin.js"></script>

<!-- ALERTIFY SCRIPT -->
<script src="${pageContext.request.contextPath}/assets/alertify/alertify.js"></script>

<!--VENDOR SCRIPT-->
<script
	src="${pageContext.request.contextPath}/assets/template/vendor/jquery/jquery-1.11.2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/template/vendor/plugins-compressed.js"></script>

<!-- Write Page -->
<link 
	href="${pageContext.request.contextPath}/assets/css/write.css" 
	rel="stylesheet">	


<!-- User Profile -->
<script
	src="${pageContext.request.contextPath}/assets/js/userProfile.js"></script>
<link
	href="${pageContext.request.contextPath}/assets/css/userProfile.css"
	rel="stylesheet">
	

		
</head>
	
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
					<h1>자유게시판</h1>
					
	
				</div>
			</div>
		</section>
		<!-- END: PAGE TITLE -->

		<!-- CONTENT -->
		<section class="content">
			<div class="container list_container">
				<form action= "${pageContext.request.contextPath}/community/writegallerypost" method="post"  >
					<textarea class="form-control required" aria-required="true" name="title" placeholder="제목을 입력하세요." rows="1" style="font-size:20px"></textarea>

		            <textarea name="content" id="ckeditor" rows="10" cols="80"></textarea>
		            
		            <button type="submit" name="${categoryNo }" class="btn btn-white pull-right" id="posting" style="margin-right:0; margin-top:10px; "></button>
		            
		            
       			</form>
			</div>

		</section>

		<!-- END: SECTION -->

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

	
	<script>
            CKEDITOR.replace( 'ckeditor', {//해당 이름으로 된 textarea에 에디터를 적용 <-- 이거 이름 부분입니다.
            customConfig: '${pageContext.request.contextPath}/assets/ckeditor/config.js',
            startupFocus : false,  // 자동 focus 사용할때는  true
            enterMode :CKEDITOR.ENTER_BR,
            width:'100%',
            height:'600px',
            filebrowserImageUploadUrl:"${pageContext.request.contextPath }/image/upload",
            });

            </script> 
            
        <script type='text/javascript'>
		CKEDITOR.on('dialogDefinition', function (ev) {
			var dialogName = ev.data.name;
			var dialog = ev.data.definition.dialog;
			var dialogDefinition = ev.data.definition;

				if (dialogName == 'image') {
					dialog.on('show', function (obj) {
					this.selectPage('Upload'); //업로드텝으로 시작
				});

				dialogDefinition.removeContents('advanced'); // 자세히탭 제거
				dialogDefinition.removeContents('Link'); // 링크탭 제거
			}
		});
		</script>
		
		<script>
		
		$("#posting").on('click', function(){
			alertify.success("Success notification");
			console.log("alert")
		});
		
		/* $("input").click(function(){
			alertify.success("Success notification");
		}) */
		</script>


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

</body>
</html>