package com.hotdog.petcam.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotdog.petcam.vo.BoardVo;
import com.hotdog.petcam.vo.PostVo;
import com.hotdog.petcam.vo.SearchBlogVo;
import com.hotdog.petcam.vo.UserVo;

@Repository
public class SearchDao {
	@Autowired SqlSession sqlSession;
	
	public List<UserVo> searchUserResult(String keyword){
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("keyword", keyword);
		return sqlSession.selectList("search.userResult", map);
	}
	
	public List<SearchBlogVo> searchBlogResult(String keyword){
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("keyword", keyword);
		return sqlSession.selectList("search.blogResult", map);
	}
	public List<BoardVo> searchBoardResult(String keyword){
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("keyword", keyword);
		return sqlSession.selectList("search.boardResult", map);
	}
	public List<PostVo> searchPostResult(String keyword){
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("keyword", keyword);
		return sqlSession.selectList("search.postResult", map);
	}
}
