package com.hotdog.petcam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotdog.petcam.vo.BoardVo;
import com.hotdog.petcam.vo.UserVo;


@RequestMapping("/")
@Controller
public class BoardController {

		BoardVo vo = new BoardVo();
		UserVo vo1 = new UserVo();
				
		
		public void test(){
			System.out.println("ggg");
		}
		
}
