package com.hotdog.petcam.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotdog.petcam.vo.BoardCommentsVo;
import com.hotdog.petcam.vo.BoardVo;

@Repository
public class BoardDao {
	
    @Autowired private SqlSession sqlSession;
    
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
    public void increaseHits(BoardVo boardVo){
    	sqlSession.update("board.increaseHits", boardVo);
    }
    
    // 선택된 게시글에 달린 댓글 리스트 가져오기 
    public List<BoardCommentsVo> fetchReply(int board_no){
    	return sqlSession.selectList("board.fetchReply", board_no);
    }
    
    // 해당 게시글에 댓글 작성하기
    public int writeReply(BoardCommentsVo boardCommentsVo){
    	sqlSession.insert("board.writeReply", boardCommentsVo);
    	return boardCommentsVo.getComments_no();
    }
    
    public BoardCommentsVo getReply(int comments_no){
    	return sqlSession.selectOne("board.getReply", comments_no);
    }
    
    
    
    
}