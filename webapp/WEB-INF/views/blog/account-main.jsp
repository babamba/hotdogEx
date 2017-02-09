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
<script
	src="${pageContext.request.contextPath}/assets/alertify/alertify.js"></script>

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
<body>
	<div class="wrapper">

		<!-- START: HEADER PAGE TITLE -->
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<!-- END: PAGE TITLE -->

		<!-- CONTENT -->
		<section class="content">
			<!-- account nav 시작 -->
			<div class="container list_container">

				<!--  *************************** 상단 메뉴 *************************************** -->

				<div class="account_nav">
					<div class="account_navigation">
						<!-- Tabs with icons on Card -->

						<div class="card card-nav-tabs">

							<div class="header header-custom">
								<!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
								<div class="nav-tabs-navigation">
									<div class="nav-tabs-wrapper">
										<ul class="nav nav-tabs" data-tabs="tabs">
											<li class="active"><a href="#secret" data-toggle="tab">
													<i class="material-icons">face</i> 보안번호
											</a></li>
											<li><a href="#profile" data-toggle="tab"> <i
													class="material-icons">chat</i> 프로필 설정
											</a></li>
											<li><a href="#settings" data-toggle="tab"> <i
													class="material-icons">build</i> 관심 다이어리
											</a></li>
											<li><a href="#QA" data-toggle="tab"> <i
													class="material-icons">face</i> Q/A 게시글
											</a></li>
											<li><a href="#customer" data-toggle="tab"> <i
													class="material-icons">face</i> 고객문의
											</a></li>
										</ul>
									</div>
								</div>
							</div>

							<!--  *************************** 컨텐츠 부분 시작 *************************************** -->
							<div class="content">
								<div class="tab-content text-center">


									<!--  *************************** 보안 번호 입력  *************************************** -->
									<div class="tab-pane active" id="secret">
										<div class="user_password">
											<form method="post"
												action="${pageContext.request.contextPath }/user/account/secretmodify">

												<div class="col-sm-4">
													<div class="input-group">
														<span class="input-group-addon"> <i
															class="fa fa-group"></i>
														</span> <input id="secretNumber" type="password"
															class="form-control" onkeydown='return onlyNumber(event)'
															onkeyup='removeChar(event)' style='ime-mode: disabled;'
															placeholder="Secret Number " name="sec_pass_word">
													</div>
												</div>
												<div class="col-sm-4">
													<div class="input-group">
														<span class="input-group-addon"> <i
															class="fa fa-group"></i>
														</span> <input id="secretNumberCheck" type="password"
															class="form-control" onkeydown='return onlyNumber(event)'
															onkeyup='removeChar(event)' style='ime-mode: disabled;'
															placeholder="Secret Number Check">
													</div>
												</div>
												<input type="submit" id="secretNumberSave"
													class="btn btn-primary btn-sm" value="저장" />

											</form>
										</div>
									</div>

									<script>
										// 클릭시 비교
										var secretNumber;
										var secretNumberCheck;

										$(function() {

											$("#secretNumberSave")
													.click(
															function() {

																secretNumber = $(
																		"#secretNumber")
																		.val();
																secretNumberCheck = $(
																		"#secretNumberCheck")
																		.val();

																if (secretNumber > 999999) {
																	alert(" 1000 ~ 999999 까지의 숫자를 입력해주세요");
																	return false;
																}
																if (secretNumber < 1000) {
																	alert(" 1000 ~ 999999 까지의 숫자를 입력해주세요");
																	return false;
																}
																if (secretNumber != secretNumberCheck) {
																	alert("입력하신 두 보안번호가 일치하지 않습니다.");
																	return false;
																}
																return true;
															})
										})

										// 문자를 빼버리고 숫자만 입력받기
										function onlyNumber(event) {
											event = event || window.event;
											var keyID = (event.which) ? event.which
													: event.keyCode;
											if ((keyID >= 48 && keyID <= 57)
													|| (keyID >= 96 && keyID <= 105)
													|| keyID == 8
													|| keyID == 46
													|| keyID == 37
													|| keyID == 39)
												return;
											else
												return false;
										}
										function removeChar(event) {
											event = event || window.event;
											var keyID = (event.which) ? event.which
													: event.keyCode;
											if (keyID == 8 || keyID == 46
													|| keyID == 37
													|| keyID == 39)
												return;
											else
												event.target.value = event.target.value
														.replace(/[^0-9]/g, "");
										}
									</script>
									<!--  ******************************************************************************* -->

									<!--  ************************************** 개인 프로필 수정  ************************************************** -->
									<div class="tab-pane" id="profile">

										<!-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%-->

										<div class="profile_navigation">
											<!-- Tabs with icons on Card -->

											<div class="card card-nav-tabs">
												<div class="header header-custom">
													<!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
													<div class="nav-tabs-navigation">
														<div class="nav-tabs-wrapper">
															<ul class="nav nav-tabs" data-tabs="tabs">

																<li><a href="#user_profile" data-toggle="tab">
																		<i class="material-icons">build</i> User - Profile
																</a></li>



																<li><a href="#pet_profile" data-toggle="tab"> <i
																		class="material-icons">face</i> Pet - Profile
																</a></li>

															</ul>
														</div>
													</div>
												</div>
												<div class="content">
													<div class="tab-content text-center">

														<!--  *** User Profile*** -->
														<div class="tab-pane" id="user_profile">
															<div class="userpage">

																<form name="uploadImages" method="post"
																	enctype="multipart/form-data">
																	<label>Set User Image</label> <input id="userimage"
																		type="file" class="btn btn-default btn-sm"
																		accept="image/*" onchange="loadFile(event)">
																	<img id="output" width="200px" height="150px" /> <br>

																	<label>Set Blog Image</label> <input id="blogimage"
																		type="file" class="btn btn-default btn-sm"
																		accept="image/*" onchange="loadFile2(event)">

																	<img id="output2" width="200px" height="150px" /> <br>
																	<div class="col-sm-4">
																		<div class="input-group">
																			<span class="input-group-addon"> <i
																				class="fa fa-group"></i>
																			</span> <input id="title" type="text" class="form-control"
																				placeholder="${map.blogVo.title }">
																		</div>
																	</div>
																	<div class="col-sm-4">
																		<div class="input-group">
																			<span class="input-group-addon"> <i
																				class="fa fa-group"></i>
																			</span> <input id="nickname" type="text"
																				class="form-control"
																				placeholder="${map.userVo.nickname }"
																				onkeydown='return nickCheck(event)'>
																		</div>
																	</div>

																	<div class="col-sm-4">
																		<div class="input-group">
																			<span class="input-group-addon"> <i
																				class="fa fa-group"></i>
																			</span> <input id="infomation" type="text"
																				class="form-control"
																				placeholder="${map.userVo.infomation }">
																		</div>
																	</div>
																	<div class="col-sm-4">
																		<div class="input-group">
																			<span class="input-group-addon"> <i
																				class="fa fa-group"></i>
																			</span> <input id="pass_word" type="password"
																				class="form-control"
																				placeholder="${map.userVo.pass_word }">
																		</div>
																	</div>
																	<div class="col-sm-4">
																		<div class="input-group">
																			<span class="input-group-addon"> <i
																				class="fa fa-group"></i>
																			</span> <input id="pass_wordCheck" type="password"
																				class="form-control"
																				placeholder="${map.userVo.pass_word }">
																		</div>
																	</div>

																	<button id="userProfileSave"
																		class="btn btn-primary btn-sm">save</button>
																</form>
																<button id="nicknameCheck"
																	class="btn btn-primary btn-sm">닉네임 중복검사</button>
															</div>

														</div>


														<script>
															// 이미지 미리보기
															var loadFile = function(
																	event) {
																var output = document
																		.getElementById('output');
																output.src = URL
																		.createObjectURL(event.target.files[0]);
															};

															var loadFile2 = function(
																	event) {
																var output2 = document
																		.getElementById('output2');
																output2.src = URL
																		.createObjectURL(event.target.files[0]);
															};

															// 정보 처리
															var nickname;
															var title;
															var infomation;
															var password;
															var userimage;
															var blogimage;
															var controllerUrl;

															$("#nicknameCheck")
																	.prop(
																			"disabled",
																			true);

															// 입력하면 저장버튼 비활성화
															function nickCheck(
																	event) {
																$(
																		"#userProfileSave")
																		.prop(
																				"disabled",
																				true);
																$(
																		"#nicknameCheck")
																		.prop(
																				"disabled",
																				false);
															}

															$(
																	function() {
																		// blog , user 데이터 전달
																		$(
																				"#userProfileSave")
																				.click(
																						function() {

																							if ($(
																									"#pass_word")
																									.val() != $(
																									"#pass_wordCheck")
																									.val()) {
																								alert("입력하신 비밀번호가 일치하지 않습니다.");
																								return false;
																							}

																							var formData = new FormData();

																							nickname = $(
																									"#nickname")
																									.val();
																							title = $(
																									"#title")
																									.val();
																							infomation = $(
																									"#infomation")
																									.val();
																							password = $(
																									"#pass_word")
																									.val();
																							userimage = $(
																									"#userimage")
																									.get(
																											0).files[0];
																							blogimage = $(
																									"#blogimage")
																									.get(
																											0).files[0];

																							formData
																									.append(
																											"nickname",
																											nickname);
																							formData
																									.append(
																											"title",
																											title);
																							formData
																									.append(
																											"infomation",
																											infomation);
																							formData
																									.append(
																											"pass_word",
																											password);

																							if (userimage != null) {
																								formData
																										.append(
																												"userimage",
																												userimage);
																								controllerUrl = "userprofilemodify";

																							} else if (blogimage != null) {
																								formData
																										.append(
																												"blogimage",
																												blogimage);
																								controllerUrl = "userprofilemodify2";
																							}

																							else {
																								controllerUrl = "userprofilemodify4";
																							}
																							if (userimage != null
																									&& blogimage != null) {
																								formData
																										.append(
																												"blogimage",
																												blogimage);
																								formData
																										.append(
																												"userimage",
																												userimage);

																								controllerUrl = "userprofilemodify3";
																							}

																							$
																									.ajax({
																										url : "${pageContext.request.contextPath}/user/account/"
																												+ controllerUrl,
																										type : "post",
																										data : formData,
																										processData : false,
																										contentType : false
																									})
																						})

																		// 닉네임 체크
																		$(
																				"#nicknameCheck")
																				.click(
																						function() {
																							nickname = $(
																									"#nickname")
																									.val();

																							if (nickname == "") {
																								return;
																							}

																							$
																									.ajax({
																										url : "${pageContext.request.contextPath}/user/nickCheck?nickname="
																												+ nickname,
																										type : "get",
																										dataType : "json",
																										data : "",
																										success : function(
																												response) {
																											if (response.data == "yes") {
																												alert("사용가능 합니다.");
																												$(
																														"#userProfileSave")
																														.prop(
																																"disabled",
																																false);
																											}
																											if (response.data == "no") {
																												alert("이미 사용중인 닉네임 입니다.");
																											}
																											if (response.result == "fail") {
																												alert("에러");
																											}
																										}
																									})
																						})
																	})
														</script>

														<!--  *** Pet Profile *** -->
														<div class="tab-pane" id="pet_profile">
															<form name="uploadImages" method="post"
																enctype="multipart/form-data">
																<label>Set pet Image</label> <input id="petimage"
																	type="file" class="btn btn-default btn-sm"
																	accept="image/*" onchange="loadFile3(event)">
																<img id="output3" width="200px" height="150px" /> <br>

																<div class="col-sm-4">
																	<div class="input-group">
																		<span class="input-group-addon"> <i
																			class="fa fa-group"></i>
																		</span> <input id="petName" type="text" class="form-control"
																			placeholder="${map.petVo.name }">
																	</div>
																</div>
																<div class="col-sm-4">
																	<div class="input-group">
																		<span class="input-group-addon"> <i
																			class="fa fa-group"></i>
																		</span> <input id="petInfo" type="text" class="form-control"
																			placeholder="${map.petVo.info }">
																	</div>
																</div>
																<div class="col-sm-4">
																	<div class="input-group">
																		<span class="input-group-addon"> <i
																			class="fa fa-group"></i>
																		</span> <input id="age" type="text" class="form-control"
																			placeholder="${map.petVo.age }"
																			onkeydown='return onlyNumber(event)'
																			onkeyup='removeChar(event)'
																			style='ime-mode: disabled;'>
																	</div>
																</div>

																<br>
																<fieldset>
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
																</fieldset>

																<input type="text" id="co_datepick">
																<button id="petProfileSave"
																	class="btn btn-primary btn-sm">save</button>
															</form>
														</div>

														<script>
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

															var loadFile3 = function(
																	event) {
																var output3 = document
																		.getElementById('output3');
																output3.src = URL
																		.createObjectURL(event.target.files[0]);
															};

															$("#petProfileSave")
																	.click(
																			function() {
																				var formData = new FormData();

																				petUrl = "/petprofilemodify"
																				petimage = $(
																						"#petimage")
																						.get(
																								0).files[0];
																				petname = $(
																						"#petName")
																						.val();
																				petinfo = $(
																						"#petInfo")
																						.val();
																				co_date = $(
																						"#co_datepick")
																						.val();
																				age = $(
																						"#age")
																						.val();
																				gender = $(
																						":input:radio[name=gender]:checked")
																						.val();

																				formData
																						.append(
																								"petname",
																								petname);
																				formData
																						.append(
																								"petinfo",
																								petinfo);
																				formData
																						.append(
																								"co_date",
																								co_date);
																				formData
																						.append(
																								"gender",
																								gender);
																				formData
																						.append(
																								"age",
																								age)

																				if (petimage != null) {
																					formData
																							.append(
																									"petimage",
																									petimage);
																					petUrl = "/petprofilemodify2";
																				}

																				$
																						.ajax({
																							url : "${pageContext.request.contextPath}/user/account"
																									+ petUrl,
																							type : "post",
																							data : formData,
																							processData : false,
																							contentType : false
																						})

																			})
														</script>

													</div>
												</div>
											</div>
											<!-- End Tabs with icons on Card -->
										</div>




										<!--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-->
									</div>
									<!--  *************************** *************************************** -->
									<div class="tab-pane" id="settings">
										<p>관심 다이어리 화면</p>
									</div>
									<div class="tab-pane" id="QA">
										<p>Q/A 게시판 부분</p>
									</div>
									<div class="tab-pane" id="customer">
										<p>고객게시판 화면 부분</p>
									</div>


								</div>
							</div>
						</div>
						<!-- End Tabs with icons on Card -->
					</div>
				</div>






			</div>
			<!-- account nav 끝 -->
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