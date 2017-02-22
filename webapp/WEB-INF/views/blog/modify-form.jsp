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

<!-- CKEDITOR SCRIPT -->
<script src="${pageContext.request.contextPath}/assets/ckeditor/ckeditor.js"></script>
<!-- <script src="//cdn.ckeditor.com/4.6.2/standard/ckeditor.js"></script> -->
<script src="${pageContext.request.contextPath}/assets/ckeditor/plugins/uploadimage/plugin.js"></script>
<script src="${pageContext.request.contextPath}/assets/ckeditor/plugins/widget/plugin.js"></script>

<!-- ALERTIFY SCRIPT -->
<script src="${pageContext.request.contextPath}/assets/alertify/alertify.js"></script>

<!--VENDOR SCRIPT-->
<script
	src="${pageContext.request.contextPath}/assets/template/vendor/jquery/jquery-1.11.2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/template/vendor/plugins-compressed.js"></script>

<!-- Write Page -->
<link 
	href="${pageContext.request.contextPath}/assets/css/write.css" 
	rel="stylesheet">	


<!-- User Profile -->
<script
	src="${pageContext.request.contextPath}/assets/js/userProfile.js"></script>
<link
	href="${pageContext.request.contextPath}/assets/css/userProfile.css"
	rel="stylesheet">
	

		
</head>
	
<body>
	<div class="wrapper">

		<!-- START: HEADER PAGE TITLE -->
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<!-- END: PAGE TITLE -->

		<!-- CONTENT -->
		<section class="content">
			<div class="container list_container">
				<!-- <form name="uploadImages" method="post" enctype="multipart/form-data">
						<div class="tab-pane" id="imageThum">
							<label>썸네일</label>
							<input id="post_image" type="file" class="btn btn-default btn-sm" accept="image/*" onchange="loadFile(event)">
							<img id="output" width="200px" height="150px" /> <br>
							<button id="post_imageThum" class="btn btn-white">save</button>
						</div>
					</form> -->
					

				<form class="thumnail-upload">
					<label>썸네일</label>
					<input id="post_image" type="file" name="${post_map.post_image}" class="btn btn-white btn-sm" accept="image/*" onchange="loadFile(event)">
					<img id="output" width="200px" height="150px" /> <br>
					<button id="post_imageThum" class="btn btn-white">save</button>
				</form><br><br>
				
					


				<form action= "${pageContext.request.contextPath }/post/${authUser.nickname}/insert" method="post"  >
					  
					  <c:set var="publish" value="${post_map.publish}" />
					  <c:choose>
					  	<c:when test="${publish eq 1}"> 
					  		  <fieldset>
							    <legend>다이어리 공개 </legend>
							    <label for="radio-1">공개</label>
							    <input type="radio" name="publish" id="diaryOpen" value="1">
							    <label for="radio-2">비공개</label>
							    <input type="radio" name="publish" id="diaryClosed" value="0">
							  </fieldset>
							    <br><br>
					  	</c:when>
					  	
					  	<c:otherwise>
					  		  <fieldset>
							    <legend>다이어리 공개 </legend>
							    <label for="radio-1">공개</label>
							    <input type="radio" name="publish" id="diaryOpen" value="0">
							    <label for="radio-2">비공개</label>
							    <input type="radio" name="publish" id="diaryClosed" value="1">
							  </fieldset>
							    <br><br>
					  	</c:otherwise>
					  
					  
					  
					  </c:choose>
					  
				 <!-- <fieldset>
					    <legend>다이어리 공개 </legend>
					    <label for="radio-1">공개</label>
					    <input type="radio" name="publish" id="diaryOpen" value="1">
					    <label for="radio-2">비공개</label>
					    <input type="radio" name="publish" id="diaryClosed" value="0">
					  </fieldset>
					  
					  <br><br> -->
					  
					  <fieldset>
					    <legend>커뮤니티 업로드 </legend>
					    <label for="radio-1">공개</label>
					    <input type="radio" name="shared" id="communityOpen" value="1">
					    <label for="radio-2">비공개</label>
					    <input type="radio" name="shared" id="communityClosed" value="0">
					  </fieldset>
					  
					  <br><br>
					  
					  <script>
					  var content = ${post_map.content}
					  CKEDITOR.instances.ckeditor.setData('<p>' + content + '</p>');
					  </script>
					  
					<textarea class="form-control required" aria-required="true" name="title" placeholder="${post_map.title}" rows="1" style="font-size:20px"></textarea>
		            <input type="hidden" class="post_imagebox" name="post_image" >
		            <textarea name="content" id="ckeditor" rows="10" cols="80"></textarea>
		            <input type="submit" class="btn btn-white pull-right" id="posting" style="margin-right:0; margin-top:10px; ">
       			</form>
			</div>

		</section>
		
		<script>
		$(document).ready(function() {
			$("#diaryClosed").click(function(){
				$("#communityOpen").attr("disabled", true)
				$("#communityClosed").attr("checked", true)
			});
			
			$("#diaryOpen").click(function(){
				$("#communityOpen").removeAttr("disabled");
			});
		})
		
		
		</script>
			

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

	<script>
	var loadFile = function(event) {
		var output = document.getElementById('output');
		output.src = URL.createObjectURL(event.target.files[0]);
	};
	
	
	
	$(function(){
		
		var savaFileName;
		var image_path = "${pageContext.request.contextPath}";
		
		
		$("#post_imageThum").click(function(e) {
			e.preventDefault();
			var formData = new FormData();
			post_image = $("#post_image").get(0).files[0];

			if (post_image != null) {
				formData.append("post_image",post_image);
				controllerUrl = "post_imageupload";
				} 
					$.ajax({
						url : "${pageContext.request.contextPath}/post/api/"+ controllerUrl,
						type : "post",
						data : formData,
						processData : false,
						contentType : false,
						success : function(response){
							saveFileName = response.data;
							console.log(saveFileName)
							/* var path = saveFileName; */
							
							$(".post_imagebox").attr("value", saveFileName);
							console.log("${pageContext.request.contextPath}");
							alert("썸네일 이미지가 업로드 되었습니다.")
						}
				})
			
			
		})
	});
	</script>


	<!-- post 최신 글 9개 불러오는 ajax list -->
	<script>
            CKEDITOR.replace( 'ckeditor', {//해당 이름으로 된 textarea에 에디터를 적용 <-- 이거 이름 부분입니다.
            customConfig: '${pageContext.request.contextPath}/assets/ckeditor/config.js',
            startupFocus : false,  // 자동 focus 사용할때는  true
            enterMode :CKEDITOR.ENTER_BR,
            width:'100%',
            height:'600px',
            filebrowserImageUploadUrl:"${pageContext.request.contextPath }/image/upload",
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
		
		$("#posting").on('click', function(){
			alertify.success("Success notification");
			console.log("alert")
		});
		
		/* $("input").click(function(){
			alertify.success("Success notification");
		}) */
		</script>


	<!-- user profile modal -->
	<script>
	$(document).on('ready', function(){
	    $modal = $('.modal-frame');
	    $overlay = $('.modal-overlay');

	    /* Need this to clear out the keyframe classes so they dont clash with each other between ener/leave. Cheers. */
	    $modal.bind('webkitAnimationEnd oanimationend msAnimationEnd animationend', function(e){
	      if($modal.hasClass('state-leave')) {
	        $modal.removeClass('state-leave');
	      }
	    });

	    $('.closeProfile').on('click', function(){
	      $overlay.removeClass('state-show');
	      $modal.removeClass('state-appear').addClass('state-leave');
	    });

	    $('.openProfile').on('click', function(){
	      $overlay.addClass('state-show');
	      $modal.removeClass('state-leave').addClass('state-appear');
	    });

	  });
	
	</script>

</body>
</html>