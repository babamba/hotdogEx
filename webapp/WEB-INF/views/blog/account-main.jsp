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

	<div class="account_nav">
		<div class="account_navigation">
			<!-- Tabs with icons on Card -->

			<div class="card card-nav-tabs">
				<div class="header header-custom">
					<!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
					<div class="nav-tabs-navigation">
						<div class="nav-tabs-wrapper">
							<ul class="nav nav-tabs" data-tabs="tabs">
								<li class="active"><a href="#profile" data-toggle="tab">
										<i class="material-icons">face</i> 개인정보수정
								</a></li>
								<li><a href="#messages" data-toggle="tab"> <i
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
				<div class="content">
					<div class="tab-content text-center">
						<div class="tab-pane active" id="profile">

							<div class="user_password">
								<div class="col-sm-4">
									<div class="input-group">
										<span class="input-group-addon"> <i class="fa fa-group"></i>
										</span> <input type="password" class="form-control"
											placeholder="password">
									</div>
								</div>

								<div class="col-sm-4">
									<div class="input-group">
										<span class="input-group-addon"> <i class="fa fa-group"></i>
										</span> <input type="password" class="form-control"
											placeholder="password check">
									</div>
								</div>
							</div>

							<div class="col-sm-4">
								<div class="input-group">
									<span class="input-group-addon"> <i class="fa fa-group"></i>
									</span> <input type="input" name="tel1" class="phone form-control"
										placeholder="Phone Number" onblur="chk_tel(this.value,this);">
								</div>
							</div>

							<div class="secret_mode">

								<div class="togglebutton">
									<label>
										<p>Secret</p> <input type="checkbox" checked="">
									</label>
								</div>
								<button class="btn btn-primary btn-sm">Small</button>
							</div>


						</div>
						<div class="tab-pane" id="messages">

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
															class="material-icons">build</i> User-Profile
													</a></li>
													<li><a href="#pet_profile" data-toggle="tab"> <i
															class="material-icons">face</i> Pet-Profile
													</a></li>

												</ul>
											</div>
										</div>
									</div>
									<div class="content">
										<div class="tab-content text-center">
											<div class="tab-pane" id="user_profile">
												<div class="userpage">
													<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
												</div>


											</div>


											<div class="tab-pane" id="pet_profile">
												<p>펫 프로필</p>
											</div>
										</div>
									</div>
								</div>
								<!-- End Tabs with icons on Card -->
							</div>




							<!--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-->
						</div>
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
		src="${pageContext.request.contextPath}/assets/js/vendor/jquery-1.10.2.min.js"></script>
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
		src="${pageContext.request.contextPath}/assets/js/vendor/modernizr-2.6.2.min.js"></script>



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