<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% pageContext.setAttribute( "newLine", "\n" ); %>
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
	
<!-- community -->
<link
	href="${pageContext.request.contextPath}/assets/css/community.css"
	rel="stylesheet">
<!-- alertify -->
<link href="${pageContext.request.contextPath}/assets/alertify/alertify.core.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/alertify/alertify.default.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/assets/alertify/alertify.js"></script>
	
<script type="text/javascript">
var boardUserNo = ${map.boardVo.users_no};
var boardNo = ${map.boardVo.board_no};
var usersNo = ${authUserNo};
var image_path = "${pageContext.request.contextPath}/hotdog/image/user/";

/* 댓글 렌더 */
var renderReply = function(vo){
	
	var htmls = 
		"<div class='comment'><a href='#' class='pull-left'><img alt='' src='" + image_path + vo.users_image + "' class='avatar'></a>"+
		"<div class='media-body' id='chatview-"+vo.comments_no+ "'><button id='deleteReply' style='float:right; border:none; board:None; background:000;' value='"+vo.users_no+"' data-id='"+vo.comments_no+"'><i class='fa fa-close'></i></button>"+
		"<h4 class='media-heading'>"+vo.nickname+"</h4>"+
		"<p class='time'>"+vo.regdate +"</p>"+
		"<p class='comment_section'>" + vo.content.replace( /\n/gi, "<br>") +"</p>"+
		"<button class='comment-reply pull-left btn btn-white' style='padding-right:12px; padding-left:10px; margin-bottom:0px;' id='viewChat' data-cno1='"+vo.comments_no+"'><i class='fa fa-reply'></i>답글보기 ("+vo.count+")</button>"+
		"<button class='comment-reply pull-right btn btn-white' style='padding:12px 12px; margin-right:6px; margin-bottom:0px;' id='writeChat' data-cno2='"+vo.comments_no+"'><i class='fa fa-reply'></i>댓글달기</button>"+
		"</div></div>";
		
	$("#attachReply").append(htmls);
	
};


/* 댓글 리스트 가져오기 */
var fetchReply = function(){
	
	$.ajax({
		url : "${pageContext.request.contextPath }/community/api/fetchreply?boardNo="+boardNo,
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
		"<div class='comment comment-replied' id='replyChatView'><a href='#' class='pull-left'><img alt='' src='" + image_path + vo.users_image +"' class='avatar'></a>" +
		"<div class='media-body'><button id='deleteReplyChat' style='float:right; border:none; board:None; background:000;' value='"+vo.users_no+"' data-id='"+vo.board_chat_no+"'><i class='fa fa-close'></i></button>"+
		"<h4 class='media-heading'>" + vo.nickname + "</h4><p class='time'>" + vo.regdate + "</p>" +
		"<p class='comment_section'>"+vo.content+"</p>'" +
		"</div>"; 
	
	$("#chatview-"+commentsNo).after(htmls);
		
};


/* 댓글의 댓글 리스트불러오기 */
var fetchReplyChat = function(commentsNo){
	
	$.ajax({
		url : "${pageContext.request.contextPath }/community/api/fetchreplychat?commentsNo="+commentsNo,
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

/*댓글의 댓글달기 쓰기 폼 */
var textchat = function(replyNo){
	
	var textareareply = "<div id='replyChatWrite'><textarea id='contentReply' aria-required='true' placeholder='내용 입력' cols='10' rows='4' class='form-control required'>" +
						"</textarea><button id='chatajax'class='chatText btn btn-white' type='submit' style='margin-top:12px;'>답글쓰기</button></div>"
		
	$("#chatview-"+replyNo).append(textareareply);
};


//게시글 삭제
var deletePost = function(boardNo){
	
	$.ajax({
		url : "${pageContext.request.contextPath }/community/api/deletepost",
		type : "post",
		data : "boardNo="+boardNo,
		success : function(response){
			if(response.result != "success"){
				console.error(response.message);
				return;
			}			
			location.href="${pageContext.request.contextPath}/community/freeboard";
		},	
		error : function(jqXHR, status, e) {
					console.log(status + ":" + e);
				}
		});

}

//댓글 삭제
var deleteReply = function(commentsNo){
		
	$.ajax({
		url : "${pageContext.request.contextPath }/community/api/deletereply",
		type : "post",
		data : "commentsNo="+commentsNo,
		success : function(response){
			if(response.result != "success"){
				console.error(response.message);
				return;
			}
			history.go(0);
		},	
		error : function(jqXHR, status, e) {
					console.log(status + ":" + e);
				}
		});
}

//댓글의 댓글 삭제
var deleteReplyChat = function(boardChatNo){
	
	$.ajax({
		url : "${pageContext.request.contextPath }/community/api/deletereplychat",
		type : "post",
		data : "boardChatNo="+boardChatNo,
		success : function(response){
			if(response.result != "success"){
				console.error(response.message);
				return;
			}
			history.go(0);
		},	
		error : function(jqXHR, status, e) {
					console.log(status + ":" + e);
				}
		});
}



// 메인 
$(function(){
 	
	//댓글 페치
	fetchReply();
	
	// 댓글 쓰기 통신
	$("#writeReply").submit(function(event){
		
		event.preventDefault();
		
		$.ajax({
			url : "${pageContext.request.contextPath }/community/api/writereply",
			type : "post",
			dataType : "json",
			data : "content="+$("#comment").val()+
				   "&users_no="+usersNo+
				   "&board_no="+boardNo,
			success : function(response){
				
				if(response.result != "success"){
					console.error(response.message);
					return;
				}
				
				renderReply(response.data);
				
				// 입력 후 textarea 리셋
				$("#comment").val("");
				$("#comment").html("");
				//$("#comment").focus();
			},
			error : function(jqXHR, status, e) {
				console.log(status + ":" + e);
			}
		});
	});
	
	
	
	// 댓글의 댓글 리스트 보기
	var flagDelete = 0;
	$(document).on("click", "#viewChat", function(){
		
		// flag 로 인한 댓글 펼치기 접기
		var commentsNo = $(this).data("cno1");
		
		if(flagDelete == 0){
			fetchReplyChat(commentsNo);
			flagDelete=1;
		}
		else{
			$("div").remove("#replyChatView");
			flagDelete=0;
		}
	});
	
	
	// 댓글의 댓글 쓰기 통신
	var flagReply = 0;
 	$(document).on("click", "#writeChat", function(){
		
		var replyNo = $(this).data("cno2");
		
		// 댓글의 댓글 쓰기 폼 펼치기,  접기
		if(flagReply==0){
			textchat(replyNo);
			flagReply = 1;
		}
		else{
			$("#replyChatWrite").remove();
			flagReply = 0;
		}
		//$("#replyChatWrite").toggleClass('hide');
		
		// 댓글의 댓글 작성 
		$("#chatajax").click(function(event){
			
			event.preventDefault();
				
			$.ajax({
				url : "${pageContext.request.contextPath }/community/api/writereplychat",
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
						renderReplyChat(response.data, replyNo);
						
						// 입력 후 textarea 리셋
						$("#contentReply").val("");
						$("#contentReply").html("");
						//$("#contentReply").focus();
				},	
				error : function(jqXHR, status, e) {
							console.log(status + ":" + e);
						}
					});
				});
			}); 
 	
 	
 	
 	
	// 삭제 버튼 생성 (본인 글일때만)
	if(boardUserNo == usersNo){
		$("#delete-view").attr('style', 'visible');
	}
	
	// 게시글 삭제 
	$(document).on("click", "#deletePost", function(event){
		
		event.preventDefault();
		
		var boardNo = $("#deletePost").val();

		alertify.confirm("글을 삭제하시겠습니까?",function(e){
				if(e){
					alertify.success("삭제완료", deletePost(boardNo));
				}else{
					alertify.error(' 글 삭제가 취소되었습니다.');
				}
		});
	});
	
	// 댓글 삭제
	$(document).on("click", "#deleteReply", function(event){
		
		event.preventDefault();
		
		var commentsUserNo = $("#deleteReply").val();
		var commentsNo = $(this).data("id");

		
 		if(usersNo == commentsUserNo){
			alertify.confirm("글을 삭제하시겠습니까?",function(e){
				if(e){
					alertify.success("삭제완료", deleteReply(commentsNo));
				}else{
					alertify.error(' 글 삭제가 취소되었습니다.');
				}
		});
		} 
 		else{
 			alertify.error('유저가 일치하지 않습니다.');
 		}
		
	});
	
	
	// 댓글의 댓글 삭제
	$(document).on("click", "#deleteReplyChat", function(event){
		
		event.preventDefault();
		
		var boardChatUserNo = $("#deleteReplyChat").val();
		var boardChatNo = $(this).data("id");

		
 		if(usersNo == boardChatUserNo){
			alertify.confirm("글을 삭제하시겠습니까?",function(e){
				if(e){
					alertify.success("삭제완료", deleteReplyChat(boardChatNo));
				}else{
					alertify.error(' 글 삭제가 취소되었습니다.');
				}
		});
		} 
 		else{
 			alertify.error('유저가 일치하지 않습니다.');
 		}
	});
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
			style="background-image:url(${pageContext.request.contextPath}/assets/template/images/parallax/page-title-parallax.jpg)">
			<div class="container">
			  <div class="page-title col-md-8">
				<h1><a href="${pageContext.request.contextPath}/community/galleryboard">갤러리 톡</a></h1>
				</div>
			</div>
		</section>
		<!-- END: PAGE TITLE -->


		<!-- CONTENT -->

			<div class="container">

				<!-- Blog post-->
				<div class="post-content post-content-single post-modern">
					<!-- Post item-->
					<div class="post-item">
						
						<div class="post-content-details">
						
							<div class="post-title">
								<h2> 제목 : ${map.boardVo.title } </h2>
							</div>
							
							<div class="post-info">
								<span class="post-autor"> 작성자 : <a href="#"> ${map.boardVo.nickname }</a></span> 
								<!--  <span class="post-category">in <a href="#">Productivity</a></span> -->
							</div>
							<div class="post-description">
								
								
								<p> ${fn:replace(map.boardVo.content, newLine, "<br>") }	<br><br><br><br><br></p>
								
								
							</div>
						</div>
						<div class="post-meta">
						
							<div class="post-date">
								<span class="post-date-day">${map.day }</span> 
								<span class="post-date-month">${map.month }월 <br><br>${map.year }년</span> 
							</div>

							<div class="post-comments">
								<a href="#"> <i class="fa fa-comments-o"></i> 
									<span class="post-comments-number">${map.boardVo.count }</span>
								</a>
							</div>
							<div id="delete-view" class="post-comments" style="visibility: hidden;">
									<button style="border:None; background:000;" id="deletePost" value="${map.boardVo.board_no }"><i class="fa fa-close"></i></button>
							</div>
							
						</div>
					</div>

					<!-- Comments-->
					<div id="comments" class="comments">
						<div class="heading">
							<h4 class="comments-title">
								댓글 <small class="number">${map.boardVo.count }</small>
							</h4>
						</div>

							<div id="attachReply">
						
							</div> 
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



		<!-- END: SECTION -->

		<!-- FOOTER -->
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
		<!-- END: FOOTER -->


	<!-- END: WRAPPER -->
	<!-- Theme Base, Components and Settings -->
	<script
		src="${pageContext.request.contextPath}/assets/template/js/theme-functions.js"></script>

	<!-- Custom js file -->
	<script
		src="${pageContext.request.contextPath}/assets/template/js/custom.js"></script>

</body>
</html>