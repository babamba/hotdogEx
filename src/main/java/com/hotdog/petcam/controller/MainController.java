package com.hotdog.petcam.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRange;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	

	
}
