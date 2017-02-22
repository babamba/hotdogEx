package com.hotdog.petcam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("")
public class MainController {
	
	@RequestMapping("/")
	public String index(){
		return "main/page_main";
	}
	
	@RequestMapping("test")
	public String test(){
		return "main/test";
	}
	
	@RequestMapping("/loginpage")
	public String login(){
		return "main/loginPage";
	}
	
	/*@RequestMapping("/page_main")
	public String page_main(@AuthUser UserVo nickname, Model model){
		System.out.println("로그인한 유저 닉네임" + nickname);
		return "main/page_main";
	}*/
	
	
}
