package com.hotdog.petcam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotdog.petcam.service.SearchService;

@Controller
@RequestMapping("/search")
public class SearchController {
	@Autowired private SearchService searchService;
	
	@RequestMapping("")
	public String SearchResult(@RequestParam(value="keyword",required=true,defaultValue="")String keyword,Model model){
		
		
		return "search/search-result";
	}
}
