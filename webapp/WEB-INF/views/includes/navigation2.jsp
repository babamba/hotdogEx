<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<div class="navbar-collapse collapse main-menu-collapse navigation-wrap">
	<div class="container">
		<nav id="mainMenu" class="main-menu mega-menu">
			<ul class="main-menu nav nav-pills">
			    <!-- authUser 블로그 메인 -->
				<li><a href="${pageContext.request.contextPath}/blog/${authUser.nickname}"><i class="fa fa-home"></i></a>
				
				<!-- 커뮤니티 메인 -->
				<li class="dropdown"><a href="#">커뮤니티 메인</a></li>
				
				<!-- 포스팅  -->
				<li><a href="${pageContext.request.contextPath}/post/${authUser.nickname}/write">포스팅하기</a></li>
					
				<!-- 다이어리 부분  -->
				<li><a href="${pageContext.request.contextPath}/post/${authUser.nickname}/postlist">나의 다이어리</a></li>
						
				<!-- 스트리밍 부분 -->
				<li><a href="${pageContext.request.contextPath}/blog/${authUser.nickname}/streaming">핫도그 스트리밍</a></li>


				<!-- user account  -->
				<li class="dropdown"><a href="${pageContext.request.contextPath}/blog/${authUser.nickname}/account">내 정보</a>
					<ul class="dropdown-menu">
						<li class="dropdown-submenu"><span
							class="dropdown-menu-title-only">나의 팔로워</span>
							<ul class="dropdown-menu">
								<li><a href="page-about-basic.html">Basic</a></li>
							</ul></li>
						<li class="dropdown-submenu"><span
							class="dropdown-menu-title-only">보안 번호설정</span></li>

						<li class="dropdown-submenu"><span
							class="dropdown-menu-title-only">프로필 설정</span>
							<ul class="dropdown-menu">
								<li><a href="page-about-basic.html">Basic</a></li>
							</ul></li>
						<li class="dropdown-submenu"><span
							class="dropdown-menu-title-only">관심 다이어리</span></li>
						<li class="dropdown-submenu"><span
							class="dropdown-menu-title-only">Q&A 게시글</span></li>
						<li class="dropdown-submenu"><span
							class="dropdown-menu-title-only">고객문의</span></li>
					</ul>
				</li>
				
				<c:choose>
				<c:when test="${empty authUser}"> </c:when>
				
				
				<c:otherwise> </c:otherwise>
				
				
			    </c:choose>
				<!-- 로그인 로그아웃 부분-->
				<li><a href="${pageContext.request.contextPath}/blog/${authUser.nickname}/streaming">핫도그 스트리밍</a></li>



			</ul>
		</nav>
	</div>
</div>