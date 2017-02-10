package com.hotdog.petcam.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotdog.petcam.vo.PostChatVo;
import com.hotdog.petcam.vo.PostCommentsVo;
import com.hotdog.petcam.vo.PostVo;

@Repository
public class PostDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 포스트 다이어리 ajax 리스트
	public List<PostVo> getList(int page, int users_no){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("users_no", users_no);
		
		
		List<PostVo> list = sqlSession.selectList("post.getListByPage", map);
		return list;
	}
	
	// 포스팅 작성
	public void insert(PostVo postVo) {
		sqlSession.insert("post.insert", postVo);
	}
	
	// 포스팅 삭제
	public int delete(PostVo postVo){
		return sqlSession.delete("post.postdelete", postVo);
	}
	
/*	public List<PostVo> getPageList(int page){
		List<PostVo> list = sqlSession.selectList("post.getListByPage");
	    return list;
	}
	*/
	
	public PostVo getPost(int post_no){
		return sqlSession.selectOne("post.getPost", post_no);
	}
	
	// 블로그 메인 최신 9개 리스트
	public List<PostVo> getIndexByPostTop9(int users_no){
		List<PostVo> list = sqlSession.selectList("post.getIndexByPostTop9",users_no);
		
		return list;
	}
	
	
	 ////////////////////////////////////////////////////////////////////Reply
	 // 선택된 게시글에 달린 댓글 리스트 가져오기 
	public List<PostCommentsVo> fetchPostReply(int post_no){
		return sqlSession.selectList("post.postfetchReply", post_no);
	}
	
	// 해당 게시글에 댓글 작성하기
	public int writePostReply(PostCommentsVo postCommentsVo){
		sqlSession.insert("post.writePostReply", postCommentsVo);
		return postCommentsVo.getComments_no();
	}
	
	// 작성한 댓글 바로 가져오기
	
}
