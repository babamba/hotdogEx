<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->

<html class="no-js">
<!--<![endif]-->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Hot dog</title>
<head>
<meta name="description" content="">

<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">
.list_container div {
	width: 300px;
	background: #fff;
	padding: 15px;
	padding-bottom: 15px;
	margin: 15px;
	box-shadow: 5px 5px 10px #f2f2f2;
}

.list_container div img {
	width: 100%;
	border-bottom: 1px solid #ccc;
	padding-bottom: 15px;
	margin-bottom: 5px;
}

.list_container div h5{
	font-size:1.4em;
	text-align:center;
}


.list_container div p {
	text-align:center;
	font-family: "맑은 고딕", 돋움;
	display:inline-block;
	padding-right:10px;
	color: #333;
	margin: 0;
	padding: 10px;
}

.list_content{
	overflow: hidden; 
	text-overflow: ellipsis;
	white-space: nowrap; 
	font-family: "맑은 고딕", 돋움;
	text-align:center;
	padding-right:10px;
	color: #333;
	margin: 0;
	padding: 10px;
}

</style>


<meta name="viewport" content="width=device-width, initial-scale=1">

 <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/lightbox/dist/css/lightbox.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/normalize.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/font-awesome.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/swiper.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/diary/diary.css">

<!--     Fonts and icons     -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

<!-- CSS Files -->
<link
	href="${pageContext.request.contextPath}/assets/css/material-kit.css"
	rel="stylesheet" />

<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="${pageContext.request.contextPath}/assets/css/demo.css"
	rel="stylesheet" />


<script src="${pageContext.request.contextPath}/assets/js/min/jquery-1.10.2.min.js"></script>

<script
	src="${pageContext.request.contextPath}/assets/js/min/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/jquery.vgrid.js"></script>
<script 	
	src="${pageContext.request.contextPath}/assets/lightbox/dist/js/lightbox.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/jquery.easing.1.3.js"></script>

<script
	src="${pageContext.request.contextPath}/assets/js/min/material.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/material-kit.js"
	type="text/javascript"></script>



<script
	src="${pageContext.request.contextPath}/assets/js/min/swiper.jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/min/plugins.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/min/main.min.js"></script>



<!--   Core JS Files   -->
<script
	src="${pageContext.request.contextPath}/assets/js/min/material.min.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script
	src="${pageContext.request.contextPath}/assets/js/min/nouislider.min.js"
	type="text/javascript"></script>
<!--  Plugin for the Datepicker, full documentation here: http://www.eyecon.ro/bootstrap-datepicker/ -->
<script
	src="${pageContext.request.contextPath}/assets/js/bootstrap-datepicker.js"
	type="text/javascript"></script>
<!-- Control Center for Material Kit: activating the ripples, parallax effects, scripts from the example pages etc -->

<script
	src="${pageContext.request.contextPath}/assets/js/min/modernizr-2.6.2.min.js"></script>
<script>
	



 $(function(){
    $(".list_container").vgrid({
        easing: "easeOutQuint",
        time: 500,
        delay: 20,
        fadeIn: {
            time: 300,
            delay: 50
        }
    }).click(function(){
    	console.log("list click!!!");
    })
}); 

  


var isEnd = false;
var authUser = ${authUser.users_no};
var page = 0;			// 게시글의 0번째 인덱스 
var pluspage = 5;	// 게시글이 15개씩 fetchList로 로딩 되니까 fetchList가 요청될 시 15만큼 더해서 db인덱스값을 더해서 요청한다.

var render = function(vo, mode){
		
 var htmls = "<div><img src='${pageContext.request.contextPath}/assets/sample-images/image_1.jpg'><h5>" + vo.title + "</h5>" + 
			 "<ul class='list_content'><li>" + vo.regdate + "</li><li>" + vo.content + "</li>" + 
			 "</ul></div>"

	console.log("htmls");
			
	if(mode == true ){
		$(".list_container").prepend(htmls);
	}else{
		$(".list_container").append(htmls);
	}
}



var fetchList = function(){
	console.log("fetchList")
	if(isEnd == true){
		  return;
	  }
	
	  console.log(page);
	  
	  $.ajax({
		url: "${pageContext.request.contextPath }/post/api/list?p=" + page + "&no=" + authUser,
		type: "get",
		dataType: "json",
		data:"",
		success: function(response){

			if(response.result != "success"){
				console.error(response.message);
				isEnd = true;
				return;
			}
			
		$(response.data).each(function(index, vo){
			render(vo, false);
			console.log("render")
		});
		
		if( response.data.length < 10 ) {
			isEnd = true;
			$( ".load-more-link" ).prop( "disabled", true );
		}
		
		
		},
	error: function(jqXHR, status, e){
		console.error(status + ":" + e)
	}
});
}
$(function(){
	fetchList();
});


	
	  $(function(){
		$(window).scroll( function(){
			var $window = $(this);				  // 브라우저 창 기준
			var scrollTop = $window.scrollTop();  // 스크롤의 현재 위치
			var windowHeight = $window.height();  // 윈도우창의 높이 가변
			var documentHeight = $( document ).height();  //문서의 기준
			
			
			// 창사이즈가 줄어들수록 window 값을 달라짐.
			// 스크롤의 맨마지막 top값을 알려면 
			// 문서높이  - 브라우저 창 높이 = 스크롤 스크롤 창 끝
			
			
			// 스크롤 바가 바닥까지 왔을 때( 10px 덜 왔을 때 )
			if( scrollTop == documentHeight - windowHeight ) {
				console.log( "call fetchList" );
				fetchList();
				++page;
				page = page * pluspage;
			}
		});
		fetchList();
		++page;
		page = page * pluspage;
	});
	  
	$('.banner-bg').vgrid({
			time:400,
			delay:30,
			wait:500
	});	  
	  
  </script>


</head>
<body>

	<!-- Fixed-bar -->
	<c:import url="/WEB-INF/views/includes/fixed_bar.jsp" />

	<!-- 반응형 navigation -->
	<c:import url="/WEB-INF/views/includes/navigation.jsp" />

	<a
		href="${pageContext.request.contextPath}/diary/${authUser.nickname}/write">포스트하기</a>

	<!-- 포스트 리스트 -->
	<c:import url="/WEB-INF/views/includes/diary_list_test.jsp" />

	<!-- Modal -->
	<c:import url="/WEB-INF/views/includes/modal.jsp" />






</body>

</html>