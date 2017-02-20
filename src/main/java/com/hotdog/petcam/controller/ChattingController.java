package com.hotdog.petcam.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotdog.petcam.chatting.Shout;

@Controller
public class ChattingController {

	private static final Logger logger = LoggerFactory.getLogger(ChattingController.class);

	@RequestMapping("/chat")
	public String index() {
		return "chatting/chat";
	}

	// 특정 목적지에 대한 Message를 처리한다.
	// WebSocketStompConfig 에서 /talk 로 설정해뒀다.
	// 이경우에 목적기는 /talk/hello 이다.
	@MessageMapping("/hello")
	public void handleShout(Shout incoming) {
		logger.info("Received message :" + incoming.getMessage());
	}

	@SubscribeMapping({ "/hello" })
	public Shout handleSubscription() {
		Shout outgoing = new Shout();
		outgoing.setmessage("world!");
		return outgoing;
	}
}
