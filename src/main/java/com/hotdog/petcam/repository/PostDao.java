package com.hotdog.petcam.repository;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotdog.petcam.vo.CaptureVo;
import com.hotdog.petcam.vo.PostChatVo;
import com.hotdog.petcam.vo.PostCommentsVo;
import com.hotdog.petcam.vo.PostVo;

@Repository
public class PostDao {

	@Autowired
	private SqlSession sqlSession;

	// 포스트 다이어리 ajax 리스트
		public List<PostVo> getList(int page, int users_no) {
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
		/*
		 * public int delete(PostVo postVo){ return
		 * sqlSession.delete("post.postdelete", postVo); }
		 */

		// 웹브라우저에서 세션 유저번호와 글에 저장되있는 유저번호가 같을때 넘어온 포스팅 넘버를 가지고 포스팅 삭제
		public void delete_post(int post_no) {
			sqlSession.delete("post.postdelete", post_no);
		}

		/*
		 * public List<PostVo> getPageList(int page){ List<PostVo> list =
		 * sqlSession.selectList("post.getListByPage"); return list; }
		 */

		public PostVo getPost(int post_no) {
			return sqlSession.selectOne("post.getPost", post_no);
		}

		// 블로그 메인 최신 9개 리스트
		public List<PostVo> getIndexByPostTop9(int users_no) {
			List<PostVo> list = sqlSession.selectList("post.getIndexByPostTop9", users_no);

			return list;
		}

		// 메인화면 공개범위 1인 최신 글 4개
		public List<PostVo> getMainList() {
			List<PostVo> list = sqlSession.selectList("post.getMainPostList");
			return list;
		}

		//////////////////////////////////////////////////////////////////// Reply
		// 선택된 게시글에 달린 댓글 리스트 가져오기
		public List<PostCommentsVo> fetchPostReply(int post_no) {
			return sqlSession.selectList("post.postfetchReply", post_no);
		}

		// 해당 게시글에 댓글 작성하기
		public int writePostReply(PostCommentsVo postCommentsVo) {
			sqlSession.insert("post.writePostReply", postCommentsVo);
			return postCommentsVo.getComments_no();
		}

		// 작성한 댓글 바로 가져오기
		public PostCommentsVo getReply(int comments_no) {
			return sqlSession.selectOne("post.getPostReply", comments_no);
		}

		// 댓글 갯수 카운트
		public int countReply(int post_no) {
			return sqlSession.selectOne("post.countPostReply", post_no);
		}
		
		// 조회수
		public void increaseHits(int post_no){
			sqlSession.update("post.increaseHits", post_no);
		}
		
		
		public int deletePostReply(int comments_no){
			return sqlSession.delete("post.deletePostReply", comments_no);
		}
		
		///////////////////////////////////////////////////////////////// ReplyChat
		// 선택된 게시글에 달린 댓글의 댓글 리스트
		public List<PostChatVo> fetchReplyChat(int comments_no) {
			return sqlSession.selectList("post.fetchReplyPostChat", comments_no);
		}
		
		//해당 게시글에 댓글의 댓글 작성
		public int writeReplyChat(PostChatVo postChatVo){
			sqlSession.insert("post.writeReplyPostChat", postChatVo);
			return postChatVo.getPost_chat_no();
		}
		
		public int deletePostReplyChat(int post_chat_no){
	    	return sqlSession.delete("post.deletePostReplyChat", post_chat_no);
	    }
		
		
		// 작성한 댓글 바로 가져오기
		public PostChatVo getReplyPostChat(int post_chat_no){
			return sqlSession.selectOne("post.getReplyPostChat", post_chat_no);
		}
		
		// 댓글 갯수 카운트
		public int countReplyChat(int comments_no){
			return sqlSession.selectOne("post.countReplyPostChat", comments_no);
		}
	
	// ************************* 캡쳐 템플릿 ************* 쿼리 작성안됨
	public int captureCheck(int authUser_no) {

		Calendar calender = Calendar.getInstance();

		String regdate = calender.get(Calendar.YEAR) + "-";
		if ((calender.get(Calendar.MONTH) + 1) >= 10) {
			regdate += (calender.get(Calendar.MONTH) + 1) + "-";
		} else {
			regdate += "0" + (calender.get(Calendar.MONTH) + 1) + "-";
		}
		if (calender.get(Calendar.DAY_OF_MONTH) >= 10) {
			regdate += calender.get(Calendar.DAY_OF_MONTH);
		} else {
			regdate += "0" + calender.get(Calendar.DAY_OF_MONTH);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("authUser_no", authUser_no);
		map.put("regdate", regdate);
		
		return sqlSession.selectOne("post.captureCheck", map);
	}

	public List<CaptureVo> pullCapture(int authUser_no) {
		
		Calendar calender = Calendar.getInstance();

		String regdate = calender.get(Calendar.YEAR) + "-";
		if ((calender.get(Calendar.MONTH) + 1) >= 10) {
			regdate += (calender.get(Calendar.MONTH) + 1) + "-";
		} else {
			regdate += "0" + (calender.get(Calendar.MONTH) + 1) + "-";
		}
		if (calender.get(Calendar.DAY_OF_MONTH) >= 10) {
			regdate += calender.get(Calendar.DAY_OF_MONTH);
		} else {
			regdate += "0" + calender.get(Calendar.DAY_OF_MONTH);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("authUser_no", authUser_no);
		map.put("regdate", regdate);
		
		return sqlSession.selectList("post.pullCapture", map);
	}

}
