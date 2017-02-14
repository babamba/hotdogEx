package com.hotdog.petcam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotdog.petcam.repository.NewsFeedDao;
import com.hotdog.petcam.vo.NewsVo;

@Service
public class NewsFeedService {
	@Autowired private NewsFeedDao newsfeedDao;
	
	public List<NewsVo> latestNews(int authUser_no,int page){
		return newsfeedDao.latestNews(authUser_no,page);
	}
	public List<NewsVo> topTen(int authUser_no){
		return newsfeedDao.topTen(authUser_no);
	}
	public List<NewsVo> recent_users(int authUser_no){
		return newsfeedDao.recent_users(authUser_no);
	}
	public List<NewsVo> search(int authUser_no,String search,int page){
		return newsfeedDao.search(authUser_no,search,page);
	}
	public List<NewsVo> totalTop(){
		return newsfeedDao.totalTop();
	}
	
}
