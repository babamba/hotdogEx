package com.hotdog.petcam.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotdog.petcam.vo.PostVo;

@Repository
public class PostDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<PostVo> getList(int usersNo){
		List<PostVo> list = sqlSession.selectList("post.getPostList", usersNo);
		return list;
	}
	

	
}
