package com.hotdog.petcam.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hotdog.petcam.repository.BlogDao;
import com.hotdog.petcam.repository.ImageDao;
import com.hotdog.petcam.repository.PostDao;
import com.hotdog.petcam.repository.UserDao;
import com.hotdog.petcam.vo.BlogVo;
import com.hotdog.petcam.vo.ImageVo;
import com.hotdog.petcam.vo.PostVo;
import com.hotdog.petcam.vo.UserVo;

@Service
public class BlogService {
	
	private static final String SAVE_PATH = "c:\\upload";

	@Autowired
	private BlogDao blogDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private PostDao postDao;
	
	@Autowired
	private ImageDao imageDao;
	
	
	public ImageVo selectByNo(int no){
		return imageDao.selectByNo(no);
	}
	
	public BlogVo getByNickname(String email, String nickname) {
		Integer no =  null;
		UserVo authUser = userDao.idExist(email);
		if (authUser != null) {
			no = authUser.getUsers_no();
		}
		BlogVo blogVo = blogDao.get(no);
		return blogVo;
	}
	
	public int insertImage(ImageVo imageVo) {
		return imageDao.insert(imageVo);
	}
	
	
	//이메일 파라미터를 통해 조회한 유저넘버를 UserVo형태로 리턴
	public UserVo getId(String email){
		return userDao.getId(email);
	}
	
	//이메일을 파라미터로 받아 유저다오에서 이메일을 조회해 authUser에 넣고 
		//유저서비스에서 null or not null을 판단해 낫널일 경우 트루를 리턴, 없을경우 false리턴
		public BlogVo getByblog(String email) {
			Integer users_no = null;
			UserVo authUser = userDao.idExist(email);
			if (authUser != null) {
				users_no = authUser.getUsers_no();
			}
			BlogVo blogVo = blogDao.get(users_no);
			return blogVo;
		}
		
		
	
/*	public Map<String, Object> index(String email){
		Integer usersNo = null;
		
		//이메일로 유저번호 찾기.  not null일때 세션에 유저번호 저장
		UserVo authUser = userDao.idExist(email); 
		
		//낫널일 경우  int형 usersNo객체에  유저번호 값이 담긴 authUser를 넣는다.
		if(authUser != null){
			usersNo = authUser.getUsers_no();
		} 
		
		Map<String, Object> map = null;
		map = new HashMap<String, Object>();
		
		//postVo형태인 list객체에 유저넘버를 파라미터로 조회한 포스트 컬럼을 map객체에 넣어 저장하고 리턴
		List<PostVo> postlist = postDao.getList(usersNo);
		map.put("post", postlist);
			
		return map;
	}*/
		
		public Map<String, Object> index(String nickname){
			Integer usersNo = null;
			
			//이메일로 유저번호 찾기.  not null일때 세션에 유저번호 저장
			UserVo authUser = userDao.nicknameExist(nickname); 
			
			//낫널일 경우 유저번호 값이 담긴 UserVo에 유저넘버를 저장하고 usersNo객체로 한다.
			if(authUser != null){
				usersNo = authUser.getUsers_no();
			} 
			
			Map<String, Object> map = null;
			map = new HashMap<String, Object>();
			
			//postVo형태인 list객체에  위의 authUser(유저넘버)를 담음 usersNo를 이용해로 조회한 포스트 컬럼을 map객체에 넣어 저장하고 리턴
			List<PostVo> postlist = postDao.getList(usersNo);
			map.put("post", postlist);
				
			return map;	
		}
	
	
	
	public void restore(MultipartFile file, BlogVo blogVo) {
		String saveFileName = "";
		try {
			if (file.isEmpty() == true) {
				return;
			}

			String orgFileName = file.getOriginalFilename();
			String extName = orgFileName.substring(orgFileName.lastIndexOf('.') + 1);
			saveFileName = generateSaveFileName(extName);

			writeFile(file, saveFileName);
			blogVo.setLogo_image(saveFileName);
			blogDao.update(blogVo);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public void restore(MultipartFile file, Long userNo) {
		String saveFileName = "";
		try {
			if (file.isEmpty() == true) {
				return;
			}

			String orgFileName = file.getOriginalFilename();
			String extName = orgFileName.substring(orgFileName.lastIndexOf('.') + 1);
			saveFileName = generateSaveFileName(extName);

			writeFile(file, saveFileName);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private String generateSaveFileName(String extName) {
		String fileName = "";
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += "." + extName;
		return fileName;
	}

	private void writeFile(MultipartFile file, String saveFileName) throws IOException {
		byte[] fileData = file.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
		fos.write(fileData);
		fos.close();
	}
	
	
	
	
	
	
	
}
