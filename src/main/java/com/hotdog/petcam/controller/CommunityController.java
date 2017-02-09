package com.hotdog.petcam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@RequestMapping("")
	public String communityMain(){
		return "community/community-main";
	}
}
