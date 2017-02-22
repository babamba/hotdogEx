package com.hotdog.petcam.controller.api;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hotdog.petcam.DTO.JSONResult;
import com.hotdog.petcam.security.Auth;
import com.hotdog.petcam.security.AuthUser;
import com.hotdog.petcam.service.ImageService;
import com.hotdog.petcam.service.PostService;
import com.hotdog.petcam.vo.PostVo;
import com.hotdog.petcam.vo.UserVo;

@Controller
@RequestMapping("/post/api/")
public class PostApiController {

	@Autowired
	private PostService postService;
	
	@Autowired
	private ImageService imageService;
	
	@Auth
	@ResponseBody
	@RequestMapping("/list")
	public JSONResult list(
			@RequestParam(value="p", required=true, defaultValue="1")Integer page, 
			@RequestParam(value="no", required=true, defaultValue="1")Integer users_no,
			Model model){
		System.out.println(page);
		List<PostVo> list = postService.getList(page, users_no);
		
		model.addAttribute("list", list);
		System.out.println("controller return");
		System.out.println(list);
		
		return JSONResult.success(list);
	}
	
	
/*	@Auth
	@ResponseBody
	@RequestMapping("/{nickname}/delete")
	public JSONResult delete(
			@ModelAttribute PostVo postVo,
			@RequestParam(value="users_no", required=true)Integer users_no,
			@RequestParam(value="post_no", required=true) Integer post_no,
			@AuthUser UserVo authUser, Model model){
		
		
		postVo.setUsers_no(authUser.getUsers_no());
		boolean result = postService.delete(postVo);

		return JSONResult.success(result ? postVo.getUsers_no() : -1);
	}*/
	
	@Auth
	@ResponseBody
	@RequestMapping("delete")
	public String post_delete(
			@RequestParam(value="post_no", required=true)Integer post_no){
		
		postService.delete_post(post_no);
		System.out.println("삭제됨");
		return "redirect:/";

	}
	
	@Auth
	@RequestMapping(value="/modify_view", method=RequestMethod.POST)
	public String modify_form(
			@RequestParam(value="post_no", required=true) Integer post_no, Model model){
		Map<String, Object>map = postService.getPost(post_no);
		model.addAttribute("post_map", map);
		System.out.println("수정");
		System.out.println(model);
		
		return "blog/modify-form";
	}

	@Auth
	@ResponseBody
	@RequestMapping(value ="/post_imageupload", method=RequestMethod.POST)
	public JSONResult post_imageUpload(
			@AuthUser UserVo authUser,
			@RequestParam(value = "post_image") MultipartFile post_image, Model model){
		
		
		String saveFileName = imageService.restore(post_image);
		/*imageService.PostImageUpload(postVo);*/
	
		
/*		postVo.setPost_image(saveFileName);*/
		System.out.println("post_image" + saveFileName);
		
		model.addAttribute("saveFileName", saveFileName);
		System.out.println("모델" + model);
		
		
		return JSONResult.success(saveFileName);
	}
	
	
}
