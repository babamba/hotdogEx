package com.hotdog.petcam.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hotdog.petcam.security.Auth;
import com.hotdog.petcam.security.AuthUser;
import com.hotdog.petcam.service.BlogService;
import com.hotdog.petcam.service.PostService;
import com.hotdog.petcam.vo.BlogVo;
import com.hotdog.petcam.vo.PostVo;
import com.hotdog.petcam.vo.UserVo;

@Controller
@RequestMapping("/diary")
public class PostController {

		@Autowired
		private PostService postService;
		
		@Autowired
		private BlogService blogService;
		
		@Auth
		@RequestMapping("/{nickname}/postlist")
		public String diary(@PathVariable String nickname, Model model){
			
			Map<String, Object> map = blogService.index(nickname);
			model.addAttribute("map", map);
			
			System.out.println(map);
			return "blog/diary";
		}
		
		
		@Auth
		@RequestMapping("/{nickname}/write")
		public String main(@PathVariable String nickname, @ModelAttribute PostVo postVo, Model model, @AuthUser UserVo authUser) {
			
			return "blog/write";
		}
		
	
		
		
	
}
