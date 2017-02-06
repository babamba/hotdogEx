$('.tabs .tab').click(function(){
    if ($(this).hasClass('signin')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signin-cont').show();
    } 
    if ($(this).hasClass('signup')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont').show();
    }
});
$('.container .bg').mousemove(function(e){
    var amountMovedX = (e.pageX * -1 / 30);
    var amountMovedY = (e.pageY * -1 / 9);
    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
});


//준우 원본 로그인 스크립트
/*var email;
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
	})
})
*/
