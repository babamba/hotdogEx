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
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">
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
<link rel="${pageContext.request.contextPath}/assets/template/stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/template/css/custom.css" media="screen" />

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

		<!-- START: HEADER PAGE TITLE -->
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<!-- END: PAGE TITLE -->
		<div class="blog_navigation text-center">
			
				<a style="margin:0 ; padding:15px 26px 15px 26px; border:1px solid #e6e6e6; "  class="button border effect icon-top" href="${pageContext.request.contextPath}/post/${authUser.nickname}/postlist"><span><i class="fa fa-pencil-square-o" aria-hidden="true"></i>diary</span></a>
				<a style="margin:0; padding:15px 20px 15px 20px; border:1px solid #e6e6e6; " class="button border effect icon-top" href="${pageContext.request.contextPath}/blog/${authUser.nickname}/streaming"><span><i class="fa fa-video-camera" aria-hidden="true"></i>stream</span></a>
				<a style="margin:0; padding:15px; border:1px solid #e6e6e6; " class="button border effect icon-top" href="${pageContext.request.contextPath}/blog/${authUser.nickname}/vod"><span><i class="fa fa-file-video-o" aria-hidden="true"></i>vodplay</span></a>
			
		</div>

		<!-- CONTENT -->
		<section class="content">
			<div class="container list_container">
				<div class="streaming_browser text-center">
						 
						 <div>
				            <video id="videoPlayer" width="720" height="360" controls="controls"></video>
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