package com.hotdog.petcam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotdog.petcam.security.AuthUser;
import com.hotdog.petcam.vo.UserVo;

@Controller
@RequestMapping("")
public class MainController {
	
	
	@RequestMapping("/")
	public String index(@AuthUser UserVo nickname, Model model) {
		return "main/page_main";
	}
	
	
	@RequestMapping("/loginpage")
	public String login(){
		return "main/loginPage";
	}
}
