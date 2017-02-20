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
import com.hotdog.petcam.service.PostService;
import com.hotdog.petcam.vo.BoardVo;
import com.hotdog.petcam.vo.UserVo;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@Autowired private BoardService boardService;
		
	@Autowired private PostService postService;
	
	// 카테고리 넘버 지정 (자유게시판 : 1, QnA :2 ...)
	private final int NO_FREEBOARD = 1 ;
	private final int NO_GALLERYBOARD = 2 ;

	
	@RequestMapping("")
	public String communityMain(Model model){

		return "community/community-main";
	}
	
	/*---------------------------------------Freeboard---------------------------------------*/
	@RequestMapping("/freeboard")
	public String freeBoard(@RequestParam( value="p", required=true, defaultValue="1") Integer page,
							@RequestParam( value="kwd", required=true, defaultValue="") String keyword,
							Model model){
		
		Map<String, Object> map = boardService.getTotalListBoard(NO_FREEBOARD, page, keyword);
		model.addAttribute( "map", map );

		return "community/community-freeboard";
	}
	
	@RequestMapping("/freeboard/writeform")
	public String writeBoardForm(){
		return "community/community-writeform";
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
	
	//자유게시판  입력폼 
	@Auth
	@RequestMapping("/freeboard/writepost")
	public String writePost(BoardVo boardVo,@AuthUser UserVo authUser){
		
		int userNo = authUser.getUsers_no();
		
		boardVo.setUsers_no(userNo);
		boardVo.setCategory_no(NO_FREEBOARD);
		
		boardService.writePost(boardVo);
		
		return "redirect:/community/freeboard";
	}
	
	
	
	/*---------------------------------------Galleryboard---------------------------------------*/
	@RequestMapping("/galleryboard")
	public String galleryBoard(@RequestParam( value="p", required=true, defaultValue="1") Integer page,
								@RequestParam( value="kwd", required=true, defaultValue="") String keyword,
								Model model){
			
		Map<String, Object> map = boardService.getTotalListBoard(NO_GALLERYBOARD, page, keyword);
		model.addAttribute( "map", map );

		return "community/community-galleryboard";
	}
	
	
	@RequestMapping("/galleryboard/writegalleryform")
	public String writeGalleryForm(){
		return "community/community-writegalleryform";
	}
	

	//갤러리 ck에디터 
	@Auth
	@RequestMapping("/writegallerypost")
	public String writeGalleryPost(BoardVo boardVo,@AuthUser UserVo authUser){
		
		int userNo = authUser.getUsers_no();
		
		boardVo.setUsers_no(userNo);
		boardVo.setCategory_no(NO_GALLERYBOARD);
		
		boardService.writePost(boardVo);
		
		return "redirect:/community/galleryboard";
	}
	
	@Auth
	@RequestMapping("/viewgallery")
	public String viewGallery(@RequestParam( value="no", required=true) Integer board_no,
						   @AuthUser UserVo authUser, Model model){
		
		int userNo = authUser.getUsers_no();
		
		Map<String,Object> map = boardService.viewPost(board_no);
		
		model.addAttribute("map" , map);
		model.addAttribute("authUserNo", userNo);
		
		return "community/community-viewgallery";
	}
	
	
	/*---------------------------------------Diaryboard---------------------------------------*/
	@RequestMapping("/diaryboard")
	public String diaryBoard(@RequestParam( value="p", required=true, defaultValue="1") Integer page,
							 @RequestParam( value="kwd", required=true, defaultValue="") String keyword,
							 Model model){
		
		Map<String, Object> map = boardService.getTotalListDiary(page, keyword);
		model.addAttribute( "map", map );

		return "community/community-diaryboard";
	}
	
	@Auth
	@RequestMapping("/viewdiary")
	public String viewDiary(@RequestParam( value="no", required=true) Integer post_no,
						   @AuthUser UserVo authUser, Model model){
		
		int userNo = authUser.getUsers_no();
		
		Map<String,Object> map = postService.getPost(post_no);
		
		model.addAttribute("map" , map);
		model.addAttribute("authUserNo", userNo);
		
		return "community/community-viewdiary";
	}
	
	
	
}