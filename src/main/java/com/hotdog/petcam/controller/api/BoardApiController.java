package com.hotdog.petcam.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotdog.petcam.DTO.JSONResult;
import com.hotdog.petcam.service.BoardService;
import com.hotdog.petcam.vo.BoardChatVo;
import com.hotdog.petcam.vo.BoardCommentsVo;

@Controller
@RequestMapping("/community/api")
public class BoardApiController {
	
	@Autowired
	private BoardService boardService;
	
	//게시글 조횟수 증가
	@ResponseBody
	@RequestMapping("/updateHits")
	public void updateHits(@RequestParam(value="boardNo", required=true) Integer board_no){
		
		boardService.updateHits(board_no);
	}
	
	//게시글 삭제
	@ResponseBody
	@RequestMapping( value="/deletepost", method=RequestMethod.POST)
	public JSONResult deletePost(@RequestParam( value="boardNo", required=true) Integer board_no){
		
		boolean data = boardService.deletePost(board_no);
		
		return JSONResult.success(data);
	}
	
	/////////////////////////////////////////// Reply
	@ResponseBody
	@RequestMapping("/fetchreply")
	public JSONResult fetchReply(@RequestParam(value="boardNo", required=true) Integer board_no){
				
		List<BoardCommentsVo> list = boardService.fetchReply(board_no);
		return JSONResult.success(list);
	}
	
	@ResponseBody
	@RequestMapping("/writereply")
	public JSONResult writeReply(BoardCommentsVo boardCommentsVo){
		
		BoardCommentsVo vo = boardService.writeReply(boardCommentsVo);
		
		return JSONResult.success(vo);
	}
	
	@ResponseBody
	@RequestMapping( value="/deletereply", method=RequestMethod.POST)
	public JSONResult deleteReply(@RequestParam( value="commentsNo", required=true) Integer comments_no){
		System.out.println("----------------------------------------");
		System.out.println(comments_no);
		
		boolean data = boardService.deleteReply(comments_no);
		return JSONResult.success(data);
	}
	
	
	/////////////////////////////////////////// Reply Chat
	@ResponseBody
	@RequestMapping("/fetchreplychat")
	public JSONResult fetchReplyChat(@RequestParam(value="commentsNo", required=true) Integer comments_no){
				
		List<BoardChatVo> list = boardService.fetchReplyChat(comments_no);
		return JSONResult.success(list);
	}
	
	@ResponseBody
	@RequestMapping("/writereplychat")
	public JSONResult writeReplyChat(BoardChatVo boardChatVo){
		BoardChatVo vo = boardService.writeReplyChat(boardChatVo);
		return JSONResult.success(vo);
	}
	
	@ResponseBody
	@RequestMapping( value="/deletereplychat", method=RequestMethod.POST)
	public JSONResult deleteReplyChat(@RequestParam( value="boardChatNo", required=true) Integer board_chat_no){
		
		boolean data = boardService.deleteReplyChat(board_chat_no);
		
		return JSONResult.success(data);
	}
	

	
	
	
	
}
