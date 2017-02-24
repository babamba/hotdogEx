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
import com.hotdog.petcam.repository.RaspberrypiDao;
import com.hotdog.petcam.repository.UserDao;
import com.hotdog.petcam.vo.BlogVo;
import com.hotdog.petcam.vo.CaptureVo;
import com.hotdog.petcam.vo.ImageVo;
import com.hotdog.petcam.vo.RaspberrypiVo;
import com.hotdog.petcam.vo.UserVo;
import com.hotdog.petcam.vo.VideoVo;

@Service
public class BlogService {

	/* private static final String SAVE_PATH = "c://upload"; */
	// private static final String SAVE_PATH = "/upload";
	private static final String SAVE_PATH = "/Users/jw/Pictures";

	@Autowired
	private BlogDao blogDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private ImageDao imageDao;

	@Autowired
	private RaspberrypiDao raspberrypiDao;

	public ImageVo selectByNo(int no) {
		return imageDao.selectByNo(no);
	}

	public BlogVo getByNickname(String email, String nickname) {
		Integer no = null;
		UserVo authUser = userDao.idExist(email);
		if (authUser != null) {
			no = authUser.getUsers_no();
		}
		BlogVo blogVo = blogDao.get(no);
		return blogVo;
	}

	// 이메일 파라미터를 통해 조회한 유저넘버를 UserVo형태로 리턴
	public UserVo getId(String email) {
		return userDao.getId(email);
	}

	// 이메일을 파라미터로 받아 유저다오에서 이메일을 조회해 authUser에 넣고
	// 유저서비스에서 null or not null을 판단해 낫널일 경우 트루를 리턴, 없을경우 false리턴
	public BlogVo getByblog(String email) {
		Integer users_no = null;
		UserVo authUser = userDao.idExist(email);
		if (authUser != null) {
			users_no = authUser.getUsers_no();
		}
		BlogVo blogVo = blogDao.get(users_no);
		return blogVo;
	}

	public Map<String, Object> index(String nickname) {
		RaspberrypiVo piVo = new RaspberrypiVo();
		UserVo userVo = null;
		BlogVo blogVo = null;

		// 이메일로 유저번호 찾기. not null일때 세션에 유저번호 저장
		int users_no = userDao.nicknameIndex(nickname);

		// 낫널일 경우 유저번호 값이 담긴 UserVo에 유저넘버를 저장하고 usersNo객체로 한다.
		if (users_no != 0) {
			userVo = userDao.getDataByNo(users_no);
			blogVo = blogDao.get(users_no);
			piVo.setUsers_no(users_no);
			piVo = raspberrypiDao.selectByNo(piVo);
		}

		Map<String, Object> map = new HashMap<String, Object>();

		// postVo형태인 list객체에 위의 authUser(유저넘버)를 담음 usersNo를 이용해로 조회한 포스트 컬럼을
		// map객체에 넣어 저장하고 리턴
		map.put("nickname", nickname);
		map.put("userVo", userVo);
		map.put("blogVo", blogVo);
		map.put("piVo", piVo);

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

	// 정보수정에서 타이틀을 수정하기 위해
	public BlogVo getTitleByNo(int no) {
		return blogDao.getTitleByNo(no);
	}

	public void setLogo(BlogVo blogVo) {
		blogDao.setLogo(blogVo);
	}

	// vod 리스트 출력
	public List<VideoVo> getVod(int users_no) {
		return blogDao.getVod(users_no);
	}

	public boolean deleteVod(int video_no) {
		return blogDao.deleteVod(video_no) == 1;
	}

	public List<CaptureVo> getCapture(int users_no) {
		return blogDao.getCapture(users_no);
	}

}
