<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<title>Hot dog</title>
<head>

<script src="${pageContext.request.contextPath }/assets/js/min/jquery-1.10.2.min.js" type="text/javascript"></script>

<!-- include summernote css/js-->
<link href="${pageContext.request.contextPath}/assets/summernote/summernote.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/assets/summernote/summernote.js"></script>
<script src="${pageContext.request.contextPath}/assets/summernote/summernote-ko-KR.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 



<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/normalize.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/font-awesome.css">
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css"> --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css">

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



</head>


<body>
	<!-- Fixed-bar -->
	<c:import url="/WEB-INF/views/includes/fixed_bar.jsp" />

	<!-- 반응형 navigation -->
	<c:import url="/WEB-INF/views/includes/navigation.jsp" />
	
	
	<div class="banner-bg" id="top">
	<form action="${pageContext.request.contextPath }/post/${authUser.nickname}/insert" method="post">
	 	<textarea class="form-control" name="title" placeholder="제목을 입력하세요." rows="1" style="font-size:20px"></textarea>
	 	<textarea id="summernote"  name=content>
	 	
	 	
	 	</textarea>
	 	
	 	
		<input type="submit" class="btn btn-default">	
	</form>
	
</div>
	
	<%-- <!-- 스마트에디터 -->
	<c:import url="/WEB-INF/views/includes/smartediter.jsp" /> --%>
	
	
	<!-- Modal -->
	<c:import url="/WEB-INF/views/includes/modal.jsp" />

	
 	
 	
 	<script
		src="${pageContext.request.contextPath}/assets/js/min/bootstrap.min.js"></script>
	
	<script
		src="${pageContext.request.contextPath}/assets/js/min/swiper.jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/min/plugins.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/main.js" ></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/email.js" ></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/toggle.js" ></script>	

	<script
		src="${pageContext.request.contextPath}/assets/js/min/nouislider.min.js" ></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap-datepicker.js" ></script>
	
	
	<script
		src="${pageContext.request.contextPath}/assets/js/min/modernizr-2.6.2.min.js"></script>
		
	

</body>
<script>
var IMAGE_PATH = 'http://localhost:8087/hotdog/hotdog/image/user/';

$(function(){
	$('#summernote').summernote({
		
		
		callbacks:{
			onImageUpload : function(file, editor, welEditable) {
		        sendFile(file[0], editor, welEditable);  
		    }
		},
	placeholder: 'Escribe aquí',
	height : 700, // set editor height
	minHeight : 100, // set minimum height of editor
	maxHeight : null, // set maximum height of editor
	lang : 'ko-KR', // default: 'en-US'
	focus: true
	
	
	});
	
	function sendFile(file, editor, welEditable) {
	    imagedata = new FormData();
	    
	    imagedata.append("file", file);
	    
	    alert("file upload" + file);
	    
	    $.ajax({
	        data : imagedata,
	        type : "POST",
	        url : "${pageContext.request.contextPath }/post/upload",
	        contentType : false,
	        processData : false,
	        success : function(imagedata) {
	        	console.log(imagedata);
	        	
	        	var data_path = imagedata.data;
	        	console.log(data_path);
	        	
	        	var image = $('<img>').attr('src', data_path);
	        	$("#summernote").summernote("insertNode", image[0]);
	        	
	            editor.insertImage(welEditable, imagedata);
	        }, error: function(jqXHR, textStatus, errorThrown){
	        	console.log(textStatus+ "" + errorThrown)
	        }
	    });
	}
})


	
</script>

</html>