package com.hotdog.petcam.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotdog.petcam.vo.PostChatVo;

@Repository
public class PostChatDao {

	@Autowired
	private SqlSession sqlSession;
	
	public void chatInsert(PostChatVo chat){
		sqlSession.insert("post.insertChat", chat);
	}
}
