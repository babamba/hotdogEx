package com.hotdog.petcam.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotdog.petcam.security.Auth;
import com.hotdog.petcam.service.BlogService;

@Controller
@RequestMapping("/blog")
public class BlogController {

	@Autowired
	private BlogService blogService;
	
	@RequestMapping("/{nickname}")
	public String main(@PathVariable String nickname, Model model, HttpServletRequest request){
		
		Map<String, Object> map = blogService.index(nickname);
		System.out.println(map);
		System.out.println();
		return "blog/blog-main";
	}
	
	@RequestMapping("/{nickname}/post")
	public String write(@PathVariable String nickname ){
		return "blog/write";
	}
	
	
	
	@Auth
	@RequestMapping("/{nickname}/vod")
	public String vod(@PathVariable String nickname){
		return "blog/vod-main";
	}
	
	@Auth
	@RequestMapping("/{nickname}/streaming")
	public String Streaming(@PathVariable String nickname){
		return "blog/streaming-main";
	}
	
	@Auth
	@RequestMapping("/{nickname}/account")
	public String Account(@PathVariable String nickname){
		return "blog/account-main";
	}
	
	
}
