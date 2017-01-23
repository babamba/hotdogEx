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

<script src="${pageContext.request.contextPath}/assets/js/min/jquery-1.10.2.min.js" ></script>
<script>
var email;
var password;
var nickname;
var code;

$(function(){
	
	$("#joinNextButton").prop("disabled",true);
	$("#sendMailButton").prop("disabled", true);
	$("#inputCodeCheck").prop("disabled", true);
	$("#joinButton").prop("disabled", true);
	
//		회원가입 폼    		
	$("#inputNickCheck").click(function(){
			nickname = $("#inputnickname").val();
			
			if($("#inputEmail").val()==""){
				alert("이메일을 입력해주세요");
				$("#inputEmail").focus();
				return false;
			}
			if($("#inputPassword").val()==""){
				alert("패스워드를 입력해주세요");
				$("#inputPassword").focus();
				return false;
			}
			if($("#inputPassword").val()!=$("#inputPassword2").val()){
				alert("입력한 비밀번호가 다릅니다.");
				$("#inputPassword2").focus();
				return false;
			}
			if($("#inputnickname").val()==""){
				alert("닉네임을 입력해주세요");
				$("#inputnickname").focus();
				return false;
			}
			
			$.ajax({
				url:"${pageContext.request.contextPath}/user/nickCheck?nickname=" + nickname,
				type:"get",
				dataType:"json",
				data:"",
				success: function(response){
					
					// 통신에러
					if( response.result == "fail" ) {
						console.log( response.message );
						return;
					}
				
				// 코드가 일치할 때
				if(response.data=="yes"){
					alert("사용가능한 닉네임입니다.");
					$("#sendMailButton").prop("disabled",false);
				}
					if(response.data=="no"){
						alert("이미 사용중인 닉네임입니다.")
					}
				}
			})
		})






	$("#sendMailButton").click(function() {
		
		
		var formData = new FormData();
        email=$("#inputEmail").val();
        password=$("#inputPassword").val();
        nickname=$("#inputnickname").val();
        
        formData.append("email",email);
    	formData.append("password",password);
    	formData.append("nickname",nickname);
    	
		
		if($("#inputEmail").val()==""){
			alert("이메일을 입력해주세요");
			$("#inputEmail").focus();
			return false;
		}
		if($("#inputPassword").val()==""){
			alert("패스워드를 입력해주세요");
			$("#inputPassword").focus();
			return false;
		}
		if($("#inputPassword").val()!=$("#inputPassword2").val()){
			alert("입력한 비밀번호가 다릅니다.");
			$("#inputPassword2").focus();
			return false;
		}
		if($("#inputnickname").val()==""){
			alert("닉네임을 입력해주세요");
			$("#inputnickname").focus();
			return false;
		}
		
		
		
		
		

		// 배열에 TempUser 정보 넣어서 JSON 으로 던지기         {"data":arr}
		
//			var arr=[ $("#inputEmail").val() ,$("#inputPassword").val() ];
	
		$.ajax({
			url:"${pageContext.request.contextPath }/user/signupform",
			type:"post",
			data: formData , 
			processData : false,
            contentType : false
		})
		
		alert("입력하신 이메일에 인증 코드가 발송되었습니다.");
		$("#inputCodeCheck").prop("disabled",false);
		
		return true;
	});
	
	//  약관동의 체크
	$("#joinNext").prop("disabled",true);
	
	$("#accessCheck").change(function(){
		if($("#accessCheck").is(":checked")){
			console.log("체크됨");
			$("#joinNext").prop("disabled",false);
		}else{
			console.log("체크 풀림");
			$("#joinNext").prop("disabled",true);
		}
	})
	
	//  코드 체크
	$("#checkNext").prop("disabled",true);
	
	$("#inputCodeCheck").click(function(){
		
		code=$("#inputCode").val();
    	console.log(code);
		
		if(code==""){
			return;
		}
    	
		$.ajax({
			url:"${pageContext.request.contextPath}/user/checkcode?code="+code,
			type:"get",
			dataType:"json",
			data:"",
			success: function(response){
				
				// 통신에러
				if( response.result == "fail" ) {
					console.log( response.message );
					return;
				}
			
				// 코드가 일치할 때
			if(response.data=="yes"){
				alert("코드가 일치합니다.");
				$("#joinButton").prop("disabled",false);
			}
				if(response.data=="no"){
					alert("코드가 일치하지 않습니다.")
				}
			}
		})
		
	/* $("#joinButton").click(function(){
		
		$.ajax({
			url:"${pageContext.request.contextPath}/user/join",
			type:"get",
			dataType:"json",
			data:""
		})
		
		
	}) */
	
		
		
		
	})
})


		





</script>


</head>


<body>
	
	<!-- Fixed-bar -->
	<c:import url="/WEB-INF/views/includes/fixed_bar.jsp" />
	
	<br><br>
	<h1>메인화면은 구성중이다</h1>
	
		<c:choose>
				<c:when test="${empty authUser }">
					<a>로그인 해</a>
				</c:when>
		<c:otherwise>
				<a href="${pageContext.request.contextPath}/blog/${authUser.nickname}">${authUser.nickname}의 블로그화면으로</a> 
		</c:otherwise>
	</c:choose>
	
	<!-- Modal -->
	<c:import url="/WEB-INF/views/includes/modal.jsp" />


	<script
		src="${pageContext.request.contextPath}/assets/js/min/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/min/material.min.js"></script>
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
		src="${pageContext.request.contextPath}/assets/js/min/material.min.js" ></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/min/nouislider.min.js" ></script>
	
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap-datepicker.js" ></script>
	
	<script
		src="${pageContext.request.contextPath}/assets/js/material-kit.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/vendor/modernizr-2.6.2.min.js"></script>


</body>
</html>