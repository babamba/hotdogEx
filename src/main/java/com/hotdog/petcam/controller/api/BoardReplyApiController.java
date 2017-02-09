package com.hotdog.petcam.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotdog.petcam.DTO.JSONResult;
import com.hotdog.petcam.service.BoardService;
import com.hotdog.petcam.vo.BoardCommentsVo;

@Controller
@RequestMapping("/community/freeboard/api")
public class BoardReplyApiController {
	
	@Autowired
	private BoardService boardService;
	
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
}
