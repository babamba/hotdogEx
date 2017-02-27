package com.hotdog.petcam.controller.api;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hotdog.petcam.DTO.JSONResult;
import com.hotdog.petcam.security.Auth;
import com.hotdog.petcam.security.AuthUser;
import com.hotdog.petcam.service.ImageService;
import com.hotdog.petcam.service.PostService;
import com.hotdog.petcam.vo.BoardChatVo;
import com.hotdog.petcam.vo.PostChatVo;
import com.hotdog.petcam.vo.PostCommentsVo;
import com.hotdog.petcam.vo.PostVo;
import com.hotdog.petcam.vo.UserVo;

@Controller
@RequestMapping("/post/api/")
public class PostApiController {

	@Autowired
	private PostService postService;
	
	@Autowired
	private ImageService imageService;
	
	
	@ResponseBody
	@RequestMapping("/list")
	public JSONResult list(
			@RequestParam(value="p", required=true, defaultValue="1")Integer page, 
			@RequestParam(value="no", required=true, defaultValue="1")Integer users_no,
			Model model){
		List<PostVo> list = postService.getList(page, users_no);
		model.addAttribute("list", list);
		
		return JSONResult.success(list);
	}

	@RequestMapping(value="/modify_view")
	public JSONResult modify_form(
			@RequestParam(value="post_no", required=true) Integer post_no, Model model){
		PostVo postVo = postService.getModifyPost(post_no);
		
		return JSONResult.success(postVo);
	}
	
	@ResponseBody
	@RequestMapping("/updateHits")
	public void updateHits(@RequestParam(value="postNo", required=true)Integer post_no){
		postService.updateHits(post_no);
	}
	
/*	@Auth
	@ResponseBody
	@RequestMapping("/{nickname}/delete")
	public JSONResult delete(
			@ModelAttribute PostVo postVo,
			@RequestParam(value="users_no", required=true)Integer users_no,
			@RequestParam(value="post_no", required=true) Integer post_no,
			@AuthUser UserVo authUser, Model model){
		
		
		postVo.setUsers_no(authUser.getUsers_no());
		boolean result = postService.delete(postVo);

		return JSONResult.success(result ? postVo.getUsers_no() : -1);
	}*/
	
	@Auth
	@ResponseBody
	@RequestMapping(value="/deletepost" , method=RequestMethod.POST)
	public String post_delete(
			@RequestParam(value="post_no", required=true)Integer post_no){
		postService.delete_post(post_no);
		return "redirect:/";
	}
	
	
	/***** reply *****/
	@ResponseBody
	@RequestMapping("/fetchreply")
	public JSONResult fetchReply(
			@RequestParam(value="postNo", required=true)Integer post_no
			){
		List<PostCommentsVo> list = postService.fetchReply(post_no);
		return JSONResult.success(list);
	}
	

	@ResponseBody
	@RequestMapping( value="/deletePostreply", method=RequestMethod.POST)
	public JSONResult deletePostReply(@RequestParam( value="commentsNo", required=true) Integer comments_no){
		
		boolean data = postService.deletePostReply(comments_no);
		return JSONResult.success(data);
	}
	


	
	/////////////////////////////////////////// Reply Chat
	
	@ResponseBody
	@RequestMapping("/fetchreplychat")
	public JSONResult fetchPostReplyChat(@RequestParam(value="commentsNo", required=true) Integer comments_no){
				
		List<PostChatVo> list = postService.fetchReplyChat(comments_no);
		return JSONResult.success(list);
	}
	
	@ResponseBody
	@RequestMapping("/writereplychat")
	public JSONResult writeReplyChat(PostChatVo postChatVo){
		PostChatVo vo = postService.writeReplyChat(postChatVo);
		return JSONResult.success(vo);
	}
	
	
	@ResponseBody
	@RequestMapping( value="/deletePostreplychat", method=RequestMethod.POST)
	public JSONResult deleteReplyChat(@RequestParam( value="postChatNo", required=true) Integer post_chat_no){
		
		boolean data = postService.deletePostReplyChat(post_chat_no);
		
		return JSONResult.success(data);
	}
	
	
	
	@Auth
	@ResponseBody
	@RequestMapping(value ="/post_imageupload", method=RequestMethod.POST)
	public JSONResult post_imageUpload(
			@AuthUser UserVo authUser,
			@RequestParam(value = "post_image") MultipartFile post_image, Model model){
		
		
		String saveFileName = imageService.restore(post_image);
		/*imageService.PostImageUpload(postVo);*/
	
		
/*		postVo.setPost_image(saveFileName);*/
		
		model.addAttribute("saveFileName", saveFileName);
		
		
		return JSONResult.success(saveFileName);
	}
	
	
}
