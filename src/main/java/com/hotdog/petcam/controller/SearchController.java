package com.hotdog.petcam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotdog.petcam.service.SearchService;
import com.hotdog.petcam.vo.BoardVo;
import com.hotdog.petcam.vo.PostVo;
import com.hotdog.petcam.vo.SearchBlogVo;
import com.hotdog.petcam.vo.UserVo;

@Controller
@RequestMapping("/search")
public class SearchController {
	@Autowired private SearchService searchService;
	
	
	// 1. 통합 기본 검색 
	@RequestMapping("")
	public String SearchResult(@RequestParam(value="keyword",required=true,defaultValue="")String keyword,Model model){
		// 유저,블로그,게시판,다이어리 리스트를 가지고옴 
		List<UserVo> user_list	= searchService.searchUserResult(keyword);
		List<SearchBlogVo> blog_list = searchService.searchBlogResult(keyword);
		List<BoardVo> board_list = searchService.searchBoardResult(keyword);
		List<PostVo> post_list= searchService.searchPostResult(keyword);
		
		// 모델에 담아서 뿌림
		model.addAttribute("user_list", user_list);
		model.addAttribute("blog_list", blog_list);
		model.addAttribute("board_list", board_list);
		model.addAttribute("post_list", post_list);
		
		System.out.println(user_list);
		System.out.println(blog_list);
		System.out.println(board_list);
		System.out.println(post_list);
		
		return "search/search-result2";
	}
}
