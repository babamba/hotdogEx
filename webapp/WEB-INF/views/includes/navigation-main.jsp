<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
 $(function(){
	var pi = '${piVo.device_num}';
	var user = '${authUser.users_no}';
	
 	$(document).on("click", "#logout", function(){
        $.ajax({
           url:"http://150.95.141.66/test/cgi-bin/send.py",
           type:"post",
           data: { msg:"streamstop", ip: pi },
           success: function(){
               console.log("Streaming Stop");
           },
           error : function(jqXHR, status, e) {
           console.log(status + ":" + e);
           }            
       });

	})
})
</script>
<div class="navbar-collapse collapse main-menu-collapse navigation-wrap">
	<div class="container">
		<nav id="mainMenu" class="main-menu mega-menu">
			<ul class="main-menu nav nav-pills">
			
				<c:choose>
					<c:when test="${empty authUser}"> 
						<li><a href="${pageContext.request.contextPath}">메인</a></li>
						
						<li><a href="${pageContext.request.contextPath}/community">커뮤니티</a></li>
						
						<li><a href="${pageContext.request.contextPath}/loginpage">Log-In</a></li>
				</c:when>
					
					<c:otherwise> 
						<li><a href="${pageContext.request.contextPath}">메인</a></li>
						
						<!-- authUser 블로그 메인 -->
						<li><a href="${pageContext.request.contextPath}/blog/${authUser.nickname}">내 블로그</a></li>
						
						<!-- 커뮤니티 메인 -->
						<li><a href="${pageContext.request.contextPath}/community/newsfeed">뉴스피드</a></li>
						
						<!-- 커뮤니티 메인 -->
						<li><a href="${pageContext.request.contextPath}/community/freeboard">커뮤니티</a></li>
								
						<!-- user account  -->
						<li class="dropdown"> <a href="#">내 정보<i class="fa fa-angle-down"></i> </a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/blog/${authUser.nickname}/account"> <i class="fa fa-user-plus"></i>계정 설정</a></li>
								
								<li><a id="logout" href="${pageContext.request.contextPath}/user/logout"> <i class="fa fa-user-times"></i>로그아웃</a></li>
							</ul>
						</li>						
					</c:otherwise>
			    </c:choose>				
			</ul>
		</nav>
	</div>
</div>