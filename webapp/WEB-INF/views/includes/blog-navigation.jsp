<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
$(function(){
	
	var users_no = ${authUser.users_no}
	
	$(document).on("click", "#getVod", function(){
    	
         $.ajax({
            url:"http://150.95.141.66/test/cgi-bin/vod.py",
            type:"post",
            data: { userNo : users_no },
            success: function(){
                console.log("success");
            },
            error : function(jqXHR, status, e) {
            console.log(status + ":" + e);
            }            
        });
     });

})
</script>

		<div class="blog_navigation text-center">
			
				<a style="margin:0 ; padding:15px 26px 15px 26px; border:1px solid #e6e6e6; "  class="button border effect icon-top" href="${pageContext.request.contextPath}/post/${authUser.nickname}/postlist"><span><i class="fa fa-pencil-square-o" aria-hidden="true"></i>diary</span></a>
				<a style="margin:0; padding:15px 20px 15px 20px; border:1px solid #e6e6e6; " class="button border effect icon-top" href="${pageContext.request.contextPath}/blog/${authUser.nickname}/streaming"><span><i class="fa fa-video-camera" aria-hidden="true"></i>stream</span></a>
				<a style="margin:0; padding:15px; border:1px solid #e6e6e6; " class="button border effect icon-top" id="getVod" href="${pageContext.request.contextPath}/blog/${authUser.nickname}/vod"><span><i class="fa fa-file-video-o" aria-hidden="true"></i>vodplay</span></a>
			
		</div>