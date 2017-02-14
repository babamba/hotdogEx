package com.hotdog.petcam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotdog.petcam.service.CategoryService;
import com.hotdog.petcam.vo.CategoryVo;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@Autowired CategoryService categoryService;
	
	@RequestMapping("")
	public String communityMain(Model model){
		List<CategoryVo> list = categoryService.getCategoryList();
		
		model.addAttribute("list", list);
		
		return "community/community-main";
	}
}
