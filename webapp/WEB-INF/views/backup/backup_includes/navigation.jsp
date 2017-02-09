<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div class="responsive-header visible-xs visible-sm">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="top-section">
						<div class="profile-image">
							<img src="${pageContext.request.contextPath}/hotdog/image/user/${authUser.users_image}">
							
						</div>
						<div class="profile-content">
							<h3 class="profile-title">${authUser.nickname}</h3>
							<p class="profile-description">${authUser.description}</p>
						</div>
					</div>
				</div>
			</div>

			<!-- 토글메뉴 - 이벤트 jquery-->
			<a href="#" class="toggle-menu"><i class="fa fa-bars"></i></a>
			<div class="main-navigation responsive-menu">
				<ul>
					<li><a href="${pageContext.request.contextPath}/blog/${authUser.nickname}"><i class="material-icons">home</i>MY BLOG</a></li>
					<li><a href="${pageContext.request.contextPath}/blog/${authUser.nickname}/account"><i class="material-icons">apps</i>My Acount</a></li>
					<li><a href="${pageContext.request.contextPath}/post/${authUser.nickname}/write"><i class="material-icons">apps</i> Posting</a></li>
					<li><a href="${pageContext.request.contextPath}/post/${authUser.nickname}/postlist"><i class="material-icons">accessibility</i>Diary</a></li>
					<li><a href="${pageContext.request.contextPath}/blog/${authUser.nickname}/follow"><i class="material-icons">bookmark</i>Friend</a></li> 
					<li><a href="${pageContext.request.contextPath}/blog/${authUser.nickname}/streaming"><i class="material-icons">tv</i>Live Striming</a></li>
					<li><a href="${pageContext.request.contextPath}/community"><i class="material-icons">forum</i>Community Main</a></li> 			
				</ul>
			</div>
		</div>
	</div>
	
	<!-- SIDEBAR -->
	<div class="sidebar-menu hidden-xs hidden-sm">
		<div class="top-section">
			<div class="profile-image">
				<img src="${pageContext.request.contextPath}/hotdog/image/user/${authUser.users_image}">
				<!-- Button trigger modal -->

			</div>
			<div class="profile-text">
				<h3 class="profile-title">${authUser.nickname}</h3>
				<p class="profile-description">${authUser.description}</p>
			</div>
			
		</div>
		
		<!-- top-section -->

		<div class="sidebar-service">
				<ul>
					<li><a href="${pageContext.request.contextPath}/blog/${authUser.nickname}"><i class="material-icons">home</i>MY BLOG</a></li>
					<li><a href="${pageContext.request.contextPath}/blog/${authUser.nickname}/account"><i class="material-icons">apps</i>My Acount</a></li>
					<li><a href="${pageContext.request.contextPath}/post/${authUser.nickname}/write"><i class="material-icons">apps</i> Posting</a></li>
					<li><a href="${pageContext.request.contextPath}/post/${authUser.nickname}/postlist"><i class="material-icons">accessibility</i>Diary</a></li>
					<li><a href="${pageContext.request.contextPath}/blog/${authUser.nickname}/follow"><i class="material-icons">bookmark</i>Friend</a></li> 
					<li><a href="${pageContext.request.contextPath}/blog/${authUser.nickname}/streaming"><i class="material-icons">tv</i>Live Striming</a></li>
					<li><a href="${pageContext.request.contextPath}/community"><i class="material-icons">forum</i>Community Main</a></li> 		
				</ul>
		</div>
		
	</div>