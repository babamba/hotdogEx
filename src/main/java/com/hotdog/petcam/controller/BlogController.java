package com.hotdog.petcam.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotdog.petcam.security.Auth;
import com.hotdog.petcam.security.AuthUser;
import com.hotdog.petcam.security.Secret;
import com.hotdog.petcam.service.BlogService;
import com.hotdog.petcam.service.PetService;
import com.hotdog.petcam.service.UserService;
import com.hotdog.petcam.vo.ImageVo;
import com.hotdog.petcam.vo.PostVo;
import com.hotdog.petcam.vo.UserVo;

@Controller
@RequestMapping("/blog")
public class BlogController {

	@Autowired
	private BlogService blogService;
	@Autowired private UserService userService;
	@Autowired private PetService petService;
	

	@RequestMapping("/{nickname}")
	public String main(@PathVariable String nickname, Model model, HttpServletRequest request, @AuthUser UserVo authUser){
		Map<String, Object> map = blogService.index(nickname);
		model.addAttribute("map", map);
		
		System.out.println(map);
		
		
		return "blog/blog-main";
	}
	
	
	
	
	@Auth
	@Secret
	@RequestMapping("/{nickname}/vod")
	public String vod(@PathVariable String nickname){
		return "blog/vod-main";
	}
	
	@Auth
	@Secret
	@RequestMapping("/{nickname}/streaming")
	public String Streaming(@PathVariable String nickname){
		return "blog/streaming-main";
	}
	
	@Auth
	@Secret
	@RequestMapping("/{nickname}/account")
	public String Account(@PathVariable String nickname,@AuthUser UserVo authUser,Model model){
		// 뷰에 수정에 필요한 내용들 다 넘겨버리자
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userVo", userService.getAllByNo(authUser.getUsers_no()));
		map.put("blogVo", blogService.getTitleByNo(authUser.getUsers_no()));
		map.put("petVo", petService.getAllByNo(authUser.getUsers_no()));
		
		model.addAttribute("map", map);
		
		return "blog/account-main";
	}
	
	

	
}
