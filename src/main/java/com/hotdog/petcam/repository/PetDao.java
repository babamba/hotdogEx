package com.hotdog.petcam.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotdog.petcam.vo.PetVo;

@Repository
public class PetDao {

	@Autowired private SqlSession sqlSession;
	
	public PetVo getAllByNo(int no){
		return sqlSession.selectOne("pet.getallbyno", no);
	}
}
