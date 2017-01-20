package com.hotdog.petcam.repository;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotdog.petcam.vo.ImageVo;


@Repository
public class ImageDao {
	@Autowired
	private SqlSession sqlSession;

	public int insert(ImageVo imageVo) {
		sqlSession.insert("image.insert", imageVo);
		return imageVo.getImageNo();
	}

/*	public List<Image> get(Image image) {
		return sqlSession.selectList("image.selectByPostNo", image);
	}*/
	
	public ImageVo selectByNo(int no){
		return sqlSession.selectOne("image.selectByNo", no);
	}
	
}
