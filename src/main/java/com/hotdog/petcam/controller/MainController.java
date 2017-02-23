package com.hotdog.petcam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class MainController {
	
	
	@RequestMapping("/")
	public String index() {
		return "main/page_main";
	}
	
	
	@RequestMapping("/loginpage")
	public String login(){
		return "main/loginPage";
	}
}
