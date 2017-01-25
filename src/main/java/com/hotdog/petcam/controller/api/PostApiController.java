package com.hotdog.petcam.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotdog.petcam.DTO.JSONResult;
import com.hotdog.petcam.security.Auth;
import com.hotdog.petcam.security.AuthUser;
import com.hotdog.petcam.service.PostService;
import com.hotdog.petcam.vo.PostVo;
import com.hotdog.petcam.vo.UserVo;

@Controller("/postAPIController")
@RequestMapping("/post/api/")
public class PostApiController {

	@Autowired
	private PostService postService;
	
	
	@Auth
	@ResponseBody
	@RequestMapping("/list")
	public JSONResult list(
			@RequestParam(value="p", required=true, defaultValue="1")Integer page, 
			@RequestParam(value="no", required=true, defaultValue="1")Integer users_no,
			Model model){
		System.out.println(page);
		List<PostVo> list = postService.getList(page, users_no);
		
		model.addAttribute("list", list);
		System.out.println("controller return");
		System.out.println(list);
		
		return JSONResult.success(list);
	}
	
	
	@Auth
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
	}
	
	
	
	
}
