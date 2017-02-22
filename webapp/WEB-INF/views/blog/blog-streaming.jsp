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
	
<link
	href="${pageContext.request.contextPath}/assets/css/streamingPage.css"
	rel="stylesheet">
	
<body class="boxed background-white">

	<div class="wrapper">

		<!-- START: HEADER PAGE TITLE -->
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<!-- END: PAGE TITLE -->
		<c:import url="/WEB-INF/views/includes/navigation-blog.jsp" />
		

		<!-- CONTENT -->
		<section class="content" style="padding-top:0px;">
			<div class="container list_container">
				<div class="streaming_browser text-center">
						<br>				
						<div class="weather-wrapper">
						    <div class="weather-card madrid">
						        <div class="weather-icon sun"></div>
						       	<p>온도</p>
						        <h1>${map.piVo.temperature }</h1>
						  
						    </div>
						    <div class="weather-card london">
						        <div class="weather-icon cloud"></div>
						      	 <p>습도</p>
						        <h1>${map.piVo.humidity }</h1>
						       
						    </div>
						</div>
						
						 <div>
				            <video id="videoPlayer" width="720" height="360" controls="controls"></video>
				       	 </div>
				       	 
				       	 <i class="fa fa-video-camera"> Recoding</i>
						<div class="record_box">
							<div class="recording_btn center-block pull-left">
								<button class="toggle toggle--off"></button>
							</div>
						
							<div id="chronoExample pull-right">
							    <div class="values">
							    	<p>00:00:00<p>
							    </div>
							</div>
						</div>
						
						<br><br>
						<div class="hr-title hr-long center"><abbr>Remote Camera</abbr> </div>
						
						<div class="streaming_control center-block">
							<div class="row">
								<a class="button effect icon-right center-block text-center col-md-3 col-sm-3 col-xs-6" id='left' href="javascript:;" ><span><i class="fa fa-backward"></i>◀  Left</span></a>
					    		<a class="button effect fill center-block col-md-3 col-sm-3 col-xs-12" style="margin-right:0;" id='center' href="javascript:;"><span>Center</span></a>
					    		<a class='button effect icon-left center-block text-center col-md-3 col-sm-3 col-xs-6' id='right' href="javascript:;"><span><i class="fa fa-forward"></i>Right ▶</span></a>
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
		
	<!-- Custom js file -->
	<script
		src="${pageContext.request.contextPath}/assets/js/timer.min.js"></script>

	<script>
		
	
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
	
	<!-- VIDEO Controller -->
	<script>
	
	$(function(){
		var player = dashjs.MediaPlayer().create();	
		var url = "http://150.95.141.66:1935/live/${authUser.nickname}/stream/manifest.mpd";
		var deviceNum = "${map.piVo.device_num }";
        var nickname = "${map.userVo.nickname}";
        var userNo = ${map.userVo.users_no};
		var timer = new Timer();
		
		player.initialize(document.querySelector("#videoPlayer"), url, true);
				
				// Video Recoding
				$('.toggle').click(function(e) {
					  var toggle = this;
					  e.preventDefault();

 					  $(toggle).toggleClass('toggle--on').toggleClass('toggle--off').toggleClass('toggle--moving');
 					  					  
 					  var sw = $(toggle).attr('class');
 					  var temp = sw.split(' ');

	 					timer.addEventListener('started', function (e) {
		 					    $('.record_box .values').html(timer.getTimeValues().toString());
		 				});
	 					timer.addEventListener('secondsUpdated', function (e) {
	 					    $('.record_box .values').html(timer.getTimeValues().toString());
	 					});
 					 
  					  if(temp[1]=='toggle--on'){
  						 timer.start();
  						 
	  						$.ajax({
	                         url:"http://150.95.141.66:8086/livestreamrecord?app=live/"+nickname+"&streamname=stream&action=startRecording&outputPath=/upload/"+userNo,
	                         type:"get",
	                         success: function(){
	                             console.log("Recoding Start");
	                         },
	                         error : function(jqXHR, status, e) {
	                         console.log(status + ":" + e);
	                         }            
	                    	 });
	  						
 					  }
 					  else if(temp[1]=='toggle--off'){
 						 timer.stop();
 						 
 						 $.ajax({
 							 url:"http://150.95.141.66:8086/livestreamrecord?app=live/"+nickname+"&streamname=stream&action=stopRecording",
 							type:"get",
 							 success: function(){
 							 console.log("Recoding STOP");
 							 },
 							 error : function(jqXHR, status, e) {
 							 console.log(status + ":" + e);
 							 }          
 							 });
 						
 					  }
 					
					  setTimeout(function() {
					    $(toggle).removeClass('toggle--moving');
					  }, 200)
					});
                
                // Motor Controll
                $("#left").click(function(){
                    $.ajax({
                        url:"http://150.95.141.66/test/cgi-bin/send.py",
                        type:"post",
                        data: { msg:"left", ip: deviceNum },
                        success: function(){
                            console.log("left");
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
                        data: { msg:"center", ip: deviceNum },
                        success: function(){
                            console.log("center");
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
                        data: { msg:"right", ip: deviceNum },
                        success: function(){
                            console.log("right");
                        },
                        error : function(jqXHR, status, e) {
                        console.log(status + ":" + e);
                        }            
                    });
                });
            
	})
</script>
    
   


</body>
</html>