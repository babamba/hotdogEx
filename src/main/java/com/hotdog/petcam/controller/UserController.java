package com.hotdog.petcam.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hotdog.petcam.DTO.JSONResult;
import com.hotdog.petcam.security.Auth;
import com.hotdog.petcam.security.AuthUser;
import com.hotdog.petcam.security.Secret;
import com.hotdog.petcam.service.BlogService;
import com.hotdog.petcam.service.FileUploadService;
import com.hotdog.petcam.service.ImageService;
import com.hotdog.petcam.service.UserService;
import com.hotdog.petcam.vo.BlogVo;
import com.hotdog.petcam.vo.PetVo;
import com.hotdog.petcam.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired	private UserService userService;
	@Autowired  private BlogService blogService;
	@Autowired	private ImageService imageService;
	@Autowired 	private FileUploadService fileService;

	@RequestMapping("/login")
	public String login(@ModelAttribute UserVo vo, Model model, HttpServletRequest request, HttpSession session) {
		return "redirect:/";
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
		System.out.println(users_no);
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
	public Object appGetUser(@RequestParam(value="userno") int userNo){
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
	@RequestMapping(value = "/account/secretmodify", method = RequestMethod.POST)
	public String basicModify(@ModelAttribute UserVo userVo, @AuthUser UserVo authUser) {

		// 입력받은 2차 비밀번호 수정사항을 세션의 authUser 정보에 덮어씌운다.
		authUser.setSec_pass_word(userVo.getSec_pass_word());

		// 가서 업데이트 하자
		userService.secretModify(authUser);

		// 블로그 메인으로 리다이렉트~
		return "main/index";
	}

	// ******************************** 회원 이미지 관리 ***********************************
	// ******************************** 회원 이미지 관리 ***********************************
	
	@Auth
	@Secret
	@RequestMapping(value = "/account/userprofilemodify", method = RequestMethod.POST)
	public String userProfileModify(@ModelAttribute BlogVo blogVo, @AuthUser UserVo authUser,
			@RequestParam(value = "nickname") String nickname, @RequestParam(value = "title") String title,
			@RequestParam(value = "infomation") String infomation,@RequestParam(value="pass_word")String password,
			@RequestParam(value = "userimage") MultipartFile userimage) {
		// @RequestParam(value="blogimage") MultipartFile blogimage
		
		userService.userProfileModify(authUser, blogVo, nickname, title, infomation,password);

		String saveName = imageService.restore(userimage, authUser.getUsers_no());
		authUser.setUsers_image(saveName);
		
		userService.setImage( authUser );

		return "redirect:/";
	}
	
	@Auth
	@Secret
	@RequestMapping(value = "/account/userprofilemodify2", method = RequestMethod.POST)
	public String userProfileModify2(@ModelAttribute BlogVo blogVo, @AuthUser UserVo authUser,
			@RequestParam(value = "nickname") String nickname, @RequestParam(value = "title") String title,
			@RequestParam(value = "infomation") String infomation,@RequestParam(value="pass_word")String password,
			@RequestParam(value = "blogimage") MultipartFile blogimage) {
		
		userService.userProfileModify(authUser, blogVo, nickname, title, infomation,password);

		String saveName = imageService.restore(blogimage, authUser.getUsers_no());
		
		blogVo.setUsers_no(authUser.getUsers_no());
		blogVo.setLogo_image(saveName);
		blogService.setLogo( blogVo);
		
		return "redirect:/";
	}

	@Auth
	@Secret
	@RequestMapping(value = "/account/userprofilemodify3", method = RequestMethod.POST)
	public String userProfileModify3(@ModelAttribute BlogVo blogVo, @AuthUser UserVo authUser,
			@RequestParam(value = "nickname") String nickname, @RequestParam(value = "title") String title,
			@RequestParam(value = "infomation") String infomation,
			@RequestParam(value="pass_word")String password,
			@RequestParam(value = "userimage") MultipartFile userimage,
			@RequestParam(value = "blogimage") MultipartFile blogimage) {
		
		userService.userProfileModify(authUser, blogVo, nickname, title, infomation,password);

		String saveName = imageService.restore(userimage,authUser.getUsers_no());
		String saveName2 = imageService.restore(blogimage, authUser.getUsers_no());
		
		authUser.setUsers_image(saveName);
		blogVo.setUsers_no(authUser.getUsers_no());
		blogVo.setLogo_image(saveName2);
		
		userService.setImage( authUser );
		blogService.setLogo( blogVo);

		return "redirect:/";
	}
	
	@Auth
	@Secret
	@RequestMapping(value = "/account/userprofilemodify4", method = RequestMethod.POST)
	public String userProfileModify4(@ModelAttribute BlogVo blogVo, @AuthUser UserVo authUser,
			@RequestParam(value = "nickname") String nickname, @RequestParam(value = "title") String title,
			@RequestParam(value = "infomation") String infomation,@RequestParam(value="pass_word")String password){
		
		userService.userProfileModify(authUser, blogVo, nickname, title, infomation,password);
		return "redirect:/";
	}
	
	

	@Auth
	@Secret
	@RequestMapping(value = "/account/petprofilemodify", method = RequestMethod.POST)
	public String petProfileModify(@ModelAttribute PetVo petVo, @AuthUser UserVo authUser,
			@RequestParam(value="petname") String name,@RequestParam(value="petinfo") String info,
			@RequestParam(value="gender")String gender,@RequestParam(value="age")String age,
			@RequestParam(value="co_date") String co_date ){
		
		System.out.println("사진없이 컨트롤러 들어옴");
		userService.petProfileModify(petVo,authUser.getUsers_no(),name,info,co_date,age,gender);
		return "redirect:/blog/" + authUser.getNickname();
	}
	
	@Auth
	@Secret
	@RequestMapping(value = "/account/petprofilemodify2", method = RequestMethod.POST)
	public String petProfileModify2(@ModelAttribute PetVo petVo, @AuthUser UserVo authUser,
			@RequestParam(value="petname") String name,@RequestParam(value="petinfo") String info,
			@RequestParam(value="gender") String gender,@RequestParam(value="age") String age,
			@RequestParam(value="co_date") String co_date,@RequestParam(value="petimage")MultipartFile petimage ){
		
		System.out.println("사진 가지고 컨트롤러 들어옴");
		userService.petProfileModify(petVo,authUser.getUsers_no(),name,info,co_date,age,gender);
		
		String saveName = imageService.restore(petimage, authUser.getUsers_no());
		petVo.setUsers_no(authUser.getUsers_no());
		petVo.setPet_image(saveName);
		userService.setPetImage(petVo);
		
		return "redirect:/blog/" + authUser.getNickname();
	}

	
	// ******************************secret check ****************
	
	@RequestMapping("/secretcontrol")
	public String secretControl(@AuthUser UserVo authUser){
		// 2차 비밀번호가 있나없나 체크한다.
		if( userService.firstCheck(authUser) ){
			System.out.println("최초 접속");
			return "main/firstSecret";
		}else{
			System.out.println("설정되어 있음");
			return "main/checkSecret";
		}
		
	}
	
	// ******** 테스트
	@ResponseBody
	@RequestMapping("/app/audioupload")
	public Object appAudioUpload(MultipartFile file){
		String saveName= fileService.restore(file);
		
		return JSONResult.success(saveName);
	}
	
	// *************  App account ******
	
		@ResponseBody
		@RequestMapping(value="/app/account/userprofilemodify")
		public Object appUserProfileModify(@RequestParam(value="users_no",required=true,defaultValue="")String no,@RequestParam(value="nickname",required=true,defaultValue="")String nickname,
											@RequestParam(value="pass_word",required=true,defaultValue="")String password,@ModelAttribute UserVo userVo){
			
			if(nickname != ""){
				userVo.setNickname(nickname);
			}
			if(password != ""){
				userVo.setPass_word(password);
			}
			if(no != ""){
				userVo.setUsers_no( Integer.parseInt(no) );
			}
			
			
			try{
				userService.appUserProfileModify(userVo);
				
			} 
			catch(Exception e){
				System.out.println("앱 개인정보 수정 실패 catch");
				return JSONResult.error("fail");
			}
			
			System.out.println("앱 개인정보 수정 완료");
			return JSONResult.success("success");
		}
		
	
	
	
}
