package com.hotdog.petcam.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotdog.petcam.repository.BlogDao;
import com.hotdog.petcam.repository.ImageDao;
import com.hotdog.petcam.repository.PostDao;
import com.hotdog.petcam.repository.UserDao;
import com.hotdog.petcam.vo.ImageVo;
import com.hotdog.petcam.vo.PostVo;
import com.hotdog.petcam.vo.UserVo;


@Service
public class PostService {

	@Autowired
	private BlogDao blogDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private PostDao postDao;
	
	@Autowired
	private ImageDao imageDao;
	
	public void insert(PostVo postVo) {
		postDao.insert(postVo);
	}
	
	public List<PostVo> getList(int page, int users_no){
		return postDao.getList(page, users_no);
	}
	
	public boolean delete(PostVo postVo){
		int result = postDao.delete(postVo);
		return (result == 1);
	}
	
	public List<PostVo> getMainPostList(String nickname){
		Integer users_no = null;
		
		users_no = userDao.getNoByNick(nickname);
		
		
		return postDao.getIndexByPostTop9(users_no);
	}
	
	
/*	public void insertImage(ImageVo imageVo){
		return imageDao.insert(imageVo);
	}*/
	
}
