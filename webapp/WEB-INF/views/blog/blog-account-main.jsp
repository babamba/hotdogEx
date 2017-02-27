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
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/images/favicon.png">
<title>Hot dog</title>

<head>

<link
	href="${pageContext.request.contextPath}/assets/css/account-main.css"
	rel="stylesheet">

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
<%-- <script src="${pageContext.request.contextPath}/assets/ckeditor/ckeditor.js"></script> --%>
<script src="//cdn.ckeditor.com/4.6.2/standard/ckeditor.js"></script>

<!-- ALERTIFY SCRIPT -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/alertify/alertify.core.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/alertify/alertify.default.css">

<script src="${pageContext.request.contextPath}/assets/alertify/alertify.js"></script>


<!--VENDOR SCRIPT-->
<script
	src="${pageContext.request.contextPath}/assets/template/vendor/jquery/jquery-1.11.2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/template/vendor/plugins-compressed.js"></script>


<!--Date picker-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/template/vendor/moment.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/template/vendor/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/template/vendor/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" />


<!-- User Profile -->
<script
	src="${pageContext.request.contextPath}/assets/js/userProfile.js"></script>
<link
	href="${pageContext.request.contextPath}/assets/css/userProfile.css"
	rel="stylesheet">


<!-- Account Main -->
<body class="boxed background-grey">
	<div class="wrapper" style="border:none;">

		<!-- START: HEADER PAGE TITLE -->
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<!-- END: PAGE TITLE -->

		<!-- CONTENT -->
		<section class="content">
			<!-- account nav 시작 -->
			<div class="container list_container">

				<!--  *************************** 상단 메뉴 *************************************** -->

				<div class="account_nav">
					<div class="tabs_navigation">
					
						<!-- Tabs with icons on Card -->
							<div id="tabs-03" class="tabs justified">

								<ul class="tabs-navigation">

									<li class="social-facebook"><a href="#user_profile"><i
											class="fa fa-user"></i> 유저 프로필 설정</a>
									</li>

									<li class="social-facebook"><a href="#pet_profile"> <i
											class="fa fa-user"></i> 펫 프로필 설정</a>
									</li>

									<li class="social-facebook"><a href="#blog_profile"><i
											class="fa fa-user"></i> 블로그 설정</a>
									</li>

									<li class="social-facebook"><a href="#secret"><i
											class="fa fa-lock"></i>보안번호 설정</a>
									</li>

								</ul>


								<div class="tabs-content">
								
									<div class="tab-pane" id="user_profile">
										<form name="uploadImages" method="post" enctype="multipart/form-data" class="upload_modify">
											<div class="user_modify_intro text-center">
												<h4>유저 프로필 설정</h4>
												<p>유저 프로필 설정</p>
											</div>
											
											<div class="user_image_modify text-center" style="border:1px solid right #ddd" >

											<div class="user_image_box">
												<span class="label label-info">프로필 사진을 넣어주세요.</span> 
												<input id="userimage" type="file" accept="image/*"onchange="loadFile(event)"> 
												<img id="output"/>
												
											</div>
											
										</div>
										<!-- <div class="clearfix"></div> -->
										
										
										<div class="user_profile_modify col-md-6">
											
												<div class="input-group">
													<span class="input-group-addon">
														<i class="fa fa-group"></i>
													</span>
													<input id="nickname" type="text"
														class="form-control" placeholder="${map.userVo.nickname }"
														onkeydown='return nickCheck(event)'>
												</div>
											

											
												<div class="input-group">
													<span class="input-group-addon"> 
														<i class="fa fa-group"></i>
													</span>
													
													<input id="infomation"
														type="text" class="form-control"
														placeholder="${map.userVo.infomation }">
												</div>
												
												<div class="input-group password_start">
													<span class="input-group-addon">
														<i class="fa fa-group"></i>
													</span> 
													
													<input id="pass_word" type="password"
														   class="form-control"
														   placeholder="${map.userVo.pass_word }">
												</div>
												
												<div class="input-group">
													<span class="input-group-addon">
														<i class="fa fa-group"></i>
													</span>
													<input id="pass_wordCheck" type="password"
															class="form-control"
															placeholder="${map.userVo.pass_word }">
												</div>
												
												<button id="userProfileSave" class="btn btn-primary btn-sm pull-right">저장 </button>
											</form>
												<button id="nicknameCheck" class="btn btn-primary btn-sm pull-right">닉네임 중복검사</button>
											</div>
											
										</div>
										
									

									<div class="tab-pane" id="pet_profile">
										<form name="uploadImages" method="post" enctype="multipart/form-data" class="upload_modify">
										<div class="pet_modify_intro text-center">
											<h4>펫 프로필 설정</h4>
											<p>펫 프로필 설정</p>
										</div>
										
										<div class="pet_image_modify" style="border:1px solid right #ddd; width:520px;" >

											<div class="pet_image_box col-md-12">
												<span class="label label-info">애완동물의 사진을 넣어주세요.</span> 
												<input id="petimage" type="file" accept="image/*"onchange="loadFile3(event)"> 
												<img id="output3"/>
												
											</div>
										</div>
										
										
										
										<div class="user_profile_modify col-md-6">
											
												<fieldset style="margin-bottom:19px;">
														<legend>성별</legend>
														<c:choose>
															<c:when test="${'male' == map.petVo.gender }">
																<label>여</label>
																<input type="radio" name="gender" value="female">
																<label>남</label>
																<input type="radio" name="gender" value="male"
																	checked="checked">
															</c:when>
															<c:otherwise>
																<label>여</label>
																<input type="radio" name="gender" value="female"
																	checked="checked">
																<label>남</label>
																<input type="radio" name="gender" value="male">
															</c:otherwise>
														</c:choose>
														
														<div id="datetimepicker1" class="input-group date">
															<input type="text" name="co_date" id="co_datepick" class="form-control">
															<span class="input-group-addon">
                    											<span class="fa fa-calendar"></span>
															</span>
														</div>
												</fieldset>

												<div class="input-group">
													<span class="input-group-addon">
														<i class="fa fa-group"></i>
													</span>
													<input id="petName" type="text" name="petname"
														class="form-control" placeholder="${map.petVo.name }">
												</div>
												
												<div class="input-group">
													<span class="input-group-addon"> 
														<i class="fa fa-group"></i>
													</span>
													
													<input id="petInfo" name="petinfo" type="text" class="form-control"
																placeholder="${map.petVo.info }">
												</div>
												
												<div class="input-group">
															<span class="input-group-addon"> <i
																class="fa fa-group"></i>
															</span> <input id="age" name="age" type="text" class="form-control"
																placeholder="${map.petVo.age }"
																onkeydown='return onlyNumber(event)'
																onkeyup='removeChar(event)' style='ime-mode: disabled;'>
												</div>
										</div>
										<div class="petfileButton center-block">
											<button id="petProfileSave" class="btn btn-primary btn-sm center-block">펫 프로필 저장</button>
										</div>
									</form>
								</div>
									
								<div class="tab-pane" id="blog_profile">
									<form name="uploadImages" method="post" enctype="multipart/form-data" class="upload_modify">
										
										<div class="blog_modify_intro text-center">
											<h4>블로그 설정</h4>
											<p>블로그 설정</p>
										</div>
									
									   
									    
											<div class="blog_image_modify" style="margin-left:0; border:1px solid right #ddd; width:520px;">
												
												<div class="blog_image_box col-md-12">
													<span class="label label-info">블로그 대표사진을 넣어주세요.</span>
													<input id="blogimage" type="file" accept="image/*" onchange="loadFile2(event)" > 
													<img id="output2"/>
												</div>
											</div>
										
										
										<div class="blog_profile_modify col-md-6" >
											<div class="input-group">
												<span class="input-group-addon"><i class="fa fa-group"></i></span>
												<input id="title" type="text" class="form-control"placeholder="${map.blogVo.title }">
											</div>
										</div>
										
										<div class="blogProfileButton center-block text-center">
											<button id="blogProfileSave" class="btn btn-primary btn-sm">저장 </button>
										</div>
									</form>
								</div>
									
									
									<div class="tab-pane" id="secret">
										<h4>보안번호 설정</h4>
										<p>보안번호 설정</p>
									</div>
								</div>

							</div>
							<!--  ************************************** 개인 프로필 수정  ************************************************** -->



					</div>
				</div>
				<!--  *************************** 상단 메뉴 *************************************** -->





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



	<!-- user profile modal -->
	<script>
		$(document).on('ready',function() {
							$modal = $('.modal-frame');
							$overlay = $('.modal-overlay');

							/* Need this to clear out the keyframe classes so they dont clash with each other between ener/leave. Cheers. */
							$modal
									.bind(
											'webkitAnimationEnd oanimationend msAnimationEnd animationend',
											function(e) {
												if ($modal
														.hasClass('state-leave')) {
													$modal
															.removeClass('state-leave');
												}
											});

							$('.closeProfile').on(
									'click',
									function() {
										$overlay.removeClass('state-show');
										$modal.removeClass('state-appear')
												.addClass('state-leave');
									});

							$('.openProfile').on(
									'click',
									function() {
										$overlay.addClass('state-show');
										$modal.removeClass('state-leave')
												.addClass('state-appear');
									});

						});
	
		// 이미지 미리보기
		var loadFile = function(event) {
			var output = document.getElementById('output');
			output.src = URL.createObjectURL(event.target.files[0]);
		};

		var loadFile2 = function(event) {
			var output2 = document.getElementById('output2');
			output2.src = URL.createObjectURL(event.target.files[0]);
		};

		// 정보 처리
		var nickname;
		var title;
		var infomation;
		var password;
		var userimage;
		var blogimage;
		var controllerUrl;

		$("#nicknameCheck").prop("disabled", true);

		// 입력하면 저장버튼 비활성화
		function nickCheck(event) {
			$("#userProfileSave").prop("disabled", true);
			$("#nicknameCheck").prop("disabled", false);
		}

		$(function() {
			// blog , user 데이터 전달
			$("#userProfileSave").click(function() {
							if ($("#pass_word").val() != $("#pass_wordCheck").val()) {
								alertify.error("입력하신 비밀번호가 일치하지 않습니다.");
								return false;
							}

							var formData = new FormData();

							nickname = $("#nickname").val();
						
							infomation = $("#infomation").val();
							password = $("#pass_word").val();
							userimage = $("#userimage").get(0).files[0];
							

							formData.append("nickname", nickname);
							formData.append("infomation", infomation);
							formData.append("pass_word", password);

							if (userimage != null) {
								formData.append("userimage", userimage);
								controllerUrl = "userprofilemodify";
							} else {
								controllerUrl = "userprofilemodify2";
							}
							

							$.ajax({
								url : "${pageContext.request.contextPath}/user/account/"+ controllerUrl,
								type : "post",
								data : formData,
								processData : false,
								contentType : false
									})
						})

			// 닉네임 체크
			$("#nicknameCheck").click(
				function() {
					nickname = $("#nickname").val();
						if (nickname == "") {
							return;
							}
						$.ajax({
							url : "${pageContext.request.contextPath}/user/nickCheck?nickname="+ nickname,
							type : "get",
							dataType : "json",
							data : "",
							success : function(response) {
								if (response.data == "yes") {
									alertify.success("사용가능 합니다.");
										$("#userProfileSave").prop("disabled", false);
									
								}if (response.data == "no") {
									alertify.error("이미 사용중인 닉네임 입니다.");
								}if (response.result == "fail") {
									alertify.error("에러");
									}
								}
							})
						})
					})
					
			
						
					
			$(function() {
			// blog , user 데이터 전달
			$("#blogProfileSave").click(
						function() {
								var formData = new FormData();

								title = $("#title").val();
								blogimage = $("#blogimage").get(0).files[0];
								
								
								if( blogimage == null && title != null){
									formData.append("title",title);
									controllerUrl="blogprofilemodify";
								}
								if ( blogimage != null && title == null){
									formData.append("blogimage",blogimage);
									controllerUrl = "blogprofilemodify2";
								}
								if( blogimage != null && title != null){
									formData.append("blogimage",blogimage);
									formData.append("title",title);
									controllerUrl="blogprofilemodify2";
								}

								$.ajax({
									url : "${pageContext.request.contextPath}/user/account/"+ controllerUrl,
									type : "post",
									data : formData,
									processData : false,
									contentType : false
										})
							});
			});
	
	
		var petimage;
		var petname;
		var petinfo;
		var co_date;
		var gender;
		var age;
		var petUrl;

		/* $(function(){
			$("#co_datepick").datepicker();
		}) */

		var loadFile3 = function(event) {
			var output3 = document.getElementById('output3');
			output3.src = URL.createObjectURL(event.target.files[0]);
		};

		$("#petProfileSave").click(
				function() {
					var formData = new FormData();

					petUrl = "/petprofilemodify"
					petimage = $("#petimage").get(0).files[0];
					petname = $("#petName").val();
					petinfo = $("#petInfo").val();
					co_date = $("#co_datepick").val();
					age = $("#age").val();
					gender = $(":input:radio[name=gender]:checked").val();

					formData.append("petname", petname);
					formData.append("petinfo", petinfo);
					formData.append("co_date", co_date);
					formData.append("gender", gender);
					formData.append("age", age)

					if (petimage != null) {
						formData.append("petimage", petimage);
						petUrl = "/petprofilemodify2";
					}

					$.ajax({
						url : "${pageContext.request.contextPath}/user/account"
								+ petUrl,
						type : "post",
						data : formData,
						processData : false,
						contentType : false
					})

				})
	
		// 클릭시 비교
		var secretNumber;
		var secretNumberCheck;

		$(function() {

			$("#secretNumberSave").click(function() {

				secretNumber = $("#secretNumber").val();
				secretNumberCheck = $("#secretNumberCheck").val();

				if (secretNumber > 999999) {
					alertify.error(" 1000 ~ 999999 까지의 숫자를 입력해주세요");
					return false;
				}
				if (secretNumber < 1000) {
					alertify.error(" 1000 ~ 999999 까지의 숫자를 입력해주세요");
					return false;
				}
				if (secretNumber != secretNumberCheck) {
					alertify.error("입력하신 두 보안번호가 일치하지 않습니다.");
					return false;
				}
				return true;
			})
		})

		// 문자를 빼버리고 숫자만 입력받기
		function onlyNumber(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
					|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
				return;
			else
				return false;
		}
		function removeChar(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
				return;
			else
				event.target.value = event.target.value.replace(/[^0-9]/g, "");
		}
	
	$(function() {
			$("#datetimepicker1").datetimepicker({
				useCurrent: ('year', 'month', 'day'),
				format: 'MM/DD/YYYY'
			});
		});
	</script>




</body>
</html>