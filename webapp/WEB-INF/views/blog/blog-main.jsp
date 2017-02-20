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

<!-- User Profile -->
<script
	src="${pageContext.request.contextPath}/assets/js/userProfile.js"></script>
<link
	href="${pageContext.request.contextPath}/assets/css/userProfile.css" rel="stylesheet">
<body>



	<div class="wrapper">
	
		<!-- START: HEADER PAGE TITLE -->
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<!-- END: PAGE TITLE -->


		<!-- CONTENT -->
		<section class="content">
			<div class="container list_container">
				<!-- Blog post-->
				<div class="isotope" data-isotope-item-space="3"
					data-isotope-col="3" data-isotope-item=".post-item">
					
				</div>
				<!-- END: Blog post-->
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



	<!-- post 최신 글 9개 불러오는 ajax list -->
	<script>
	var nickname = "${map.userVo.nickname}"
	var users_map = "{users_map.userVo.no}"
	var image_path = "${pageContext.request.contextPath}/hotdog/image/user/"
	var post = "${pageContext.request.contextPath }/post/" + nickname + "/postView?post_no="
				
			
   
	var render = function(vo){
		var htmls =  "<div class='post-item'><div class='post-image'><img src='" + image_path + vo.post_image + "'></a></div><div class='post-content-details'>" + 
	        		  "<div class='post-title'><h3>" + vo.title + "</h3></div>" +
	        		  "<div class='post-description'><div class='post-info'><a class='read-more' href='" + post + vo.post_no + "'>read more <i class='fa fa-long-arrow-right'></i></a></div>" +
	         		  "</div></div><div class='post-meta'><div class='post-date'><span class='post-date-year'>" + vo.regdate + "</span></div>" +
	        		  "<div class='post-comments' data-no='" + vo.post_no + "'> <a href='#'> <i class='fa fa-comments-o'></i><span class='post-comments-number'>0</span></a></div>" +
	         		  "</div></div>"
				
	         		  $(".isotope").append(htmls);
		}
	
	var fetchList = function(){
		console.log("fetchList")
	  
		  $.ajax({
			url: "${pageContext.request.contextPath }/blog/api/indexPostList?nickname=" + nickname,
			type: "get",
			dataType: "json",
			data:"",
			success: function(response){
				$(response.data).each(function(index, vo){
					render(vo, $);
					INSPIRO.masonryIsotope(render);
					
					console.log("render")
				});
			},
		error: function(jqXHR, status, e){
			console.error(status + ":" + e)
			}
		})
	};
	
	fetchList();

	</script>


	
</body>
</html>