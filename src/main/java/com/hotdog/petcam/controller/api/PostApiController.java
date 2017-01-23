package com.hotdog.petcam.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotdog.petcam.DTO.JSONResult;
import com.hotdog.petcam.security.Auth;
import com.hotdog.petcam.service.PostService;
import com.hotdog.petcam.vo.PostVo;

@Controller("/postAPIController")
@RequestMapping("/post/api/")
public class PostApiController {

	@Autowired
	private PostService postService;
	
	
	@Auth
	@ResponseBody
	@RequestMapping("list")
	public JSONResult list(
			@RequestParam(value="p", required=true, defaultValue="1")
			Integer page, Model model){
		System.out.println(page);
		List<PostVo> list = postService.getList(page);
		
		model.addAttribute("list", list);
		System.out.println("controller return");
		System.out.println(list);
		
		return JSONResult.success(list);
	}
	
}
