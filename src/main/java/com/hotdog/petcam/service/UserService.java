package com.hotdog.petcam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotdog.petcam.mail.SendMail;
import com.hotdog.petcam.repository.BlogDao;
import com.hotdog.petcam.repository.UserDao;
import com.hotdog.petcam.vo.BlogVo;
import com.hotdog.petcam.vo.UserVo;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private BlogDao blogDao;
	
	public int join(UserVo userVo){
		return userDao.insert(userVo);
	}
	
	//유저 가입시 getId메소드로 UserVo 객체에 이메일값을 저장하고 BlogVo객체 UsersNo값을 넣어준다. title, logo는 디폴트값으로 저장
	public void insert(UserVo userVo){
		UserVo vo1 = getId(userVo.getEmail());
		System.out.println(vo1);
		
		BlogVo blogVo = new BlogVo();
		blogVo.setUsers_no(vo1.getUsers_no());
		blogVo.setTitle(vo1.getNickname() + "블로그");
		blogVo.setLogo_image("a.jpg");
		System.out.println(vo1);
		
		System.out.println(blogVo);
		System.out.println("유저서비스 블로그생성");
		blogDao.insert(blogVo);
	}
	
	// 이메일 파라미터를 통해 조회한 유저넘버를 UserVo형태로 리턴
	public UserVo getId(String email){
		System.out.println(email);
		return userDao.getId(email);
	}
	
	
	// 유저넘버를 파라미터로 유저정보를 UserVo 형태로 리턴
	public UserVo getUser(int users_no){
		return userDao.get(users_no);
	}
	
	

	//email을 파라미터로 받아 db에서 셀렉트하고 정보를 넣는다. 조회결과 유무로  null or not null을 판단해 낫널일 경우 트루를 리턴, 없을경우 false리턴
	public boolean idExist(String email) {
		if (userDao.idExist(email) != null) {
			System.out.println("idExist");
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
	public UserVo login(String email, String pass_word, String nickname){
		UserVo authUser = userDao.selectForLogin(email, pass_word, nickname);
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
	
	
}
