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
	

<!-- community -->
<link
	href="${pageContext.request.contextPath}/assets/css/community.css"
	rel="stylesheet">
	

<script type="text/javascript">

var postNo = ${map.postVo.post_no};
var usersNo = ${authUserNo};
var image_path = "${pageContext.request.contextPath}/hotdog/image/user/";

/* 댓글 렌더 */
var renderReply = function(vo){
	
	var htmls = 
		"<div class='comment'><a href='#' class='pull-left'><img alt='' src='" + image_path + vo.users_image + "' class='avatar'></a>"+
		"<div class='media-body' id='chatview-"+vo.comments_no+ "'>"+
		"<h4 class='media-heading'>"+vo.nickname+"</h4>"+
		"<p class='time'>"+vo.regdate +"</p>"+
		"<p class='comment_section'>" + vo.content +"</p>"+
		"<div><form class='replytext' id='replyChat-" + vo.comments_no + "'></form></div>" +
		"<button class='comment-reply pull-right btn btn-white' style='padding-right:12px; padding-left:10px; margin-bottom:0px;' id='viewChat' data-cno1='"+vo.comments_no+"'><i class='fa fa-reply'></i>답글보기 ("+vo.count+")</button>"+
		"<button class='comment-reply pull-right btn btn-white' style='padding:12px 12px; margin-right:6px; margin-bottom:0px;' id='writeChat' data-cno2='"+vo.comments_no+"'><i class='fa fa-reply'></i>Reply</button>"+
		"</div></div>";
		
		$("#attachReply").append(htmls);
};


	
	
$(document).on("click", "#writeChat", function(){
	
	var textchat = function(replyNo){
		
		var textareareply = "<div><textarea id='contentReply' aria-required='true' placeholder='내용 입력' cols='10' rows='4' class='form-control required'>" +
							"</textarea><button id='chatajax'class='chatText btn btn-white' type='submit' style='margin-top:12px;'>답글쓰기</button></div>"
			
		$("#replyChat-"+replyNo).append(textareareply);
	} 
	
		
		var replyNo = $(this).data("cno2");

		console.log(replyNo);

		textchat(replyNo);
		
		
		$(".chatajax").submit(function(event){
			event.preventDefault();
			
			var replyNo = $(this).data("cno2");
			

				$.ajax({
					url : "${pageContext.request.contextPath }/postView/api/writereplychat",
					type : "post",
					dataType : "json",
					data : "content="+$("#contentReply").val()+
						   "&users_no="+usersNo+
						   "&comments_no="+replyNo,
					success : function(response){
						
						if(response.result != "success"){
							console.error(response.message);
							return;
						}
						renderReply(response.data);
					},
					
					error : function(jqXHR, status, e) {
						console.log(status + ":" + e);
					}
				});
			});
		})
	
/* 댓글 리스트  */
var fetchReply = function(){
	
	$.ajax({
		url : "${pageContext.request.contextPath }/postView/api/fetchreply?postNo="+postNo,
		type : "get",
		dataType : "json",
		success : function(response){
			
			if(response.result != "success"){
				console.error(response.message);
				return;
			}
			
			//redering
			$(response.data).each(function(index, vo){
				
				renderReply(vo);
				
			})
		},
		error : function(jqXHR, status, e) {
			console.log(status + ":" + e);
		}
	});
};



/* 댓글의 댓글 렌더 */
var renderReplyChat = function(vo, commentsNo){
	
	
	var htmls = 
		"<div class='comment comment-replied'><a href='#' class='pull-left'><img alt='' src='" + image_path + vo.users_image +"' class='avatar'></a>" +
		"<div class='media-body'><h4 class='media-heading'>" + vo.nickname + "</h4><p class='time'>" + vo.regdate + "</p>" +
		"<p class='comment_section'>"+vo.content+"</p>'" +
		"<div><button class='comment-reply pull-right btn btn-white' id='reply'><i class='fa fa-reply'></i>Reply</button></div>" + 
		"</div>";
		
		$("#chatview-"+commentsNo).after(htmls);
};


/* 댓글의 댓글 리스트불러오기 */
var fetchReplyChat = function(commentsNo){
	
	$.ajax({
		url : "${pageContext.request.contextPath }/postView/api/fetchreplychat?commentsNo="+commentsNo,
		type : "get",
		dataType : "json",
		success : function(response){
			
			if(response.result != "success"){
				console.error(response.message);
				return;
			}
			
			//redering
			$(response.data).each(function(index, vo){
				renderReplyChat(vo, commentsNo);
			})
		},
		error : function(jqXHR, status, e) {
			console.log(status + ":" + e);
		}
	});
};	



		
$(function(){
 
	fetchReply();
		
	$("#writeReply").submit(function(event){
		console.log("submit")
		event.preventDefault();
		
		$.ajax({
			url : "${pageContext.request.contextPath }/postView/api/writereply",
			type : "post",
			dataType : "json",
			data : "content="+$("#comment").val()+
				   "&users_no="+usersNo+
				   "&post_no="+postNo,
			success : function(response){
				
				if(response.result != "success"){
					console.error(response.message);
					return;
				}
				renderReply(response.data);
			},
			error : function(jqXHR, status, e) {
				console.log(status + ":" + e);
			}
		});
	});
	
	$(document).on("click", "#viewChat", function(){

		var commentsNo = $(this).data("cno1");
		
		console.log(commentsNo);
		
		fetchReplyChat(commentsNo);
	});
})

</script>

<body class="boxed background-grey">



	<div class="wrapper" style="border:none;">

		<!-- HEADER -->
		<header id="header" class="header-transparent">
			<div id="header-wrap">
				<div class="container">

					<!--LOGO-->
					<div id="logo">
						<a href="${pageContext.request.contextPath}" class="logo">
							<img src="${pageContext.request.contextPath}/assets/img/hotdog_logo_02.png" alt="Hotdog">
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
					<c:import url="/WEB-INF/views/includes/search-bar.jsp" />
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
			style="background-image:url(${pageContext.request.contextPath}/hotdog/image/user/${map2.blogVo.logo_image})">
			<div class="container">
			  <div class="page-title col-md-8">
					<h1>${map2.blogVo.title}</h1>
					<span>${map2.userVo.infomation}</span>
					
					 <!-- profile modal  -->
					<div id="showInfo">
						<button class="fancy-btn openProfile">
							<img
								src="${pageContext.request.contextPath}/hotdog/image/user/${map2.userVo.users_image}">
						</button>
					</div>

					<div class="modal-frame">
						<div class="modal">
							<div class="modal-inset">

								<div class="button closeProfile" id="infoModal-close">
									<i class="fa fa-close"></i>
								</div>

								<div class="modal-body">
									<img
										src="${pageContext.request.contextPath}/hotdog/image/user/${map.userVo.users_image}">
									<h3>${map.userVo.nickname}</h3>
									<p>${map.userVo.infomation}</p>
									<p>${map.userVo.email}</p>
									<div id="emptyFollowerButton"></div>
									<div id="emptyButton"></div>
									<%--<ul><li><a href="${pageContext.request.contextPath }/blog/${map.userVo.nickname">블로그 가기</a></li></ul> --%>


								</div>
							</div>
						</div>
					</div>
				<div class="modal-overlay">
					
				</div>
			</div>
		</div>
	</section>
	<!-- END: PAGE TITLE -->
	<c:choose>
		<c:when test="${map.userVo.users_no == authUser.users_no}" >
			<c:import url="/WEB-INF/views/includes/navigation-blog.jsp" />
		</c:when>
	</c:choose>

		<!-- CONTENT -->
			<section class="content">
			<div class="container">

				<!-- Blog post-->
				<div class="post-content post-content-single post-modern">
					<!-- Post item-->
					<div class="post-item">
						
						<div class="post-content-details">
						
							<div class="post-title">
								<h2> ${map.postVo.title } </h2>
							</div>
							<div class="post-info">
								<span class="post-autor"> 작성자 : <a href="#"> ${map.boardVo.nickname }</a></span> 
								<!--  <span class="post-category">in <a href="#">Productivity</a></span> -->
							</div>
							
							<div class="post-description">
								<p> ${map.postVo.content }	 </p>
								
								
							</div>
						</div>
						<div class="post-meta">
						
							<div class="post-date">
								<span class="post-date-day">${map.day }</span> 
								<span class="post-date-month">${map.month }월 <br><br>${map.year }년</span> 
							</div>

							<div class="post-comments">
								<a href="#"> <i class="fa fa-comments-o"></i> 
								<span class="post-comments-number">${map.postVo.count }</span>
								</a>
							</div>
						</div>
					</div>

					<!-- Comments-->
					<div id="comments" class="comments">
						<div class="heading">
							<h4 class="comments-title">
								댓글 <small class="number">${map.postVo.count }</small>
							</h4>
						</div>

						<div id="attachReply">
						
								<!--  댓글 리스트 -->
		
						</div>
					</div>
					
					<div class="comment-form">
						<div class="heading">
							<h4>Leave a comment</h4>
						</div>
						<form class="form-gray-fields" id="writeReply">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="comment" class="upper">Your comment</label>
										<textarea aria-required="true" id="comment" placeholder="Enter comment"
										 rows="9" class="form-control required"></textarea>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group text-center">
										<button type="submit" class="btn btn-primary">
											<i class="fa fa-paper-plane"></i>&nbsp;Post comment
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>
					<!-- END: Comments-->
					
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

</body>
</html>