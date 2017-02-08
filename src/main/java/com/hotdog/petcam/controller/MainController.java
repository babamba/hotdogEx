package com.hotdog.petcam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


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
	
	
}
