package com.hotdog.petcam.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.multipart.MultipartFile;

import com.hotdog.petcam.DTO.JSONResult;
import com.hotdog.petcam.security.Auth;
import com.hotdog.petcam.security.AuthUser;
import com.hotdog.petcam.security.Secret;
import com.hotdog.petcam.service.BlogService;
import com.hotdog.petcam.service.FileUploadService;
import com.hotdog.petcam.service.ImageService;
import com.hotdog.petcam.service.RaspberrypiService;
import com.hotdog.petcam.service.UserService;
import com.hotdog.petcam.vo.BlogVo;
import com.hotdog.petcam.vo.PetVo;
import com.hotdog.petcam.vo.RaspberrypiVo;
import com.hotdog.petcam.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private BlogService blogService;
	@Autowired
	private ImageService imageService;
	@Autowired
	private FileUploadService fileService;
	@Autowired
	private RaspberrypiService raspberrypiService;

	@RequestMapping("/login")
	public String login(@ModelAttribute UserVo vo, Model model, HttpServletRequest request, HttpSession session) {

		return "redirect:/";
	}

	@RequestMapping("/loginfail")
	public String loginFail() {
		return "main/loginFailPage";
	}

	@ResponseBody
	@RequestMapping("/app/emailcheck")
	public Object appEmailCheck(@RequestParam(value = "email") String email) {
		return JSONResult.success(userService.appEmailCheck(email) ? "exist" : "not exist");
	}

	@ResponseBody
	@RequestMapping("/app/login")
	public Object appLogin(@RequestParam(value = "email") String email,
			@RequestParam(value = "pass_word") String pass_word, @ModelAttribute UserVo userVo) {

		UserVo result = userService.appLogin(email, pass_word, userVo);

		return JSONResult.success(result);
	}

	@RequestMapping(value = "/join")
	public String join(@RequestParam(value = "nickname", required = true, defaultValue = "") String nickname,
			@ModelAttribute UserVo userVo, HttpServletRequest request) {

		int users_no = userService.join(userVo);
		userVo.setUsers_no(users_no);
		userService.insert(userVo);
		userService.createFolder(users_no);

		return "redirect:/";
	}

	@ResponseBody
	@RequestMapping(value = "/app/join")
	public Object appjoin(@ModelAttribute UserVo userVo, HttpServletRequest request) {

		int users_no = userService.join(userVo);
		userVo.setUsers_no(users_no);
		userService.insert(userVo);

		return JSONResult.success(userVo);
	}

	@Auth
	@RequestMapping("/logout")
	public String logout() {
		return "redirect:/";
	}

	// 코드 체크
	@ResponseBody
	@RequestMapping("/checkcode")
	public Object test2(@RequestParam(value = "code", required = true, defaultValue = "") int inputCode,
			HttpServletRequest request) {
		int code = (int) request.getSession().getAttribute("code");
		return JSONResult.success(userService.checkCode(inputCode, code) ? "yes" : "no");
	}

	// 닉네임체크
	@ResponseBody
	@RequestMapping("/nickCheck")
	public Object nickCheck(@RequestParam(value = "nickname", required = true, defaultValue = "") String nickname,
			HttpServletRequest request) {

		Boolean result = userService.nicknameCheck(nickname);
		return JSONResult.success(result ? "yes" : "no");
	}

	@ResponseBody
	@RequestMapping("/app/getuser")
	public Object appGetUser(@RequestParam(value = "userno") int userNo) {
		return JSONResult.success(userService.getUser(userNo));
	}

	// *******************************************************************************************************
	// **************************************** My Account
	// ***************************************************
	// *******************************************************************************************************
	// 1. 기본 정보 수정
	@Auth
	@Secret
	@RequestMapping("/account")
	public String secretModifyForm(@AuthUser UserVo authUser, Model model) {
		// model에 담아보내는 UserVo에 기본정보 다있으니 jsp 에서 뽑아 써야함..
		model.addAttribute("userVo", authUser);
		return "redirect:/";
	}

	@Auth
	@Secret
	@RequestMapping(value = "/account/secretmodify")
	public String basicModify(@ModelAttribute UserVo userVo, @AuthUser UserVo authUser,
			@ModelAttribute RaspberrypiVo piVo) {

		// 입력받은 2차 비밀번호 수정사항을 세션의 authUser 정보에 덮어씌운다.
		authUser.setSec_pass_word(userVo.getSec_pass_word());
		piVo.setUsers_no(authUser.getUsers_no());
		raspberrypiService.insert(piVo);
		// 가서 업데이트 하자
		userService.secretModify(authUser);

		// 블로그 메인으로 리다이렉트~
		return "blog/blog-account-main";
	}

	@ResponseBody
	@RequestMapping(value = "/app/account/secretmodify")
	public Object appSecModify(@ModelAttribute UserVo userVo, @RequestParam(value = "nickname") String nickname,
			@RequestParam(value = "sec_pass_word") int sec_pass_word) {

		userVo.setNickname(nickname);
		userVo.setSec_pass_word(sec_pass_word);

		userService.secretModify(userVo);

		return JSONResult.success("");
	}

	// ******************************** 회원 이미지 관리
	// ***********************************
	// ******************************** 회원 이미지 관리
	// ***********************************

	@Auth
	@Secret
	@RequestMapping(value = "/account/userprofilemodify")
	public String userProfileModify(@AuthUser UserVo authUser, @RequestParam(value = "nickname") String nickname,
			@RequestParam(value = "infomation") String infomation, @RequestParam(value = "pass_word") String password,
			@RequestParam(value = "userimage") MultipartFile userimage) {

		// @RequestParam(value="blogimage") MultipartFile blogimage
		userService.userProfileModify(authUser, nickname, infomation, password);

		String saveName = imageService.restore(userimage, authUser.getUsers_no());
		authUser.setUsers_image(saveName);

		userService.setImage(authUser);

		return "redirect:/";
	}

	// @Auth
	// @Secret
	// @RequestMapping(value = "/account/userprofilemodify2", method =
	// RequestMethod.POST)
	// public String userProfileModify2(@ModelAttribute BlogVo blogVo, @AuthUser
	// UserVo authUser,
	// @RequestParam(value = "nickname") String nickname, @RequestParam(value =
	// "title") String title,
	// @RequestParam(value = "infomation") String infomation,
	// @RequestParam(value = "pass_word") String password,
	// @RequestParam(value = "blogimage") MultipartFile blogimage) {
	//
	// userService.userProfileModify(authUser, blogVo, nickname, title,
	// infomation, password);
	//
	// String saveName = imageService.restore(blogimage,
	// authUser.getUsers_no());
	//
	// blogVo.setUsers_no(authUser.getUsers_no());
	// blogVo.setLogo_image(saveName);
	// blogService.setLogo(blogVo);
	//
	// return "redirect:/";
	// }

	// @Auth
	// @Secret
	// @RequestMapping(value = "/account/userprofilemodify3", method =
	// RequestMethod.POST)
	// public String userProfileModify3(@ModelAttribute BlogVo blogVo, @AuthUser
	// UserVo authUser,
	// @RequestParam(value = "nickname") String nickname, @RequestParam(value =
	// "title") String title,
	// @RequestParam(value = "infomation") String infomation,
	// @RequestParam(value = "pass_word") String password,
	// @RequestParam(value = "userimage") MultipartFile userimage,
	// @RequestParam(value = "blogimage") MultipartFile blogimage) {
	//
	// userService.userProfileModify(authUser, blogVo, nickname, title,
	// infomation, password);
	//
	// String saveName = imageService.restore(userimage,
	// authUser.getUsers_no());
	// String saveName2 = imageService.restore(blogimage,
	// authUser.getUsers_no());
	//
	// authUser.setUsers_image(saveName);
	// blogVo.setUsers_no(authUser.getUsers_no());
	// blogVo.setLogo_image(saveName2);
	//
	// userService.setImage(authUser);
	// blogService.setLogo(blogVo);
	//
	// return "redirect:/";
	// }

	@Auth
	@Secret
	@RequestMapping(value = "/account/updatedevice")
	public String userDeviceNum(@ModelAttribute RaspberrypiVo piVo, @AuthUser UserVo authUser,
			@RequestParam(value = "device_num") String device_num) {

		piVo.setUsers_no(authUser.getUsers_no());
		String deviceNum = "10.0.0." + device_num;
		piVo.setDevice_num(deviceNum);

		userService.updateDeviceNum(piVo);

		return "redirect:/";
	}

	@Auth
	@Secret
	@RequestMapping(value = "/account/userprofilemodify2")
	public String userProfileModify4(@AuthUser UserVo authUser, @RequestParam(value = "nickname") String nickname,
			@RequestParam(value = "infomation") String infomation, @RequestParam(value = "pass_word") String password) {

		userService.userProfileModify(authUser, nickname, infomation, password);
		return "redirect:/";
	}

	@Auth
	@Secret
	@RequestMapping(value = "/account/blogprofilemodify")
	public String blogProfileModify(@ModelAttribute BlogVo blogVo, @AuthUser UserVo authUser,
			@RequestParam(value = "title") String title) {
		blogVo.setTitle(title);
		userService.blogProfileModify(authUser.getUsers_no(), blogVo);

		return "redirect:/";
	}

	@Auth
	@Secret
	@RequestMapping(value = "/account/blogprofilemodify2")
	public String blogProfileModify2(@ModelAttribute BlogVo blogVo, @AuthUser UserVo authUser,
			@RequestParam(value = "title") String title, @RequestParam(value = "blogimage") MultipartFile blogimage) {
		blogVo.setTitle(title);
		userService.blogProfileModify(authUser.getUsers_no(), blogVo);

		String saveName = imageService.restore(blogimage, authUser.getUsers_no());

		blogVo.setUsers_no(authUser.getUsers_no());
		blogVo.setLogo_image(saveName);
		blogService.setLogo(blogVo);

		return "redirect:/";
	}

	@Auth
	@Secret
	@RequestMapping(value = "/account/petprofilemodify")
	public String petProfileModify(@ModelAttribute PetVo petVo, @AuthUser UserVo authUser,
			@RequestParam(value = "petname") String name, @RequestParam(value = "petinfo") String info,
			@RequestParam(value = "gender") String gender, @RequestParam(value = "age") String age,
			@RequestParam(value = "co_date") String co_date) {

		userService.petProfileModify(authUser.getUsers_no(), name, info, co_date, age, gender);
		return "redirect:/blog/" + authUser.getNickname();
	}

	@Auth
	@Secret
	@RequestMapping(value = "/account/petprofilemodify2")
	public String petProfileModify2(@ModelAttribute PetVo petVo, @AuthUser UserVo authUser,
			@RequestParam(value = "petname") String name, @RequestParam(value = "petinfo") String info,
			@RequestParam(value = "gender") String gender, @RequestParam(value = "age") String age,
			@RequestParam(value = "co_date") String co_date, @RequestParam(value = "petimage") MultipartFile petimage) {

		userService.petProfileModify(authUser.getUsers_no(), name, info, co_date, age, gender);

		String saveName = imageService.restore(petimage, authUser.getUsers_no());
		petVo.setUsers_no(authUser.getUsers_no());
		petVo.setPet_image(saveName);
		userService.setPetImage(petVo);

		return "redirect:/blog/" + authUser.getNickname();
	}

	@ResponseBody
	@RequestMapping(value = "/app/account/petprofilemodify")
	public Object appPetProfileModify(@RequestParam(value = "users_no") Integer users_no,
			@RequestParam(value = "petname") String name, @RequestParam(value = "petinfo") String info,
			@RequestParam(value = "gender") String gender, @RequestParam(value = "age") String age,
			@RequestParam(value = "co_date") String co_date) {

		userService.petProfileModify(users_no, name, info, co_date, age, gender);
		return JSONResult.success("success");
	}

	@ResponseBody
	@RequestMapping(value = "/app/account/petprofilemodify2")
	public Object appPetProfileModify2(@ModelAttribute PetVo petVo, @RequestParam(value = "users_no") Integer users_no,
			@RequestParam(value = "petimage") MultipartFile petimage) {

		String saveName = imageService.restore(petimage, users_no);
		petVo.setUsers_no(users_no);
		petVo.setPet_image(saveName);
		userService.setPetImage(petVo);

		return JSONResult.success(saveName);
	}

	@ResponseBody
	@RequestMapping(value = "/app/getpet")
	public Object appGetPet(@RequestParam(value = "users_no") Integer users_no) {

		PetVo pet = userService.getPet(users_no);
		return JSONResult.success(pet);
	}

	// ******************************secret check ****************

	@RequestMapping("/secretcontrol")
	public String secretControl(@AuthUser UserVo authUser) {
		// 2차 비밀번호가 있나없나 체크한다.
		if (userService.firstCheck(authUser)) {
			return "main/firstSecret";
		} else {
			return "main/checkSecret";
		}

	}

	@ResponseBody
	@RequestMapping("/app/secretcontrol")
	public Object appSecretControl(@RequestParam(value = "users_no") int users_no, @ModelAttribute UserVo userVo) {
		userVo.setUsers_no(users_no);
		if (userService.firstCheck(userVo)) {
			return JSONResult.success("first");
		} else {
			return JSONResult.success("exist");
		}

	}

	@RequestMapping("/secretloginfail")
	public String secretLoginFail() {
		return "main/checkSecretFail";
	}

	@ResponseBody
	@RequestMapping(value = "/app/secretlogin", method = RequestMethod.POST)
	public Object appSecretControl(@ModelAttribute UserVo userVo, @RequestParam(value = "users_no") int users_no,
			@RequestParam(value = "sec_pass_word") int sec_pass_word) {
		userVo.setUsers_no(users_no);
		userVo.setSec_pass_word(sec_pass_word);
		if (userService.secretLogin(userVo) != null) {
			return JSONResult.success("yes");
		} else {
			return JSONResult.success("no");
		}

	}

	// ******** 테스트
	@ResponseBody
	@RequestMapping("/app/imageupload")
	public Object appImageUpload(MultipartFile file, @RequestParam(value = "users_no") int users_no) {

		String saveName = fileService.restore(file, users_no);

		return JSONResult.success(saveName);
	}

	@ResponseBody
	@RequestMapping("/app/audioupload")
	public Object appAudioUpload(MultipartFile file, @RequestParam(value = "users_no") int users_no) {

		String saveName = fileService.restore2(file, users_no);

		return JSONResult.success(saveName);
	}
	// ************* App account ******

	@ResponseBody
	@RequestMapping(value = "/app/account/userprofilemodify")
	public Object appUserProfileModify(@RequestParam(value = "users_no", required = true, defaultValue = "") String no,
			@RequestParam(value = "nickname", required = true, defaultValue = "") String nickname,
			@RequestParam(value = "pass_word", required = true, defaultValue = "") String password,
			@ModelAttribute UserVo userVo) {

		if (nickname != "") {
			userVo.setNickname(nickname);
		}
		if (password != "") {
			userVo.setPass_word(password);
		}
		if (no != "") {
			userVo.setUsers_no(Integer.parseInt(no));
		}

		try {
			userService.appUserProfileModify(userVo);

		} catch (Exception e) {
			return JSONResult.error("fail");
		}

		return JSONResult.success("success");
	}

	@ResponseBody
	@RequestMapping(value = "/app/account/userprofilemodify2", method = RequestMethod.POST)
	public Object appUserProfileModify2(@RequestParam(value = "users_no") Integer users_no,
			@ModelAttribute UserVo userVo, @RequestParam(value = "userimage") MultipartFile userimage) {

		String saveName = imageService.restore(userimage, users_no);
		userVo.setUsers_no(users_no);
		userVo.setUsers_image(saveName);

		userService.setImage(userVo);

		return JSONResult.success(saveName);
	}

	@ResponseBody
	@RequestMapping(value = "/app/email", method = RequestMethod.POST)
	public Object appUserJoinEmail(@RequestParam(value = "email") String email, HttpServletRequest request) {
		int code = new Random().nextInt(100);
		ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
		userService = ac.getBean(UserService.class);
		userService.sendCode(email, code);
		return JSONResult.success(code);
	}

	@ResponseBody
	@RequestMapping(value = "/app/passmodify", method = RequestMethod.POST)
	public Object appPasswordModify(@ModelAttribute UserVo userVo, @RequestParam(value = "email") String email,
			@RequestParam(value = "pass_word") String pass_word) {
		userVo.setEmail(email);
		userVo.setPass_word(pass_word);
		userService.appPasswordModify(userVo);
		return JSONResult.success("success");
	}

}
