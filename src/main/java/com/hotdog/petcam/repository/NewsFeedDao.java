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
		return sqlSession.selectList("follow.latest_news",map);
	}
	public List<NewsVo> topTen(int authUser_no){
		return sqlSession.selectList("follow.top_ten_news",authUser_no);
	}
	
}
