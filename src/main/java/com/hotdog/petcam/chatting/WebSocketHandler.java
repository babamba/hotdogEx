package com.hotdog.petcam.chatting;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

// 하위 웹 소켓을 지원하기 위한 인터페이스.. 구현 메서드가 5개라 불편함..
// AbstractWebSocketHandler 를 확장하는것이 더 쉽다.
// Text만 처리하기 위해서는 AbstractWebSocketHandler 대신 TextWebSocketHandler 를 확장해도 된다.
public interface WebSocketHandler {
	
	// 1. 처음 연결이 됬을때
	void afterConnectionEstablished(WebSocketSession session) throws Exception;
	
	// 2. 메세지 처리
	void hanleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception;
	
	// 3. 에러 전달 
	void handleTransportError(WebSocketSession session,Throwable exception) throws Exception;
	
	// 4. 접속이 종료 됬을 떄
	void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception;
	
	// 5. 분할 메세지인지?
	boolean supportsPartialMessages();
	
}
