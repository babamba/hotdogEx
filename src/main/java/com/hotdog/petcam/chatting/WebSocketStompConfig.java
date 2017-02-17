package com.hotdog.petcam.chatting;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;

// STOMP 설정
@Configuration
@EnableWebSocketMessageBroker
public class WebSocketStompConfig extends AbstractWebSocketMessageBrokerConfigurer{
	
	// 1.chatting 을 통해 SockJS 사용
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		registry.addEndpoint("/chatting").withSockJS();  
	}
	
	// 2. MessageBroker 릴레이 설정, 브로커 셋업 ( RabbitMQ 사용 )
	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry){
		registry.enableStompBrokerRelay("topic","/queue")
				.setRelayHost("rabbit.someotherserver")
				.setRelayPort(62623)
				.setClientLogin("hotdog")
				.setClientPasscode("hotdog");
		registry.setApplicationDestinationPrefixes("/talk");
	}
	
}
