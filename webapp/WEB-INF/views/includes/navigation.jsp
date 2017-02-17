<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="navbar-collapse collapse main-menu-collapse navigation-wrap">
	<div class="container">
		<nav id="mainMenu" class="main-menu mega-menu">
			<ul class="main-menu nav nav-pills">
			
				<c:choose>
					<c:when test="${empty authUser}"> 
						<!-- authUser 블로그 메인 -->
						<li><a href="${pageContext.request.contextPath}/blog/${authUser.nickname}">블로그 </a></li>
						
						<!-- 커뮤니티 메인 -->
						<li><a href="${pageContext.request.contextPath}/community">커뮤니티</a></li>
						
						<!-- 커뮤니티 테스트 메인 -->
						<li><a href="${pageContext.request.contextPath}/page_main">TEST</a></li>
				</c:when>
					
					<c:otherwise> 
						<!-- authUser 블로그 메인 -->
						<li><a href="${pageContext.request.contextPath}/blog/${authUser.nickname}">블로그</a></li>
						
						<!-- 커뮤니티 메인 -->
						<li><a href="${pageContext.request.contextPath}/community/newsfeed">뉴스피드</a></li>
						
						<!-- 커뮤니티 메인 -->
						<li><a href="${pageContext.request.contextPath}/community">커뮤니티</a></li>
						
						<!-- 포스팅  -->
						<%-- <li><a href="${pageContext.request.contextPath}/post/${authUser.nickname}/write">포스팅하기</a></li> --%>
							
						<%-- <!-- 다이어리 부분  -->
						<li><a href="${pageContext.request.contextPath}/post/${authUser.nickname}/postlist">나의 다이어리</a></li> --%>
								
						<%-- <!-- 스트리밍 부분 -->
						<li><a href="${pageContext.request.contextPath}/blog/${authUser.nickname}/streaming">핫도그 스트리밍</a></li> --%>
		
						<!-- user account  -->
						<li><a href="${pageContext.request.contextPath}/blog/${authUser.nickname}/account">내 정보</a></li>
						
						<!-- 커뮤니티 테스트 메인 -->
						<li><a href="${pageContext.request.contextPath}/page_main">TEST</a></li>
					</c:otherwise>
			    </c:choose>
			    
			   
				
				
				<!-- 로그인 로그아웃 부분-->
				<c:choose>
					<c:when test="${empty authUser}"> 
						<li><a href="${pageContext.request.contextPath}/loginpage">Log-In</a></li>
					</c:when>
					
					<c:otherwise> 
						<li><a href="${pageContext.request.contextPath}/user/logout">Log-out</a></li>
					</c:otherwise>
			    </c:choose>
			</ul>
		</nav>
	</div>
</div>