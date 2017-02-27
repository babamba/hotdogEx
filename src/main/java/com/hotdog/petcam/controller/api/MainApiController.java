package com.hotdog.petcam.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import com.hotdog.petcam.DTO.JSONResult;
import com.hotdog.petcam.service.BoardService;
import com.hotdog.petcam.service.PetService;
import com.hotdog.petcam.service.PostService;
import com.hotdog.petcam.vo.BoardVo;
import com.hotdog.petcam.vo.PetVo;
import com.hotdog.petcam.vo.PostVo;

@Controller
@RequestMapping("/main/api/")
public class MainApiController {

	@Autowired
	private PostService postService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private PetService petService;
	
	@ResponseBody
	@RequestMapping("/board_list")
	public JSONResult MainBoardlist(
			@RequestParam(value="category_no", required=true)Integer category_no,
			Model model){
		List<BoardVo> list = boardService.getMainList(category_no);
		
		return JSONResult.success(list);
	}
	
	@ResponseBody
	@RequestMapping("/post_list")
	public JSONResult MainPostList(PostVo postVo, Model model){
		List<PostVo> list = postService.getMainPostList(postVo);
		model.addAttribute("map", list);
		
		return JSONResult.success(list);
	}
	
	
	
	
	@ResponseBody
	@RequestMapping("/hotdog_list")
	public JSONResult hotdog(Model model, PetVo petVo){
		
		List<PetVo> list = petService.getHotdog(petVo);
		
		return JSONResult.success(list);
	}
	
	
	
}
