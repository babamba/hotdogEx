package com.hotdog.petcam.chatting;

// ChattingController 가  handleShout메서드에서 참조할때
// JSON 메세지를 Shout 객체로 변환할 것이다. ( Jackson 이 자비 객체 프로퍼티로  JSON 프로퍼티를 매핑해주는 작업을 수행한다. )
// 굳이 필요하다면 @Jackson 어노테이션으로 변환하는 방법에 영향을 미칠수 있다.
public class Shout {
	private String message;
	
	public String getMessage(){
		return message;
	}
	public void setmessage(String message){
		this.message = message;
	}
}
