package com.hotdog.petcam.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotdog.petcam.security.Auth;
import com.hotdog.petcam.security.AuthUser;
import com.hotdog.petcam.vo.UserVo;


@Controller
@RequestMapping("")
public class MainController {
	
	@RequestMapping("/")
	public String index(){
		return "main/index";
	}
	
	@RequestMapping("test")
	public String test(){
		return "main/test";
	}
	
	@RequestMapping("/loginpage")
	public String login(){
		return "main/loginPage";
	}
	
	@RequestMapping("/page_main")
	public String page_main(@AuthUser UserVo nickname, Model model){
		System.out.println("로그인한 유저 닉네임" + nickname);
		return "main/page_main";
	}
	
	
}
