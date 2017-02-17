<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="https://cdn.jsdelivr.net/sockjs/0.3.4/sockjs.min.js"></script>
<script>
	var url = 'http://'+window.location.host+'/stomp/chatting';
	var sock = new SockJS(url);	// 웹 소켓 오픈
	
	var stomp = Stomp.over(sock); // STOMP 클라이언트 생성
	var payload = JSON.stringify({'message':'hello'});
	
	stomp.connect('guest','guest',function(frame){
		stomp.send("/marco",{},payload);
	})
	
// 	sock.onopen = function(){
// 		console.log("opening..");	// 오픈 이벤트
// 		sayHelloServer();
// 	};
// 	sock.onmessage = function(e){
// 		console.log('received message:', e.data);	// 메세지 수신
// 		setTimeout(function(){
// 			sayHelloServer();
// 		})
// 	};
// 	sock.onclose = function(){
// 		console.log('closing');		// 종료 이벤트
// 	}
	
// 	function sayHelloServer(){
// 		console.log("sending Hello");
// 		sock.send("Hello");	// 메세지 전송
// 	}
</script>
<body>
	
</body>
</html>