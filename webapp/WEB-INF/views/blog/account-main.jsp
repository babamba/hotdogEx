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
<title>Hot dog</title>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery.js"></script>
<meta name="description" content="">

<meta name="viewport" content="width=device-width, initial-scale=1">

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
	<!-- .sidebar-menu -->



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
							<form method="post" action="${pageContext.request.contextPath }/user/account/secretmodify" >
						
								<div class="col-sm-4">
									<div class="input-group">
										<span class="input-group-addon"> <i class="fa fa-group"></i>
										</span> <input id="secretNumber" type="password" class="form-control"
											onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'
											placeholder="Secret Number " name="sec_pass_word">
									</div>
								</div>
								<div class="col-sm-4">
									<div class="input-group">
										<span class="input-group-addon"> <i class="fa fa-group"></i>
										</span> <input id="secretNumberCheck" type="password" class="form-control"
											onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'
											placeholder="Secret Number Check" >
									</div>
								</div>
								<input type="submit" id="secretNumberSave"  class="btn btn-primary btn-sm" value="저장"/>
								
							</form>							
							</div>
						</div>
						
						<script>
						// 클릭시 비교
						var secretNumber;
						var secretNumberCheck;
						
						$(function(){
							
							$("#secretNumberSave").click(function(){
								
								secretNumber = $("#secretNumber").val();
								secretNumberCheck = $("#secretNumberCheck").val();
								
								if( secretNumber > 999999 ){
									alert(" 1000 ~ 999999 까지의 숫자를 입력해주세요");
									return false;
								}	
								if( secretNumber < 1000){
									alert(" 1000 ~ 999999 까지의 숫자를 입력해주세요");
									return false;
								}
								if(secretNumber != secretNumberCheck){
									alert("입력하신 두 보안번호가 일치하지 않습니다.");
									return false;
								}
								return true;
							})
						})		
						
						// 문자를 빼버리고 숫자만 입력받기
						function onlyNumber(event){
							event = event || window.event;
							var keyID = (event.which) ? event.which : event.keyCode;
							if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
								return;
							else
								return false;
						}
						function removeChar(event) {
							event = event || window.event;
							var keyID = (event.which) ? event.which : event.keyCode;
							if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
								return;
							else
								event.target.value = event.target.value.replace(/[^0-9]/g, "");
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
													
													<li><a href="#user_profile" data-toggle="tab"> <i
															class="material-icons">build</i> User - Profile
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
														
													<form name="uploadImages" method="post"	enctype="multipart/form-data">
														<label>Set User Image</label>
														<input id="userimage" type="file" class="btn btn-default btn-sm" accept="image/*" onchange="loadFile(event)" >
														<img id="output" width="200px" height="150px"/>
														<br>
														
														<label>Set Blog Image</label>
														<input id="blogimage" type="file" class="btn btn-default btn-sm" accept="image/*" onchange="loadFile2(event)" >					
														
														<img id="output2" width="200px" height="150px"/>
														<br>
														<div class="col-sm-4">
															<div class="input-group">
																<span class="input-group-addon"> <i class="fa fa-group"></i>
																</span> <input id="title" type="text" class="form-control" placeholder="${map.blogVo.title }">
															</div>
														</div>
														<div class="col-sm-4">
															<div class="input-group">
																<span class="input-group-addon"> <i class="fa fa-group"></i>
																</span> <input id="nickname" type="text" class="form-control" placeholder="${map.userVo.nickname }" onkeydown='return nickCheck(event)' >
															</div>
														</div>
														
														<div class="col-sm-4">
															<div class="input-group">
																<span class="input-group-addon"> <i class="fa fa-group"></i>
																</span> <input id="infomation" type="text" class="form-control" placeholder="${map.userVo.infomation }" >
															</div>
														</div>
														
														<button id="userProfileSave"  class="btn btn-primary btn-sm" > save</button>
													</form>
														<button id="nicknameCheck"  class="btn btn-primary btn-sm" >닉네임 중복검사</button>
												</div>

											</div>
											
											
											<script>
											
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
											 	var userimage;
											 	var blogimage;
											 	var controllerUrl;
												
												$("#nicknameCheck").prop("disabled",true);	
											
												// 입력하면 저장버튼 비활성화
												function nickCheck(event){
													$("#userProfileSave").prop("disabled",true);
													$("#nicknameCheck").prop("disabled",false);
												}
												
												$(function(){
													// blog , user 데이터 전달
													$("#userProfileSave").click(function(){
														
														
														
														var formData = new FormData();
														
														nickname = $("#nickname").val();
														title = $("#title").val();
														infomation = $("#infomation").val();
														userimage= $("#userimage").get(0).files[0];
														blogimage= $("#blogimage").get(0).files[0];
														
														formData.append("nickname",nickname);
														formData.append("title",title);
														formData.append("infomation",infomation);
														
														if ( userimage != null){
															formData.append("userimage",userimage);
															controllerUrl="userprofilemodify";
															
														}
														else if ( blogimage != null ){
															formData.append("blogimage",blogimage);
															controllerUrl="userprofilemodify2";
														}
														
														else{
															controllerUrl="userprofilemodify4";
														}	
														if ( userimage != null && blogimage != null){
															formData.append("blogimage",blogimage);
															formData.append("userimage",userimage);
															
															controllerUrl = "userprofilemodify3";
														}
														
														alert(controllerUrl);
														
														$.ajax({
															url:"${pageContext.request.contextPath}/user/account/" + controllerUrl,
															type:"post",
															data: formData , 
															processData : false,
												            contentType : false
														})
													})
													
													// 닉네임 체크
													$("#nicknameCheck").click(function(){
														nickname = $("#nickname").val();

														if (nickname ==  ""){
															return;
														}
														
														$.ajax({
															url:"${pageContext.request.contextPath}/user/nickCheck?nickname="+nickname,
															type:"get",
															dataType:"json",
															data:"",
															success : function(response){
																if(response.data=="yes"){
																	alert("사용가능 합니다.");
																	$("#userProfileSave").prop("disabled",false);
																}if(response.data=="no"){
																	alert("이미 사용중인 닉네임 입니다.");
																}if(response.result=="fail"){
																	alert("에러");
																}
															}
														})
													})
												})
											</script>

											<!--  *** Pet Profile *** -->
											<div class="tab-pane" id="pet_profile">
												<form name="uploadImages" method="post"	enctype="multipart/form-data">
														<label>Set pet Image</label>
														<input id="petimage" type="file" class="btn btn-default btn-sm" accept="image/*" onchange="loadFile3(event)" >
														<img id="output3" width="200px" height="150px"/>
														<br>
														
														<div class="col-sm-4">
															<div class="input-group">
																<span class="input-group-addon"> <i class="fa fa-group"></i>
																</span> <input id="petName" type="text" class="form-control" placeholder="${map.petVo.name }">
															</div>
														</div>
														<div class="col-sm-4">
															<div class="input-group">
																<span class="input-group-addon"> <i class="fa fa-group"></i>
																</span> <input id="petInfo" type="text" class="form-control" placeholder="${map.petVo.info }">
															</div>
														</div>
													<button id="petProfileSave"  class="btn btn-primary btn-sm" >save</button>
												</form>
											</div>
											
											<script>
												var petimage;
												var petname;
												var petinfo;
												var birthdate;
											
												var loadFile3 = function(event) {
												    var output3 = document.getElementById('output3');
												    output3.src = URL.createObjectURL(event.target.files[0]);
												  };
												  
												  
												 $("#petProfileSave").click(function(){
													 var formData = new FoamData();
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


	<!-- Modal -->
	<c:import url="/WEB-INF/views/includes/modal.jsp" />


	<script
		src="${pageContext.request.contextPath}/assets/js/min/jquery-1.10.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/min/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/min/material.min.js"></script>
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
		src="${pageContext.request.contextPath}/assets/js/material-kit.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/min/modernizr-2.6.2.min.js"></script>



	<script type="text/javascript">
		function chk_tel(str, field) {
			var str;
			str = checkDigit(str);
			len = str.length;

			if (len == 8) {
				if (str.substring(0, 2) == 02) {
					error_numbr(str, field);
				} else {
					field.value = phone_format(1, str);
				}
			} else if (len == 9) {
				if (str.substring(0, 2) == 02) {
					field.value = phone_format(2, str);
				} else {
					error_numbr(str, field);
				}
			} else if (len == 10) {
				if (str.substring(0, 2) == 02) {
					field.value = phone_format(2, str);
				} else {
					field.value = phone_format(3, str);
				}
			} else if (len == 11) {
				if (str.substring(0, 2) == 02) {
					error_numbr(str, field);
				} else {
					field.value = phone_format(3, str);
				}
			} else {
				error_numbr(str, field);
			}
		}
		function checkDigit(num) {
			var Digit = "1234567890";
			var string = num;
			var len = string.length
			var retVal = "";
			for (i = 0; i < len; i++) {
				if (Digit.indexOf(string.substring(i, i + 1)) >= 0) {
					retVal = retVal + string.substring(i, i + 1);
				}
			}
			return retVal;
		}
		function phone_format(type, num) {
			if (type == 1) {
				return num.replace(/([0-9]{4})([0-9]{4})/, "$1-$2");
			} else if (type == 2) {
				return num.replace(/([0-9]{2})([0-9]+)([0-9]{4})/, "$1-$2-$3");
			} else {
				return num.replace(/(^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,
						"$1-$2-$3");
			}
		}
	</script>


</body>

</html>