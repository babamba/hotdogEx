package com.hotdog.petcam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hotdog.petcam.security.AuthUser;
import com.hotdog.petcam.service.PostService;
import com.hotdog.petcam.vo.BlogVo;
import com.hotdog.petcam.vo.PostVo;
import com.hotdog.petcam.vo.UserVo;

@Controller
public class PostController {

		@Autowired
		private PostService postService;
		
		
		/*@RequestMapping(value = "/{nickname}/admin/write", method = RequestMethod.GET)
		public String main(@PathVariable String nickname, @ModelAttribute PostVo postVo, Model model, @AuthUser UserVo authUser){
			int no = authUser.getUsers_no();
			BlogVo blogVo = postService.getByNickname(nickname); 
			
			return "";
		}
		*/
		
	@RequestMapping("/diary")
	public String main(){
		return "diary/post-page";
	}
	
		
	
}
