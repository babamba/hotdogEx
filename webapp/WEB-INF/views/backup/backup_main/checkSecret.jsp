<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/assets/js/min/jquery-1.10.2.min.js" ></script>

<title>Security Page</title>
</head>
<body>
	<h1> 보안페이지 - 2차 비밀번호 설정</h1>
		<div>	
			<form method="post" action="${pageContext.request.contextPath }/user/secretlogin">
				<label>2차비밀번호 확인</label>
				<br>
				<input id="secretNumber" type ="password"	onkeydown='return onlyNumber(event)' 
					onkeyup='removeChar(event)' style='ime-mode:disabled;'	placeholder="Secret Number " name="sec_pass_word">
				<br>
				<br>
				
				<input type="submit" id="checkSecretbutton" value = "인증 시도" />
			</form>
		</div>
	
	<script>
		// 클릭시 비교
		var secretNumber;
		var secretNumberCheck;
		
		$(function(){
			
			$("#checkSecretbutton").click(function(){
				
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
</body>
</html>