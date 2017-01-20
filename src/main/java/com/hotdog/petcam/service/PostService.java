package com.hotdog.petcam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotdog.petcam.repository.BlogDao;
import com.hotdog.petcam.repository.UserDao;
import com.hotdog.petcam.vo.BlogVo;
import com.hotdog.petcam.vo.UserVo;

@Service
public class PostService {

	@Autowired
	private BlogDao blogDao;
	
	@Autowired
	private UserDao userDao;
	
	
	
	
}
