<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Result</title>

<!--<![endif]-->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">
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
		

</head>
<body class="boxed background-grey">
		<!-- HEADER -->
		<header id="header" class="header-transparent">
			<div id="header-wrap">
				<div class="container">

					<div id="logo">
						<a href="${pageContext.request.contextPath}" class="logo"
							data-dark-logo="images/logo-dark.png"> <img
							src="${pageContext.request.contextPath}/assets/img/hotdog_logo_02.png"
							alt="Hotdog Logo">
						</a>
					</div>

					<!--MOBILE MENU -->
					<div class="nav-main-menu-responsive">
						<button class="lines-button x">
							<span class="lines"></span>
						</button>
					</div>
					<!--END: MOBILE MENU -->

					<!--TOP SEARCH -->
					<c:import url="/WEB-INF/views/includes/search-bar.jsp" />
					<!--END: TOP SEARCH -->
				<c:import url="/WEB-INF/views/includes/navigation-main.jsp" />
				</div>
			</div>
		</header>
		<!-- END: HEADER -->
					
	
		<!-- PAGE TITLE -->
		<section id="page-title" class="page-title-video page-title-center text-light" data-vide-bg="${pageContext.request.contextPath }/hotdog/image/user/Typing" data-vide-options="position: 0% 50%">
		    <div class="container">
		        <div class="page-title col-md-8">
		            <h1>search</h1>
		            <span>Typing! what are you looking for?</span>
		        </div>
		        <div class="breadcrumb col-md-4">
		            <ul>
		                <li><a href="#"><i class="fa fa-home"></i></a>
		                </li>
		                <li><a href="#">Home</a>
		                </li>
		              
		                <li class="active"><a href="#">Search</a>
		                </li>
		            </ul>
		        </div>
		    </div>
		</section>
<!-- END: PAGE TITLE -->
		
		
				<!-- SHOP PRODUCTS -->
		<section>
			<div class="container">
				<div class="row">
		
					<!-- Post content-->
					<div class="post-content float-right col-md-9">
						<div class="row m-b-20">
							<div class="col-md-6 p-t-10 m-b-20">
								<h3 class="m-b-20">Search Result</h3>
								<p>You can choose search option for your personal taste,<br> Have a good Time : )</p>
							</div>
							<div class="col-md-3">
								<div class="order-select">
									<h6>Sort option</h6>
									<p>Showing 1&ndash;10 of 50 results</p>
									<form method="get">
										<select>
											<option selected="selected" value="order">정확도 순</option>
											<option value="popularity">가나다 순</option>
											<option value="rating">조회도 순</option>
											<option value="date">댓글 순</option>
										</select>
									</form>
								</div>
							</div>
							<div class="col-md-3">
								<div class="order-select">
									<h6>Search option</h6>
									<p>next search, showing</p>
									<form method="get">
										<select>
											<option selected="selected" value="">전체 검색</option>
											<option value="">팔로우 유저 중 검색</option>
											<option value="">팔로우 유저 제외</option>
										</select>
									</form>
								</div>
							</div>
						
		
						</div>
						<!--Product list-->
						<div class="shop">
							<div class="row">
							
							
									<!--Horizontal tabs triangle line simple-->
									<div id="tabs-01d1" class="tabs linetriangle triangle-simple">
										<ul class="tabs-navigation">
											<li class="active"><a href="#About01d"><i class="fa fa-home"></i>User</a> </li>
											<li><a href="#Services01d"><i class="fa fa-home"></i>Blog</a> </li>
											<li><a href="#Choose01d"><i class="fa fa-home"></i>Post</a> </li>
											<li><a href="#Assets01d"><i class="fa fa-home"></i>Diary</a> </li>
										</ul>
										<div class="tabs-content">
											<div class="tab-pane active" id="About01d">
												<h4>User Result</h4>
													<div class="table-responsive">
												      <table class="table table-striped">
												        <thead>
												          <tr>
												            <th>Profile </th>
												            <th>Nickname</th>
												            <th>Email</th>
												            <th>Introduce</th>
												          </tr>
												        </thead>
												        <tbody>
												        <c:forEach items="${user_list }"	var="vo" varStatus="status">
												          <tr>
												            <td><img src="${pageContext.request.contextPath }/hotdog/image/user/${vo.users_image}" style="border-radius:15px; witdh:35px; height:35px;" ></td>
												            <td><a href="${pageContext.request.contextPath }/blog/${vo.nickname}">${vo.nickname }</a></td>
												            <td>${vo.email }</td>
												            <td>${vo.infomation }</td>
												          </tr>
												         </c:forEach>
												        </tbody>
												      </table>
												    </div>
												</div>
											<div class="tab-pane" id="Services01d">
												<h4>Blog Result</h4>
												<div class="table-responsive">
												      <table class="table table-striped">
												        <thead>
												          <tr>
												            <th>Logo</th>
												            <th>Title</th>
												            <th>Nickname</th>
												          </tr>
												        </thead>
												        <tbody>
												        <c:forEach items="${blog_list }"	var="vo" varStatus="status">
												          <tr>
												            <td><img src="${pageContext.request.contextPath }/hotdog/image/user/${vo.logo_image}" style="border-radius:15px; witdh:35px; height:35px;" ></td>
												            <td><a href="${pageContext.request.contextPath }/blog/${vo.nickname}">${vo.title }</a></td>
												            <td><a href="${pageContext.request.contextPath }/blog/${vo.nickname}">${vo.nickname }</a></td>
												          </tr>
												         </c:forEach>
												        </tbody>
												      </table>
												    </div>
											</div>
											<div class="tab-pane" id="Choose01d">
												<h4>Board Result</h4>
												<div class="table-responsive">
												      <table class="table table-striped">
												        <thead>
												          <tr>
												            <th>Title</th>
												            <th>Nickname</th>
												            <th>Date</th>
												            <th>Hit</th>
												          </tr>
												        </thead>
												        <tbody>
												        <c:forEach items="${board_list }"	var="vo" varStatus="status">
												          <tr>
												            <td>${vo.title }</td>
												            <td>${vo.nickname }</td>
												            <td>${vo.regdate }</td>
												            <td>${vo.hits }</td>
												          </tr>
												         </c:forEach>
												        </tbody>
												      </table>
												    </div>
											</div>
											<div class="tab-pane" id="Assets01d">
												<h4>Diary Result</h4>
												<div class="table-responsive">
												      <table class="table table-striped">
												        <thead>
												          <tr>
												            <th>Image</th>
												            <th>Title</th>
												            <th>Nickname</th>
												            <th>Date</th>
												          </tr>
												        </thead>
												        <tbody>
												        <c:forEach items="${post_list }"	var="vo" varStatus="status">
												          <tr>
												            <td>Image</td>
												            <td>${vo.title }</td>
												            <td>${vo.nickname }</td>
												            <td>${vo.regdate }</td>
												          </tr>
												         </c:forEach>
												        </tbody>
												      </table>
												    </div>
											</div>
										</div>
									</div>
									<!--END: Horizontal tabs triangle line simple-->
								<hr class="space">
				
				
								</div>
								</div>
								</div>
					<!-- Sidebar-->
						<div class="sidebar col-md-3">
							<!--widget newsletter-->
							<div class="widget clearfix widget-archive">
								<h4 class="widget-title">Keyword</h4>
								<ul class="list list-lines">
									<form class="form-inline">
										<div class="form-group">
											<input type="text" class="form-control" name="keyword" id="exampleInputName2" placeholder="I'm looking for..">
											<button type="submit" class="button small border full-rounded" href="${pageContext.request.contextPath}/search "><span>Search</span></button>
										</div>
									</form>
								</ul>
							</div>
						</div>
					</div>
					</div>
				</section>
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
		
	
</html>