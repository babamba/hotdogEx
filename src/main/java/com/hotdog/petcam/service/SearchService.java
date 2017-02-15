package com.hotdog.petcam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotdog.petcam.repository.SearchDao;
import com.hotdog.petcam.vo.BoardVo;
import com.hotdog.petcam.vo.PostVo;
import com.hotdog.petcam.vo.SearchBlogVo;
import com.hotdog.petcam.vo.UserVo;

@Service
public class SearchService {

	@Autowired private SearchDao searchDao;
	
	public List<UserVo> searchUserResult(String keyword){
		return searchDao.searchUserResult(keyword);
	}
	
	public List<SearchBlogVo> searchBlogResult(String keyword){
		return searchDao.searchBlogResult(keyword);
	}
	public List<BoardVo> searchBoardResult(String keyword){
		return searchDao.searchBoardResult(keyword);
	}
	public List<PostVo> searchPostResult(String keyword){
		return searchDao.searchPostResult(keyword);
	}
}
