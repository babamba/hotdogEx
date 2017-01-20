package com.hotdog.petcam.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotdog.petcam.vo.BlogVo;

@Repository
public class BlogDao {

	@Autowired
	private SqlSession sqlSession;
	
	//유저넘버로 블로그 정보 가져오기.
	public BlogVo get(int no){
		return sqlSession.selectOne("blog.get", no);
	}
	
	public void insert(BlogVo vo) {
		System.out.println("유저 가입하면서 블로그 인서트");
		sqlSession.insert("blog.insert", vo);
	}
	
	public void update(BlogVo vo) {
		sqlSession.update("blog.update", vo);
	}
	
	
	
	
	
}
