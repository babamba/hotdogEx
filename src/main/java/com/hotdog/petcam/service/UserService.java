package com.hotdog.petcam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotdog.petcam.mail.SendMail;
import com.hotdog.petcam.repository.BlogDao;
import com.hotdog.petcam.repository.UserDao;
import com.hotdog.petcam.vo.BlogVo;
import com.hotdog.petcam.vo.PetVo;
import com.hotdog.petcam.vo.UserVo;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private BlogDao blogDao;
	
	public int join(UserVo userVo) {
		userDao.insert(userVo);
		UserVo vo1 = getId(userVo.getEmail());
		return vo1.getUsers_no();
	}
	
	// 유저 가입시 getId메소드로 UserVo 객체에 이메일값을 저장하고 BlogVo객체 UsersNo값을 넣어준다. title,
		// logo는 디폴트값으로 저장
	public void insert(UserVo userVo) {
		UserVo vo1 = getId(userVo.getEmail());
		
		BlogVo blogVo = new BlogVo();
		blogVo.setUsers_no(vo1.getUsers_no());
		blogVo.setTitle(vo1.getNickname() + "블로그");
		blogVo.setLogo_image("a.jpg");

		blogDao.insert(blogVo);

		}
	
	// 이메일 파라미터를 통해 조회한 유저넘버를 UserVo형태로 리턴
	public UserVo getId(String email) {
		return userDao.getId(email);
		}
	
	
	// 유저넘버를 파라미터로 유저정보를 UserVo 형태로 리턴
	public UserVo getUser(int users_no){
		return userDao.get(users_no);
	}
	
	

	//email을 파라미터로 받아 db에서 셀렉트하고 정보를 넣는다. 조회결과 유무로  null or not null을 판단해 낫널일 경우 트루를 리턴, 없을경우 false리턴
	public boolean idExist(String email) {
		if (userDao.idExist(email) != null) {
			return true;
		}
		return false;
	}
	
	//nickname 을 파라미터로 받아 db에서 셀렉트하고 정보를 넣는다. 조회결과 유무로  null or not null을 판단해 낫널일 경우 트루를 리턴, 없을경우 false리턴
	public boolean nicknameExist(String nickname) {
		if (userDao.idExist(nickname) != null) {
			System.out.println("nicknameExist");
			return true;
		}
		return false;
	}
	
	public UserVo getAllByNo(int no) {
		return userDao.getAllByNo(no);
	}
	
	
	// 브라우저에서 닉네임 체크 null이면 true not null이면 false
	public boolean nicknameCheck(String nickname) {
		System.out.println(nickname);
		if (userDao.nicknameExist(nickname) == null) {
			System.out.println("nicknameExist");
			return true;
		}
		return false;
	}

	//웹브라우저에서 email, pass_word, nickname을 파라미터로 받아 db에 조회후  UserVo의 객체인 authUser에 넣어 리턴
	public UserVo login(
						String email, 
						String pass_word, 
						String nickname, 
						String description,
						String infomation,
						String users_image,
						String follower_num,
						String following_num){
		UserVo authUser = userDao.selectForLogin(email, pass_word, nickname, description, infomation, users_image, follower_num, following_num);
		System.out.println("loginService");
		return authUser;
	}
	
	public void sendCode(String email,int code){
		SendMail sendMail = new SendMail();
		sendMail.sendMail(email, code);
	}
	
	public boolean checkCode(int inputCode,int code){
		
		if(inputCode==code){
			return true;
		}
		else{
			return false;
		}
	}
	public UserVo getAllByNo(int no) {
		return userDao.getAllByNo(no);
	}

	
	// *******************************************************************************************************
		// **************************************** My Account ***************************************************
		// *******************************************************************************************************
		
		public void secretModify(UserVo userVo) {
			userDao.secretModify(userVo);
		}
	
		public void userProfileModify(UserVo userVo, BlogVo blogVo, String nickname, String title, String infomation) {
			if (nickname != "") {
				userVo.setNickname(nickname);
			}
			if (infomation != "") {
				userVo.setInfomation(infomation);
			}
			if (title != "") {
				blogVo.setUsers_no(userVo.getUsers_no());
				blogVo.setTitle(title);
				blogDao.blogTitleModify(blogVo);
			}
			userDao.userProfileModify(userVo);
		}
	
		public void petProfileModify(PetVo petVo) {
			userDao.petrProfileModify(petVo);
		}

		
		
		// *******************************************************************************************************
		// **************************************** 메인페이지 리스트 뿌릴 용도 ***********************************************
		// *******************************************************************************************************
		public List<UserVo> getMainUserList(){
			return userDao.getMainUserList();
		}
		public List<UserVo> getMainMyUserList(){
			return userDao.getMainMyUserList();
		}
	
		// *******************************************************************************************************
		// **************************************** App 통신 ***************************************************
		// *******************************************************************************************************	
		public boolean appEmailCheck(String email) {
			return userDao.appEmailCheck(email);
		}

		public UserVo appLogin(String email, String pass_word, UserVo userVo) {
			userVo.setEmail(email);
			userVo.setPass_word(pass_word);

			if (userDao.appLogin(userVo) == null) {
				userVo.setUsers_no(-1);
				return userVo;
			} else {
				return userDao.appLogin(userVo);
			}
		}
		
}
