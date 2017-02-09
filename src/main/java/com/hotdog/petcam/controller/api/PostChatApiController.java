package com.hotdog.petcam.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotdog.petcam.DTO.JSONResult;
import com.hotdog.petcam.service.PostChatService;

@Controller
@RequestMapping("/chat/api")
public class PostChatApiController {

	@Autowired
	private PostChatService postChatService;
	
	/*@ResponseBody
	@RequestMapping("/chatInsert")
	public JSONResult postChatInsert(
			@RequestParam(value="post_no")int post_no,
			@RequestParam(value="nickname")String nickname
			){
		
		postChatService.insertChat(post_no, nickname);
		return JSONResult.success("comment");
	}*/
	
	
}
