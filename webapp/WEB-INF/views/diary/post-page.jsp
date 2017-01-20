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
	<script
		src="${pageContext.request.contextPath}/assets/js/main.js"></script>
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


</body>
</html>