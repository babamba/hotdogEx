package com.hotdog.petcam.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotdog.petcam.DTO.JSONResult;
import com.hotdog.petcam.service.PostChatService;
import com.hotdog.petcam.service.PostService;
import com.hotdog.petcam.vo.PostChatVo;
import com.hotdog.petcam.vo.PostCommentsVo;

@Controller
@RequestMapping("/postView/api")
public class PostReplyApiController {

	@Autowired
	private PostChatService postChatService;
	
	@Autowired
	private PostService postService;
	
    ///////////////Reply////////////////////
	@ResponseBody
	@RequestMapping("/fetchreply")
	public JSONResult fetchReply(@RequestParam(value="postNo", required=true) Integer post_no){
		List<PostCommentsVo> list = postService.fetchReply(post_no);
		return JSONResult.success(list);
	}
	
	@ResponseBody
	@RequestMapping("/writereply")
	public JSONResult writePostReply(PostCommentsVo postCommentsVo){
		PostCommentsVo vo = postService.writeReply(postCommentsVo);
		return JSONResult.success(vo);
	}
	
///////////////Reply Chat////////////////////
	
	@ResponseBody
	@RequestMapping("/fetchreplychat")
	public JSONResult fetchReplyChat(@RequestParam(value="commentsNo", required=true)Integer comments_no){
		List<PostChatVo> list = postService.fetchReplyChat(comments_no);
		return JSONResult.success(list);
	}
	
	@ResponseBody
	@RequestMapping("/writereplychat")
	public JSONResult writeReplyChat(PostChatVo postChatVo){
		PostChatVo vo = postService.writeReplyChat(postChatVo);
		return JSONResult.success(vo);
	}
	
}
