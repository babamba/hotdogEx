package com.hotdog.petcam.chatting;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatHandler extends TextWebSocketHandler{
	private static final Logger logger = LoggerFactory.getLogger(ChatHandler.class);
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		logger.info("Connection established");
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session,CloseStatus status) throws Exception{
		logger.info("Connection closed. status:" + status );
	}
	
	protected void handleTextMessage(WebSocketSession session,TextMessage message) throws Exception{
		logger.info("Received Message: "+ message.getPayload());
		
		Thread.sleep(2000);
		
		session.sendMessage(new TextMessage("Hello Client !!"));
	}
	
}
