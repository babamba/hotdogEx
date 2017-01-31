package com.hotdog.petcam.controller;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hotdog.petcam.DTO.JSONResult;
import com.hotdog.petcam.security.Auth;
import com.hotdog.petcam.security.AuthUser;
import com.hotdog.petcam.service.BlogService;
import com.hotdog.petcam.service.PostService;
import com.hotdog.petcam.vo.BlogVo;
import com.hotdog.petcam.vo.ImageVo;
import com.hotdog.petcam.vo.PostImageVo;
import com.hotdog.petcam.vo.PostVo;
import com.hotdog.petcam.vo.UserVo;

@Controller
@RequestMapping("/post")
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
			return "blog/diarytest";
		}
		
		/*@Auth
		@RequestMapping(value = "/{id}/admin/write", method = RequestMethod.POST)
		public String insert(@AuthUser Jusers authUser, @ModelAttribute Post post) {
			String id = authUser.getId();
			postService.insert(post);
			return "redirect:/" + id;
		}
		*/
		@Auth
		@RequestMapping("/{nickname}/write")
		public String main(@PathVariable String nickname, @ModelAttribute PostVo postVo, Model model, @AuthUser UserVo authUser) {
			
			return "blog/write";
		}
		
		@Auth
		@RequestMapping(value="/{nickname}/insert",  method = RequestMethod.POST)
		public String insert(@ModelAttribute PostVo postVo, @AuthUser UserVo authUser){
			String nickname = authUser.getNickname();
			int users_no = authUser.getUsers_no();
			postVo.setUsers_no(users_no);
			
			System.out.println(postVo);
			postService.insert(postVo);
			return "redirect:/blog/" + nickname;
		}
		
		/*@Auth
		@ResponseBody
		@RequestMapping(value = "/upload", method = RequestMethod.POST)
		
		public void image(@RequestParam(value="file") MultipartFile Filedata, Model model,
				HttpServletRequest request, HttpServletResponse response, @AuthUser UserVo authUser){
		
			blogService.restore(Filedata);
			
		}*/
		
		@ResponseBody
	    @RequestMapping(value = "/upload", method = RequestMethod.POST)
	    public JSONResult upload(@RequestParam("file") MultipartFile file,
	            Model model, HttpServletResponse response){
	        System.out.println("upload");
	        String saveFileName = blogService.restore(file);
	        return JSONResult.success("D:\\upload\\" + saveFileName);
	    }
		
		
		
		
		
		
		
	
}
