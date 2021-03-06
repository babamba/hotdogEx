package com.hotdog.petcam.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotdog.petcam.vo.NewsVo;

@Repository
public class NewsFeedDao {
	@Autowired private SqlSession sqlSession;
	
	public List<NewsVo> latestNews(int authUser_no,int page){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("authUser_no", authUser_no);
		map.put("page", page);
		map.put("min", ((page-1)*10)+1);
		map.put("max", (page)*10);
		return sqlSession.selectList("follow.latest_news_with_count",map);
	}
	public List<NewsVo> topTen(int authUser_no){
		return sqlSession.selectList("follow.top_ten_news",authUser_no);
	}
	public List<NewsVo> recent_users(int authUser_no){
		return sqlSession.selectList("follow.recent_users",authUser_no);
	}
	public List<NewsVo> search(int authUser_no,String search,int page){
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("authUser_no", authUser_no);
		map.put("search", search);
		map.put("page", page);
		map.put("min", ((page-1)*10)+1);
		map.put("max", (page)*10);	
		
		return sqlSession.selectList("follow.search",map);
	}
	public List<NewsVo> totalTop(){
		return sqlSession.selectList("follow.total_top");
	}
}
