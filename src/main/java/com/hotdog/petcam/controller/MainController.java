package com.hotdog.petcam.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotdog.petcam.DTO.JSONResult;
import com.hotdog.petcam.security.AuthUser;
import com.hotdog.petcam.service.PetService;
import com.hotdog.petcam.vo.PetVo;
import com.hotdog.petcam.vo.UserVo;

@Controller
@RequestMapping("")
public class MainController {
	
	@Autowired
	private PetService petService;
	
	@RequestMapping("/")
	public String index(@AuthUser UserVo nickname, Model model, PetVo petVo) {
		List<PetVo> list = petService.getHotdog(petVo);
		model.addAttribute("list", list);
		System.out.println("hotdog list!");
		System.out.println("핫도그 메인에 뿌려질것들" + list);
		
		return "main/page_main";
	}
	
	
	@RequestMapping("/loginpage")
	public String login(){
		return "main/loginPage";
	}


}
