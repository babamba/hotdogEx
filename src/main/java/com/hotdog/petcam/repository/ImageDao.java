package com.hotdog.petcam.repository;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotdog.petcam.vo.ImageVo;
import com.hotdog.petcam.vo.PostVo;


@Repository
public class ImageDao {
	@Autowired
	private SqlSession sqlSession;

	public void insert(ImageVo imageVo) {
		sqlSession.insert("image.insert", imageVo);
	}

/*	public List<Image> get(Image image) {
		return sqlSession.selectList("image.selectByPostNo", image);
	}*/
	
	public ImageVo selectByNo(int no){
		return sqlSession.selectOne("image.selectByNo", no);
	}
	
	public void uploadPostImage(PostVo postVo){
		sqlSession.update("post.post_image_insert",postVo);
	}
	
	
}
