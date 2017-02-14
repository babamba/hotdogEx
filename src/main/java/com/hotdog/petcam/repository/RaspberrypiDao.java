package com.hotdog.petcam.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotdog.petcam.vo.RaspberrypiVo;

@Repository
public class RaspberrypiDao {

	@Autowired
	private SqlSession sqlSession;

	public void insert(RaspberrypiVo raspberrypiVo) {
		sqlSession.insert("raspberrypi.insert", raspberrypiVo);
	}

	public RaspberrypiVo selectByNo(RaspberrypiVo raspberrypiVo) {
		return sqlSession.selectOne("raspberrypi.selectByNo", raspberrypiVo);
	}
}
