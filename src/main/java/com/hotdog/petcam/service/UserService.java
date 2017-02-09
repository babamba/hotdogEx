package com.hotdog.petcam.service;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

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
		
		PetVo pet = new PetVo();
		pet.setUsers_no(userVo.getUsers_no());
		userDao.insertPet(pet);
	}

	public void createFolder(int no) {
		try {
			URL url = new URL("http://150.95.141.66/test/cgi-bin/register.py?userno=" + no);

			URLConnection conn = url.openConnection();

			InputStream is = conn.getInputStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(is));
			char[] buff = new char[512];
			int len = -1;

			while ((len = br.read(buff)) != -1) {
				System.out.print(new String(buff, 0, len));
			}

			br.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 이메일 파라미터를 통해 조회한 유저넘버를 UserVo형태로 리턴
	public UserVo getId(String email) {
		return userDao.getId(email);
	}

	// 유저넘버를 파라미터로 유저정보를 UserVo 형태로 리턴
	public UserVo getUser(int users_no) {
		return userDao.get(users_no);
	}

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

	// email을 파라미터로 받아 db에서 셀렉트하고 정보를 넣는다. 조회결과 유무로 null or not null을 판단해 낫널일 경우
	// 트루를 리턴, 없을경우 false리턴
	public boolean idExist(String email) {
		if (userDao.idExist(email) != null) {
			return true;
		}
		return false;
	}

	// nickname 을 파라미터로 받아 db에서 셀렉트하고 정보를 넣는다. 조회결과 유무로 null or not null을 판단해
	// 낫널일 경우 트루를 리턴, 없을경우 false리턴
	public boolean nicknameExist(String nickname) {
		if (userDao.idExist(nickname) != null) {
			return true;
		}
		return false;
	}

	// 브라우저에서 닉네임 체크 null이면 true not null이면 false
	public boolean nicknameCheck(String nickname) {
		if (userDao.nicknameExist(nickname) == null) {
			return true;
		}
		return false;
	}

	public UserVo getAllByNo(int no) {
		return userDao.getAllByNo(no);
	}

	// 웹브라우저에서 email, pass_word, nickname을 파라미터로 받아 db에 조회후 UserVo의 객체인
	// authUser에 넣어 리턴
	public UserVo login(String email, String pass_word, String nickname) {
		UserVo authUser = userDao.selectForLogin(email, pass_word, nickname);
		System.out.println("loginService");
		return authUser;
	}

	public void sendCode(String email, int code) {
		SendMail sendMail = new SendMail();
		sendMail.sendMail(email, code);
	}

	public boolean checkCode(int inputCode, int code) {

		if (inputCode == code) {
			return true;
		} else {
			return false;
		}
	}

	// *******************************************************************************************************
	// **************************************** My Account
	// ***************************************************
	// *******************************************************************************************************

	public void secretModify(UserVo userVo) {
		userDao.secretModify(userVo);
		createSecret(userVo);
	}

	public void createSecret(UserVo userVo){
        try {
            URL url = new URL("http://150.95.141.66/test/cgi-bin/secregister.py?nickname="+ userVo.getNickname()+"&password="+userVo.getSec_pass_word() );
            
            URLConnection conn = url.openConnection();
        
             InputStream is = conn.getInputStream();
                BufferedReader br = new BufferedReader(new InputStreamReader(is));
                char[] buff = new char[512];
                int len = -1;
                
                while( (len = br.read(buff)) != -1) {
                   System.out.print(new String(buff, 0, len));
                }
                
                br.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	public void userProfileModify(UserVo userVo, BlogVo blogVo, String nickname, String title, String infomation,
			String password) {

		if (nickname.length() >= 1) {
			userVo.setNickname(nickname);
		}
		if (infomation.length() >= 1) {
			userVo.setInfomation(infomation);
		}
		if (password.length() >= 1) {
			userVo.setPass_word(password);
		}
		if (title.length() >= 1) {
			blogVo.setUsers_no(userVo.getUsers_no());
			blogVo.setTitle(title);
			blogDao.blogTitleModify(blogVo);
		}
		userDao.userProfileModify(userVo);
	}

	public void setImage(UserVo userVo) {
		userDao.setImage(userVo);
	}

	public void petProfileModify(PetVo petVo, int no, String name, String info, String co_date, String age,
			String gender) {

		petVo.setUsers_no(no);

		// 펫이 있는지 없는지 검사
		if (userDao.existPet(petVo) == false) {
			// 없으면 입력된 정보로 펫 등록
			if (name.length() >= 1) {
				petVo.setName(name);
			}
			if (info.length() >= 1) {
				petVo.setInfo(info);
			}
			if (co_date.length() >= 1) {
				petVo.setCo_Date(co_date);
			}
			if (age.length() >= 1) {
				petVo.setAge(age);
			}
			if (gender.length() >= 1) {
				petVo.setGender(gender);
			}
			userDao.insertPet(petVo);
		} else {
			// 있으면 수정
			PetVo ModiPet = userDao.getPet(no);

			if (name.length() >= 1) {
				ModiPet.setName(name);
			}
			if (info.length() >= 1) {
				ModiPet.setInfo(info);
			}
			if (co_date.length() >= 1) {
				ModiPet.setCo_Date(co_date);
			}
			if (age.length() >= 1) {
				ModiPet.setAge(age);
			}
			if (gender.length() >= 1) {
				ModiPet.setGender(gender);
			}
			ModiPet.setUsers_no(no);
			userDao.petProfileModify(ModiPet);

		}
	}

	public void setPetImage(PetVo petVo) {

		userDao.setPetImage(petVo);

	}

	// *********************************************************
	// *************** Secret Check ****************************
	// *********************************************************

	public boolean firstCheck(UserVo authUser) {
		Object object = userDao.firstCheck(authUser);

		if (object == null) {
			return true;
		} else {
			return false;
		}
	}

	public UserVo secretLogin(UserVo userVo) {
		return userDao.secretLogin(userVo);
	}

	// ************************ App account ***********************

	public void appUserProfileModify(UserVo userVo) {
		userDao.appUserProfileModify(userVo);
	}
	
	public PetVo getPet(int users_no){
		return userDao.getPet(users_no);
	}
}
