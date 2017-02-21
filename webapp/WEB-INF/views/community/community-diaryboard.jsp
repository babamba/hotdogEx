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
	href="${pageContext.request.contextPath}/assets/css/userProfile.css"
	rel="stylesheet">
	
	
<script>
$(function(){
	
	$(document).on("click", "#viewPost", function(){
				
		var boardNo = $(this).data("no");
						
		$.ajax({
			url : "${pageContext.request.contextPath }/community/freeboard/api/updateHits?boardNo="+boardNo,
			type : "get",
			success: function() { 
				console.log("success");
			},
			error : function(jqXHR, status, e) {
				console.log(status + ":" + e);
			}
		});
	})
})
</script>
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
						<form action="${pageContext.request.contextPath}/search" method="get">
							<input type="text" name="keyword" class="form-control" value=""
								placeholder="Start typing & press  &quot;Enter&quot;">
						</form>
					</div>
					<!--END: TOP SEARCH -->

					<!--NAVIGATION-->
					<c:import url="/WEB-INF/views/includes/navigation-main.jsp" />
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
					<h1><a href="${pageContext.request.contextPath}/community/diaryboard">다이어리 톡</a></h1>
					
				</div>
			</div>
		</section>
		<!-- END: PAGE TITLE -->
		<c:import url="/WEB-INF/views/includes/navigation-community.jsp" />


		<!-- CONTENT -->
		<section class="content">
			<div class="container list_container">
					<form action="${pageContext.request.contextPath}/community/diaryboard/writediaryyform" method="get">
						<button class="btn btn-primary" type="submit" name="${categoryNo }">다이어리 올리기</button>
					</form>
					
					<form action="${pageContext.request.contextPath}/community/diaryboard">
						<input type="submit" value="검색" style="float: right;">
						<input type="text"  name="kwd" style="float: right;">
					</form><br><br>
					
				<!-- Blog post-->
				<div class="isotope" data-isotope-item-space="3" data-isotope-col="3" data-isotope-item=".post-item">
					<c:forEach items="${map.list }"	var="vo" varStatus="status">
					
					<div class='post-item'>
					<div class='post-image'>
						<img src="${pageContext.request.contextPath}/hotdog/image/user/${vo.post_image }"></div>
					<div class='post-content-details'>
					  <div class='post-title'><a class='read-more' href="${pageContext.request.contextPath }/community/viewdiary?no=${vo.post_no }">
					  <h3>${vo.title }(${vo.count })</h3></a>
					  
					  </div>
					 
					  <div class='post-description'>
					  <div class='post-info'><a href="javascript:;" class="openProfile" data-no="${vo.users_no}"><p>${vo.nickname }</p></a></div>
					  </div>
					  
					  </div><div class='post-meta'><div class='post-date'><span class='post-date-year'>${vo.regdate }</span></div>
					  <div class='post-comments' data-no="">
					  <span class='fa fa-hand-pointer-o'> ${vo.hits }</span>
					  </div>
					  </div></div>
					  
					  </c:forEach>
				</div>
				
						<ul class="pager">
									<c:if test="${map.prevPage > 0 }" >
										<li><a href="${pageContext.request.contextPath}/community/diaryboard?p=${map.prevPage }">◀</a></li>
									</c:if>
									
									<c:forEach begin="${map.beginPage }" end="${map.endPage}" var="page">
										<c:choose>
											<c:when test="${map.endPage < page }">
												<li>${page }</li>
											</c:when> 
											
											<c:when test="${map.currentPage == page }">
												<li>${page }</li>
											</c:when>
											
											<c:otherwise> 
												<li><a href="${pageContext.request.contextPath }/community/diaryboard?p=${page }">${page }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									
									<c:if test="${map.nextPage > 0 }" >
										<li><a href="${pageContext.request.contextPath }/community/diaryboard?p=${map.nextPage }">▶</a></li>
									</c:if>	
						</ul>
				
				
			</div>
			
			<!-- user profile modal -->
					<div class="container modal-body-container">
						<div class="modal-frame">
							<div class="modal">
								<div class="modal-inset">
		
									<div class="icon-box effect medium closeProfile" id="infoModal-close" 
										 style="float:right; padding:10px; margin:10px;">
										<i class="fa fa-close"></i>
									</div>
								
								
									<div class="modal-body" style="clear:both;">
										<div id="emptyProfile" style="z-index:10000"></div>
										<div id="emptyFollowerButton" ></div>
										<div id="emptyButton" ></div>
									</div>
		
								</div>
							</div>
						</div>
					</div>
					
<!-- 					<div class="modal-overlay"> -->
<!-- 					</div> -->
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