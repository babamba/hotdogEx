package com.hotdog.petcam.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotdog.petcam.vo.PostVo;

@Repository
public class PostDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<PostVo> getList(int page, int users_no){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("users_no", users_no);
		
		
		List<PostVo> list = sqlSession.selectList("post.getListByPage", map);
		return list;
	}
	
	public void insert(PostVo postVo) {
		sqlSession.insert("post.insert", postVo);
	}
	
	public int delete(PostVo postVo){
		return sqlSession.delete("post.postdelete", postVo);
	}
	
/*	public List<PostVo> getPageList(int page){
		List<PostVo> list = sqlSession.selectList("post.getListByPage");
	    return list;
	}
	*/
	
}
