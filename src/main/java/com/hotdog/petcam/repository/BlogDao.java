package com.hotdog.petcam.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotdog.petcam.vo.BlogVo;
import com.hotdog.petcam.vo.CaptureVo;
import com.hotdog.petcam.vo.VideoVo;

@Repository
public class BlogDao {

	@Autowired
	private SqlSession sqlSession;

	// 유저넘버로 블로그 정보 가져오기.
	public BlogVo get(int users_no) {
		return sqlSession.selectOne("blog.get", users_no);
	}

	public void insert(BlogVo vo) {
		sqlSession.insert("blog.insert", vo);
	}

	public void update(BlogVo vo) {
		sqlSession.update("blog.update", vo);
	}

	public void blogTitleModify(BlogVo blogVo) {
		sqlSession.update("blog.titleModify", blogVo);
	}

	public BlogVo getTitleByNo(int no) {
		return sqlSession.selectOne("blog.getTitleByNo", no);
	}

	public void setLogo(BlogVo blogVo) {
		sqlSession.update("blog.setLogo", blogVo);
	}

	public List<VideoVo> getVod(int users_no) {
		return sqlSession.selectList("blog.getVod", users_no);
	}

	public int deleteVod(int video_no) {
		return sqlSession.update("blog.deleteVod", video_no);
	}

	public List<CaptureVo> getCapture(int users_no) {
		return sqlSession.selectList("blog.getCapture", users_no);
	}

}
