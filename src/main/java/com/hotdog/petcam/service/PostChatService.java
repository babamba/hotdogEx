package com.hotdog.petcam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotdog.petcam.repository.PostChatDao;
import com.hotdog.petcam.vo.PostChatVo;

@Service
public class PostChatService {

	@Autowired
	private PostChatDao postchatDao;

	/*public void insertChat(int post_no, String nickname){
		postchatDao.chatInsert(chat);
	}*/
	
	
}
