<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
$(function(){
	var users_no = ${authUser.users_no}
	
	var change = function(){
		location.href="${pageContext.request.contextPath}/blog/${authUser.nickname}/vod";
	}
	
	$(document).on("click", "#getVod", function(){
         $.ajax({
        	url:"http://150.95.141.66/test/cgi-bin/vod.py",
        	type:"post",
        	data: { userNo : users_no },
        	success: function(){
        		console.log("SUCCESS")
        		setTimeout(change, 500);
            },
            error : function(jqXHR, status, e) {
            console.log(status + ":" + e);
            }            
        });
     });
})
</script>
		<c:choose>
		<c:when test="${empty authUser or (authUser.nickname ne map.nickname)}"> 
			<div class="blog_navigation text-center">
				<a class="button black-light button-3d rounded"><span> Follower : ${map.userVo.follower_num } 명</span></a>
			</div>
		</c:when>
		
		<c:when test="${authUser.nickname eq map.nickname}"> 
			<div class="blog_navigation text-center">
				<a href="${pageContext.request.contextPath}/post/${map.userVo.nickname}/postlist"><div class="button effect fill-vertical col-md-4 col-sm-4 col-xs-4 text-center"><span>Diary</span></div></a>
				<a href="${pageContext.request.contextPath}/blog/${map.userVo.nickname}/streaming"><div class="button effect fill-vertical col-md-4 col-sm-4 col-xs-4 text-center"><span>Streaming</span></div></a>
				<a id="getVod"><div class="button effect fill-vertical col-md-4 col-sm-4 col-xs-4 text-center"><span>VOD</span></div></a>
			</div>
		</c:when>
		</c:choose>
		
		
		
		
		
		
		
		