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
	
	
	// 카테고리 넘버 지정 (자유게시판 : 1, QnA :2 ...)
	private final int NO_FREEBOARD = 1 ;
	
	@RequestMapping("")
	public String freeBoard(@RequestParam( value="p", required=true, defaultValue="1") Integer page,
							@RequestParam( value="kwd", required=true, defaultValue="") String keyword,
							Model model){
		
		Map<String, Object> map = boardService.getTotalList(NO_FREEBOARD, page, keyword);
		model.addAttribute( "map", map );

		return "community/community-freeboard";
	}
	
	@Auth
	@RequestMapping("/viewpost")
	public String viewPost(@RequestParam( value="no", required=true) Integer board_no,
						   @AuthUser UserVo authUser, Model model){
		
		int userNo = authUser.getUsers_no();
		
		BoardVo boardVo = boardService.viewPost(board_no);
		boardService.increaseHits(boardVo);
		
		model.addAttribute("boardVo", boardVo);
		model.addAttribute("authUserNo", userNo);
		
		return "community/community-viewpost";
	}
	

	@RequestMapping("/writeform")
	public String writeForm(){
		return "community/community-writeform";
	}
	
	@Auth
	@RequestMapping("/writepost")
	public String writePost(BoardVo boardVo,@AuthUser UserVo authUser){
		
		int userNo = authUser.getUsers_no();
		
		boardVo.setUsers_no(userNo);
		boardVo.setCategory(NO_FREEBOARD);
		
		boardService.writePost(boardVo);
		
		return "redirect:/community/freeboard";
	}
}