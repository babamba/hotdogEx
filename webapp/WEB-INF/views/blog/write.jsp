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

<script src="//cdn.ckeditor.com/4.6.2/standard/ckeditor.js"></script>
<%-- <script src="${pageContext.request.contextPath}/assets/ckeditor/ckeditor.js"></script> --%>
<script src="${pageContext.request.contextPath}/assets/ckeditor/config.js"></script>
<script src="${pageContext.request.contextPath}/assets/alertify/alertify.js"></script>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/alertify/alertify.default.css">
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
	
	
	<%-- <div class="banner-bg" id="top">
	<form action="${pageContext.request.contextPath }/post/${authUser.nickname}/insert" method="post">
	 	<textarea class="form-control" name="title" placeholder="제목을 입력하세요." rows="1" style="font-size:20px"></textarea>
	 	<textarea id="summernote"  name=content>
	 	
	 	
	 	</textarea>
	 	
	 	
		<input type="submit" class="btn btn-default">	
	</form>
	
</div> --%>
<div class="banner-bg" id="top">
		<form action= "${pageContext.request.contextPath }/post/${authUser.nickname}/insert" method="post">
			<textarea class="form-control" name="title" placeholder="제목을 입력하세요." rows="1" style="font-size:20px"></textarea>
            <textarea name="content" id="ckeditor" rows="10" cols="80">
                This is my textarea to be replaced with CKEditor.
            </textarea>
             <input type="submit" class="btn btn-default" id="posting">
        </form>
        
            <script>
            CKEDITOR.replace( 'ckeditor', {//해당 이름으로 된 textarea에 에디터를 적용 <-- 이거 이름 부분입니다.
            startupFocus : false,  // 자동 focus 사용할때는  true
            enterMode :CKEDITOR.ENTER_BR,
            allowedContent:true,
            width:'100%',
            height:'600px',
            filebrowserImageUploadUrl: '${pageContext.request.contextPath }/image/upload', //여기 경로로 파일을 전달하여 업로드 시킨다.
            customConfig: '${pageContext.request.contextPath}/assets/ckeditor/config.js'
            
            // JSP, PHP 공통입니다. 경로를 적당히 적어줍니다.
        });
            </script> 
            
        <script type='text/javascript'>
		CKEDITOR.on('dialogDefinition', function (ev) {
			var dialogName = ev.data.name;
			var dialog = ev.data.definition.dialog;
			var dialogDefinition = ev.data.definition;

				if (dialogName == 'image') {
					dialog.on('show', function (obj) {
					this.selectPage('Upload'); //업로드텝으로 시작
				});

				dialogDefinition.removeContents('advanced'); // 자세히탭 제거
				dialogDefinition.removeContents('Link'); // 링크탭 제거
			}
		});
		</script>
		
        <script>
        
       
        
        </script>
            
            
		</div>
		
		
		<script>
		
		$("#posting").on('click', function(){
			alertify.success("Success notification");
			console.log("alert")
		});
		
		/* $("input").click(function(){
			alertify.success("Success notification");
		}) */
		</script>
		
	
	
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
</html>