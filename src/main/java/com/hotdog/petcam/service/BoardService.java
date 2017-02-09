package com.hotdog.petcam.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotdog.petcam.repository.BoardDao;
import com.hotdog.petcam.vo.BoardChatVo;
import com.hotdog.petcam.vo.BoardCommentsVo;
import com.hotdog.petcam.vo.BoardVo;

@Service
public class BoardService {
	
    @Autowired private BoardDao boardDao;
    
    private static final int LIST_SIZE= 10; //리스팅되는 게시물의 수
    private static final int PAGE_SIZE= 5; //페이지 리스트의 페이지 수
    
    // 게시판 리스트 가져오기
    public Map<String,Object> getTotalList(int category_no, int currentPage, String keyword){
            
    		// limit 사용위해 페이징 계산해서 전달
    		int page = (currentPage - 1) * LIST_SIZE;
    		
    		// 페이징을 위한 기본 데이터 계산
            int totalCount = boardDao.getTotalCotunt(category_no, keyword);   
            int pageCount= (int)Math.ceil((double)totalCount / LIST_SIZE);
            int blockCount = (int)Math.ceil( (double)pageCount / PAGE_SIZE );
            int currentBlock = (int)Math.ceil( (double)currentPage / PAGE_SIZE );
            
            //파라미터 page 값  검증
                    if( currentPage < 1 ) {
                    	currentPage = 1;
                        currentBlock = 1;
                    } else if( currentPage > pageCount ) {
                    	currentPage = pageCount;
                        currentBlock = (int)Math.ceil( (double)currentPage / PAGE_SIZE );
                    }
                    
            // view에서 페이지 리스트를 렌더링 하기위한 데이터 값 계산
            int beginPage = currentBlock == 0 ? 1 : (currentBlock - 1)*PAGE_SIZE + 1;
            int prevPage = ( currentBlock > 1 ) ? ( currentBlock - 1 ) * PAGE_SIZE : 0;
            int nextPage = ( currentBlock < blockCount ) ? currentBlock * PAGE_SIZE + 1 : 0;
            int endPage = ( nextPage > 0 ) ? ( beginPage - 1 ) + LIST_SIZE : pageCount;
            
            // TotalCount 계산했던 리스트에서 View로 만들 리스트 가져오기
            List<BoardVo> list = boardDao.getList(category_no, page, keyword);
            
            // 맵에 데이터 저장
            Map<String,Object> map = new HashMap<String,Object>();
     
            map.put("list", list);
            map.put("totalCount", totalCount);
            map.put("listSize", LIST_SIZE);
    		map.put("currentPage", currentPage );
            map.put("beginPage", beginPage);
            map.put("endPage", endPage);
            map.put("prevPage", prevPage);
            map.put("nextPage", nextPage);
    		map.put("keyword", keyword );

            return map;
        }
    
    // 게시글 작성
    public void writePost(BoardVo boardVo){
    	boardDao.writePost(boardVo);
    }
    
    // 선택된 게시글 하나 가져오기 
    public BoardVo viewPost(int board_no){
    	return boardDao.viewPost(board_no);
    }
    
    // 조횟수 증가
    public void increaseHits(BoardVo boardVo){
    	boardDao.increaseHits(boardVo);
    }
    
    
    ////////////////////////////////////////////////////////////////////Reply    
    // 선택된 게시글에 달린 댓글 리스트 가져오기 
    public List<BoardCommentsVo> fetchReply(int board_no){
    	return boardDao.fetchReply(board_no);
    }
    
    // 해당 게시글에 댓글 작성하기
    public BoardCommentsVo writeReply(BoardCommentsVo boardCommentsVo){
    	int comments_no = boardDao.writeReply(boardCommentsVo);
    	return boardDao.getReply(comments_no);
    }
    
    
    ////////////////////////////////////////////////////////////////////ReplyChat    
    // 선택된 게시글에 달린 댓글 리스트 가져오기 
    public List<BoardChatVo> fetchReplyChat(int comments_no){
    	return boardDao.fetchReplyChat(comments_no);
    }
    
    // 해당 게시글에 댓글 작성하기
    public BoardChatVo writeReplyChat(BoardChatVo boardChatVo){
    	int board_chat_no = boardDao.writeReplyChat(boardChatVo);
    	return boardDao.getReplyChat(board_chat_no);
    }

   
    
}