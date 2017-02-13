package com.hotdog.petcam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotdog.petcam.DTO.JSONResult;
import com.hotdog.petcam.security.Auth;
import com.hotdog.petcam.security.AuthUser;
import com.hotdog.petcam.service.NewsFeedService;
import com.hotdog.petcam.vo.NewsVo;
import com.hotdog.petcam.vo.UserVo;

@Auth
@Controller
@RequestMapping("/community/newsfeed")
public class NewsFeedController {
	@Autowired private NewsFeedService newsfeedService;
	
	// 1. 메인 페이지에서 필요한 항목들을 뽑아온다.
	// json 랜더링은 follow 컨트롤러에서 받음
	@RequestMapping("")
	public String index(@AuthUser UserVo authUser,Model model,
						@RequestParam(value="page",required=true,defaultValue="1")Integer page){
		List<NewsVo> latest_news = newsfeedService.latestNews(authUser.getUsers_no(),page);
		List<NewsVo> top_ten = newsfeedService.topTen(authUser.getUsers_no());
		List<NewsVo> recent_users=newsfeedService.recent_users(authUser.getUsers_no());
		model.addAttribute("latest_news", latest_news);
		model.addAttribute("top_ten", top_ten);
		model.addAttribute("recent_users",recent_users);
		return "community/community-newsfeed";
	}
	
	// 2. 리스트 더 불러오기
	@ResponseBody
	@RequestMapping("/fetch")
	public Object fetch(@AuthUser UserVo authUser,Model model,
	@RequestParam(value="page",required=true,defaultValue="1")Integer page){
		List<NewsVo> latest_news = newsfeedService.latestNews(authUser.getUsers_no(),page);
		return JSONResult.success(latest_news);
	}
}
