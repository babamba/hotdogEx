package com.hotdog.petcam.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotdog.petcam.DTO.JSONResult;
import com.hotdog.petcam.service.BoardService;
import com.hotdog.petcam.service.PetService;
import com.hotdog.petcam.vo.BoardVo;
import com.hotdog.petcam.vo.PetVo;

@Controller
@RequestMapping("/main/api/")
public class MainApiController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private PetService petService;
	
	@ResponseBody
	@RequestMapping("/board_list")
	public JSONResult list(
			@RequestParam(value="category_no", required=true)Integer category_no,
			Model model){
		System.out.println("넘어온 카테고리 번호" +category_no);
		List<BoardVo> list = boardService.getMainList(category_no);
		
		System.out.println(list);
		return JSONResult.success(list);
	}
	
	
	@ResponseBody
	@RequestMapping("/hotdog_list")
	public JSONResult hotdog(Model model, PetVo petVo){
		
		List<PetVo> list = petService.getHotdog(petVo);
		System.out.println("hotdog list!");
		
		return JSONResult.success(list);
	}
	
	
	
}
