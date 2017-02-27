package com.hotdog.petcam.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotdog.petcam.DTO.JSONResult;
import com.hotdog.petcam.service.PostService;
import com.hotdog.petcam.vo.PostVo;

@Controller()
@RequestMapping("/blog/api/")
public class BlogApiController {

	
	@Autowired
	private PostService postService;
	
	@ResponseBody
	@RequestMapping("/indexPostList")
	public JSONResult blogMainList(
			@RequestParam(value="nickname", required=true)String nickname, 
			Model model
			){
	List<PostVo> list = postService.getMainPostList(nickname);
	return JSONResult.success(list);
	}
	
	@ResponseBody
	@RequestMapping("/list")
	public JSONResult list(
			@RequestParam(value="p", required=true, defaultValue="1")Integer page, 
			@RequestParam(value="no", required=true)Integer users_no,
			Model model){
		List<PostVo> list = postService.getList(page, users_no);
		
		model.addAttribute("list", list);
		
		return JSONResult.success(list);
	}
	
	
	
}

