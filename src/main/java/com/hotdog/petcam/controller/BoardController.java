package com.hotdog.petcam.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotdog.petcam.security.Auth;
import com.hotdog.petcam.security.AuthUser;
import com.hotdog.petcam.service.BoardService;
import com.hotdog.petcam.vo.BoardVo;
import com.hotdog.petcam.vo.UserVo;

@Controller
@RequestMapping("/community/freeboard")
public class BoardController {
	
	@Autowired private BoardService boardService;
	
	@RequestMapping("")
	public String freeBoard(@RequestParam( value="p", required=true, defaultValue="1") Integer page,
							@RequestParam( value="kwd", required=true, defaultValue="") String keyword,
							@RequestParam( value="categoryNo", required=true) Integer category_no,
							Model model){
		
		Map<String, Object> map = boardService.getTotalList(category_no, page, keyword);
		model.addAttribute( "map", map );

		return "community/community-freeboard";
	}
	
	@Auth
	@RequestMapping("/viewpost")
	public String viewPost(@RequestParam( value="no", required=true) Integer board_no,
						   @AuthUser UserVo authUser, Model model){
		
		int userNo = authUser.getUsers_no();
		
		Map<String,Object> map = boardService.viewPost(board_no);
		
		model.addAttribute("map" , map);
		model.addAttribute("authUserNo", userNo);
		
		return "community/community-viewpost";
	}
	

	@RequestMapping("/writeform")
	public String writeForm(){
		return "community/community-writeform";
	}
	
	@Auth
	@RequestMapping("/writepost")
	public String writePost(@RequestParam( value="categoryNo", required=true) Integer category_no ,BoardVo boardVo,@AuthUser UserVo authUser){
		
		int userNo = authUser.getUsers_no();
		
		boardVo.setUsers_no(userNo);
		boardVo.setCategory_no(category_no);
		
		boardService.writePost(boardVo);
		
		return "redirect:/community/freeboard";
	}
}