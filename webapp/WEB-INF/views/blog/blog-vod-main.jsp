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
<link
	rel="${pageContext.request.contextPath}/assets/template/stylesheet"
	type="text/css" href="css/custom.css" media="screen" />

<!--VENDOR SCRIPT-->
<script
	src="${pageContext.request.contextPath}/assets/template/vendor/jquery/jquery-1.11.2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/template/vendor/plugins-compressed.js"></script>
	
<!-- SLIDER REVOLUTION 5.x CSS SETTINGS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/template/vendor/rs-plugin/css/settings.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/template/vendor/rs-plugin/css/layers.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/template/vendor/rs-plugin/css/navigation.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/template/css/rs-plugin-styles.css">
    
    <!-- SLIDER REVOLUTION 5.x SCRIPTS  -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/template/vendor/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/template/vendor/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
<!-- User Profile -->
<script
	src="${pageContext.request.contextPath}/assets/js/userProfile.js"></script>
<link
	href="${pageContext.request.contextPath}/assets/css/userProfile.css" rel="stylesheet">
	
<!-- alertify -->
<link href="${pageContext.request.contextPath}/assets/alertify/alertify.core.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/alertify/alertify.default.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/assets/alertify/alertify.js"></script>
	
<script>


var deleteVod = function(delvideoNo,deluserNo,delname){
	
	$.ajax({
        url:"${pageContext.request.contextPath}/blog/api/deletevod",
        type:"post",
        data:"videoNo="+delvideoNo,
        success: function(){
            console.log("success");
            
        	$.ajax({
                url:"http://150.95.141.66/test/cgi-bin/deleteVod.py",
                type:"post",
                data: { userNo : deluserNo , name: delname },
                success: function(){
                    history.go(0);                   
                },
                error : function(jqXHR, status, e) {
                console.log(status + ":" + e);
                }   
        	})
        	
        },
        error : function(jqXHR, status, e) {
       		console.log(status + ":" + e);
        }   
	})



}

$(function(){
	
	$(document).on("click", "#deleteVOD" ,function(event){
		event.preventDefault();
		
		var delname = $(this).data("name");
		var deluserNo = $(this).data("no");
		var delvideoNo = $(this).data("vno");
		
		alertify.confirm("비디오를 삭제하시겠습니까?",function(e){
			if(e){
				alertify.success("삭제완료", deleteVod(delvideoNo,deluserNo,delname));
			}else{
				alertify.error('삭제가 취소되었습니다.');
			}
	});		
	})
	
})
</script>
<body class="boxed background-grey" >
	<div class="wrapper" style="border:none;">
	
		<!-- START: HEADER PAGE TITLE -->
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<!-- END: PAGE TITLE -->
		<c:import url="/WEB-INF/views/includes/navigation-blog.jsp" />
		
		
		<!-- CONTENT -->
		<section class="p-t-100">
			<div class="container">
				<div class="row">
					<div class="col-md-2">
					</div>
					
				      
			      <div class="col-md-4">
			        <div class="icon-box effect medium center">
			          <div class="icon"> <a href="${pageContext.request.contextPath}/blog/${authUser.nickname}/vodvideo"><i class="fa fa-video-camera"></i></a> </div>
			          <h3>Video</h3>
			          <p>Recorded video.</p>
			        </div>
			      </div>
							      
			      <div class="col-md-4">
			        <div class="icon-box effect medium center">
			          <div class="icon"> <a href="${pageContext.request.contextPath}/blog/${authUser.nickname}/vodcapture"><i class="fa fa-photo"></i></a> </div>
			          <h3>Photo</h3>
			          <p>Captured photos.</p>
			        </div>
			      </div>
				      
<%-- 					<div class="col-md-3">
						<div class="icon-box effect medium border square">
							<div class="icon">
								<a href="${pageContext.request.contextPath}/blog/${authUser.nickname}/vodvideo">
								<i class="fa fa-video-camera" ></i></a>
							</div>
							<h3>Video</h3>
						</div>
					</div>

					<div class="col-md-3">
						<div class="icon-box effect medium border square">
							<div class="icon">
								<a href="${pageContext.request.contextPath}/blog/${authUser.nickname}/vodcapture">
								<i class="fa fa-photo"></i></a>
							</div>
							<h3>Capture</h3>
						</div>
					</div> --%>
					

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
</body>
</html>