package com.hotdog.petcam.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotdog.petcam.repository.BlogDao;
import com.hotdog.petcam.repository.ImageDao;
import com.hotdog.petcam.repository.PostDao;
import com.hotdog.petcam.repository.UserDao;
import com.hotdog.petcam.vo.ImageVo;
import com.hotdog.petcam.vo.PostChatVo;
import com.hotdog.petcam.vo.PostCommentsVo;
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
	
	/*public PostVo getPost(int post_no){
		return postDao.getPost(post_no);
	}*/
	
	public Map<String, Object> getPost(int post_no){
		PostVo postVo = postDao.getPost(post_no);
		
		String data = postVo.getRegdate();
		String[] temp = data.split(" ");
		String[] date = temp[0].split("-");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("postVo", postVo);
		map.put("year", date[0]);
		map.put("month", date[1]);
		map.put("day", date[2]);
		
		return map;
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
	
	/*public List<PostCommentsVo> fetchReply(int post_no){
		return postDao.
	}*/
	
}
