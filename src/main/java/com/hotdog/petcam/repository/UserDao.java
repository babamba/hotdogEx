package com.hotdog.petcam.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotdog.petcam.vo.PetVo;
import com.hotdog.petcam.vo.UserVo;

@Repository
public class UserDao {

	@Autowired
	private SqlSession sqlSession;

	public int insert(UserVo userVo) {
		sqlSession.insert("user.insert", userVo);
		return userVo.getUsers_no();
	}

	public UserVo get(int users_no) {
		return sqlSession.selectOne("user.getByNo", users_no);
	}

	public UserVo getId(String email) {
		System.out.println(email + "email로 유저넘버 조회전");
		return sqlSession.selectOne("user.getById", email);
	}

	public int getNoByNick(String nickname) {
		return sqlSession.selectOne("user.getNoByNick", nickname);
	}

	public UserVo getDataByNo(int users_no) {
		return sqlSession.selectOne("user.getDataByNo", users_no);
	}

	// 이메일 파라미터로 유저넘버 조회 UserVo 형태의 authUser에 리턴
	public UserVo idExist(String email) {
		UserVo authUser = sqlSession.selectOne("user.idExist", email);
		return authUser;
	}

	// 닉네임 파라미터로 유저넘버 조회 UserVo 형태의 authUser에 리턴
	public UserVo nicknameExist(String nickname) {
		return sqlSession.selectOne("user.nicknameExist", nickname);
	}

	// 맵형태의 email, password, nickname을 조회해 담고 UserVo형태의 authUser에 담아 리턴
	public UserVo selectForLogin(String email, String pass_word, String nickname, String description, String infomation,
			String users_image, String follower_num, String following_num) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("email", email);
		map.put("pass_word", pass_word);
		map.put("nickname", nickname);
		map.put("description", description);
		map.put("infomation", infomation);
		map.put("users_image", users_image);
		map.put("follower_num", follower_num);
		map.put("following_num", following_num);

		UserVo authUser = sqlSession.selectOne("user.selectForLogin", map);
		System.out.println("UserDao login");
		return authUser;
	}

	// 맵형태의 email, password, nickname을 조회해 담고 UserVo형태의 authUser에 담아 리턴
	public UserVo selectForLogin(String email, String pass_word, String nickname) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("pass_word", pass_word);
		map.put("nickname", nickname);
		UserVo authUser = sqlSession.selectOne("user.selectForLogin", map);
		return authUser;
	}

	public UserVo getAllByNo(int no) {
		return sqlSession.selectOne("user.getallbyno", no);
	}

	public List<UserVo> getMainUserList() {
		return sqlSession.selectList("user.getMainUserList");
	}

	public List<UserVo> getMainMyUserList() {
		return sqlSession.selectList("user.getMainMyUserList");
	}

	// *******************************************************************************************************
	// **************************************** My Account
	// ***************************************************
	// *******************************************************************************************************

	public void secretModify(UserVo userVo) {
		sqlSession.update("user.secretModify", userVo);
	}

	public void userProfileModify(UserVo userVo) {
		sqlSession.update("user.userprofileModify", userVo);
	}

	public void setImage(UserVo userVo) {
		sqlSession.update("user.setImage", userVo);

	}

	public void petProfileModify(PetVo petVo) {
		sqlSession.update("user.petprofileModify", petVo);
	}

	public void setPetImage(PetVo petVo) {
		sqlSession.update("user.setpetimage", petVo);
	}

	// 펫이 있는지 없는지 검사한다.
	public boolean existPet(PetVo petVo) {
		if (sqlSession.selectOne("user.existPet", petVo) == null) {
			return false;
		} else {
			return true;
		}
	}

	public PetVo getPet(int no) {
		return sqlSession.selectOne("user.getPet", no);
	}

	public void insertPet(PetVo petVo) {
		sqlSession.insert("user.insertPet", petVo);
	}

	// *******************************************************************************************************
	// ***************************** Secret
	// ***************************************************
	// *******************************************************************************************************

	public UserVo firstCheck(UserVo authUser) {
		return sqlSession.selectOne("user.firstCheck", authUser);
	}

	public UserVo secretLogin(UserVo userVo) {
		return sqlSession.selectOne("user.secretLogin", userVo);
	}

	// *******************************************************************************************************
	// **************************************** App 통신
	// ***************************************************
	// *******************************************************************************************************

	public boolean appEmailCheck(String email) {
		Object object = sqlSession.selectOne("user.appEmailCheck", email);
		if (object == null) {
			return false;
		}
		return true;
	}

	public UserVo appLogin(UserVo userVo) {
		return sqlSession.selectOne("user.appLogin", userVo);
	}

	// ************************* App account ******************
	public void appUserProfileModify(UserVo userVo) {
		sqlSession.update("user.appUserProfileModify", userVo);
	}

}
