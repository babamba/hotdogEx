package com.hotdog.petcam.controller;

import java.net.URLEncoder;

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

import com.hotdog.petcam.DTO.JSONResult;
import com.hotdog.petcam.security.Auth;
import com.hotdog.petcam.security.AuthUser;
import com.hotdog.petcam.security.Secret;
import com.hotdog.petcam.service.UserService;
import com.hotdog.petcam.vo.PetVo;
import com.hotdog.petcam.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {

	
	@Autowired
	private UserService userService;
	
	// 유저 테스트용 페이지
		@RequestMapping("/test")
		public String test(){
			return "user/joinform2";
		}
		
		// ************************************* 회원 가입 및 로그인/아웃 **************
		@RequestMapping("/login")
		public String login(){

			return "redirect:/";
		}
		
		@RequestMapping(value = "/join")
		public String join(@RequestParam( value="nickname", required=true, defaultValue="" ) String nickname,
						   @ModelAttribute UserVo userVo,HttpServletRequest request){
		
			int users_no = userService.join(userVo);
			userVo.setUsers_no(users_no);
			
			userService.insert(userVo);
			return "redirect:/";
		}
		
		@Auth
		@RequestMapping("/logout")
		public String logout() {
			return "main/index";
		}
		
		// 코드 체크 
		@ResponseBody
		@RequestMapping("/checkcode")
		public Object test2(@RequestParam( value="code", required=true, defaultValue="" ) int inputCode,
								HttpServletRequest request){
			int code=(int)request.getSession().getAttribute("code");
			return JSONResult.success(userService.checkCode(inputCode,code)? "yes":"no");
		}
		
		
		//닉네임체크
		@ResponseBody
		@RequestMapping("/nickCheck")
		public Object nickCheck(@RequestParam( value="nickname", required=true, defaultValue="" ) String nickname,
								HttpServletRequest request){
			
			Boolean result = userService.nicknameCheck(nickname);
			return JSONResult.success(result? "yes":"no");
		}
		
		
		// *******************************************************************************************************
		// **************************************** My Account ***************************************************
		// *******************************************************************************************************
		// 1. 기본 정보 수정
		@Auth
		@Secret
		@RequestMapping(value="/account/basicmodifyform", method=RequestMethod.POST)
		public String basicModifyForm(@AuthUser UserVo authUser,Model model){
			// model에 담아보내는  UserVo에 기본정보 다있으니 jsp 에서 뽑아 써야함..
			model.addAttribute("userVo", authUser);
			return "개인정보 수정 메인 페이지";
		}
		
		@Auth
		@Secret
		@RequestMapping(value="/account/basicmodify", method= RequestMethod.POST)
		public String basicModify(@ModelAttribute UserVo userVo){
			userService.basicModify(userVo);
			return "redirect:/";
		}
		
		@Auth
		@Secret
		@RequestMapping(value="/account/profilemodifyform", method= RequestMethod.POST)
		public String profileModifyForm(@AuthUser UserVo authUser,Model model,@RequestParam(value="category",required=true,defaultValue="user")String category){
			if(category == "pet"){
				return "펫 프로필 페이지";
			}
			return "유저 프로필 페이지";
		}
		@Auth
		@Secret
		@RequestMapping(value="/account/userprofilemodify", method=RequestMethod.POST)
		public String userProfileModify(@ModelAttribute UserVo userVo){
			userService.userProfileModify(userVo);
			return "redirect:/";
		}
		
		@Auth
		@Secret
		@RequestMapping(value="/account/petprofilemodify", method=RequestMethod.POST)
		public String petProfileModify(@ModelAttribute PetVo petVo){
			userService.petProfileModify(petVo);
			return "redirect:/";
		}
	
	
	
	
}
