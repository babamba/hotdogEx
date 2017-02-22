package com.hotdog.petcam.controller;

import java.io.InputStream;
import java.net.InetAddress;
import java.net.UnknownHostException;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hotdog.petcam.DTO.JSONResult;
import com.hotdog.petcam.security.Auth;
import com.hotdog.petcam.security.AuthUser;
import com.hotdog.petcam.service.BlogService;
import com.hotdog.petcam.service.ImageService;
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
		
		@Autowired
		private ImageService ImageService;
		
		@RequestMapping("/{nickname}/postlist")
		public String diary(@PathVariable String nickname, Model model){
			
			Map<String, Object> map = blogService.index(nickname);
			model.addAttribute("map", map);
			
			System.out.println(map);
			return "blog/diary";
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
			Map<String, Object> map = blogService.index(nickname);
			model.addAttribute("map", map);
			return "blog/write";
		}
		
		
		@Auth
		@RequestMapping(value="/{nickname}/insert")
		public String insert(@ModelAttribute PostVo postVo, @AuthUser UserVo authUser ){
			System.out.println("publish = " + postVo.getPublish());
			System.out.println("shared = " + postVo.getShared());

			String nickname = authUser.getNickname();
			
			int users_no = authUser.getUsers_no();
			postVo.setUsers_no(users_no);

			postService.insert(postVo);
			return "redirect:/post/" + nickname + "/postlist";
		}
		
		
		/*@Auth
		@ResponseBody
	    @RequestMapping(value = "/upload", method = RequestMethod.POST)
	    public JSONResult upload(@RequestParam("file") MultipartFile file, MultipartHttpServletRequest request,
	            Model model, HttpServletResponse response) throws UnknownHostException{
	        System.out.println("upload");
	        String saveFileName = blogService.restore(file);
	        String localIp = InetAddress.getLocalHost().getHostAddress();
	        return JSONResult.success("http://150.95.141.66/hotdog/hotdog/image/user/" + saveFileName);
	    }*/
		
		@Auth
		@RequestMapping("/{nickname}/postView")
		public String postView(@PathVariable String nickname ,
							   @RequestParam(value="post_no")int post_no,
				@AuthUser UserVo authUser, Model model){
			
			Map<String, Object> users = blogService.index(nickname);
			model.addAttribute("users_map", users);
			
			
			int users_no = authUser.getUsers_no();
			
			Map<String, Object> map = postService.getPost(post_no);
			System.out.println("@@@@@@@@@@@@맵@@@@@@@@@@@@@@" + map);
			
			Map<String, Object> map2 = blogService.index(nickname);
			model.addAttribute("map2", map2);
			System.out.println("@@@@@@맵222222@@@  " + map2);
			
			model.addAttribute("map", map);
			model.addAttribute("authUserNo", users_no);
			
			return "blog/post-page";
		}
		
		
		
		
		
	
}
