package com.hotdog.petcam.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotdog.petcam.vo.BoardChatVo;
import com.hotdog.petcam.vo.BoardCommentsVo;
import com.hotdog.petcam.vo.BoardVo;
import com.hotdog.petcam.vo.PostVo;

@Repository
public class BoardDao {
	
    @Autowired private SqlSession sqlSession;
    
    public List<BoardVo> getMainList(int category_no){
		Map<String, Object> map = new HashMap<String, Object>();

		List<BoardVo> list = sqlSession.selectList("board.getMain_BoardList", category_no);
		return list;
	}
    
    
    // 조건(해당카테고리, 검색키워드)에 맞는 게시글 갯수 카운트
    public int getTotalCotunt(int category_no, String keyword){
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("category_no", category_no);
    	map.put("keyword", keyword);
    	
    	return sqlSession.selectOne("board.getTotalCount", map);
    }
    
    // 조건(해당카테고리, 검색키워드)에 맞는 게시글 가져오기
    public List<BoardVo> getList(int category_no, int currentPage, String keyword){
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("keyword", keyword);
    	map.put("category_no", category_no);
    	map.put("currentPage", currentPage);
    	return  sqlSession.selectList("board.getList", map);
    }
    
    // 게시글 작성
    public void writePost(BoardVo boardVo){
    	sqlSession.insert("board.writePost", boardVo);
    }
    
    // 선택된 게시글 하나 가져오기 
    public BoardVo viewPost(int board_no){
    	return sqlSession.selectOne("board.viewPost", board_no);
    }
    
    // 조횟수 증가
    public void increaseHits(int board_no){
    	sqlSession.update("board.increaseHits", board_no);
    }
    
    
    ////////////////////////////////////////////////////////////////////Reply    
    // 선택된 게시글에 달린 댓글 리스트 가져오기 
    public List<BoardCommentsVo> fetchReply(int board_no){
    	return sqlSession.selectList("board.fetchReply", board_no);
    }
    
    // 해당 게시글에 댓글 작성하기
    public int writeReply(BoardCommentsVo boardCommentsVo){
    	sqlSession.insert("board.writeReply", boardCommentsVo);
    	return boardCommentsVo.getComments_no();
    }
    
    // 작성한 댓글 바로 가져오기
    public BoardCommentsVo getReply(int comments_no){
    	return sqlSession.selectOne("board.getReply", comments_no);
    }
    
    // 댓글 갯수 카운트
    public int countReply(int board_no){
    	return sqlSession.selectOne("board.countReply", board_no);
    }

    
    ////////////////////////////////////////////////////////////////////ReplyChat    
    // 선택된 게시글에 달린 댓글 리스트 가져오기 
    public List<BoardChatVo> fetchReplyChat(int comments_no){
    	return sqlSession.selectList("board.fetchReplyChat", comments_no);
    }
    
    // 해당 게시글에 댓글 작성하기
    public int writeReplyChat(BoardChatVo boardChatVo){
    	sqlSession.insert("board.writeReplyChat", boardChatVo);
    	return boardChatVo.getComments_no();
    }
    
    // 작성한 댓글 바로 가져오기
    public BoardChatVo getReplyChat(int board_chat_no){
    	return sqlSession.selectOne("board.getReplyChat", board_chat_no);
    }
    
    // 댓글 갯수 카운트
    public int countReplyChat(int comments_no){
    	return sqlSession.selectOne("board.countReplyChat", comments_no);
    }
    
    ////////////////////////////////////////////////////////////////////Diary 
    
    public int getTotalCotuntDiary(String keyword){
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("keyword", keyword);
    	return sqlSession.selectOne("board.getTotalCountDiary", map);
    }
    
    public List<PostVo> getListDiary(int currentPage, String keyword){
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("keyword", keyword);
    	map.put("currentPage", currentPage);
    	return  sqlSession.selectList("board.getListDiary", map);
    }
    
    
    
    
    
}