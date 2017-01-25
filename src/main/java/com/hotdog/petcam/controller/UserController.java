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
import com.hotdog.petcam.vo.BlogVo;
import com.hotdog.petcam.vo.PetVo;
import com.hotdog.petcam.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {

	
	@Autowired
	private UserService userService;
		
		// ************************************* 회원 가입 및 로그인/아웃 **************
		@RequestMapping("/login")
		public String login(@ModelAttribute UserVo vo, Model model, HttpServletRequest request, HttpSession session){
			return "redirect:/";
		}
		
		@RequestMapping(value = "/join")
		public String join(@RequestParam( value="nickname", required=true, defaultValue="" ) String nickname,
						   @ModelAttribute UserVo userVo, HttpServletRequest request){
		
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
		// **************************************** App 통신 ***************************************************
		// *******************************************************************************************************
		
		@ResponseBody
		@RequestMapping("/app/emailcheck")
		public Object appEmailCheck(@RequestParam (value="email")String email){
			return JSONResult.success(userService.appEmailCheck(email) ? "exist":"not exist");
		}
		
		@ResponseBody
		@RequestMapping("/app/login")
		public Object appLogin(@RequestParam(value="email")String email,@RequestParam(value="pass_word")String pass_word,@ModelAttribute UserVo userVo){
			
			UserVo result = userService.appLogin(email,pass_word,userVo);
			
				return JSONResult.success(result);
		}
		
		@ResponseBody
		@RequestMapping(value = "/app/join")
		public Object appjoin(@ModelAttribute UserVo userVo, HttpServletRequest request){
		
			int users_no = userService.join(userVo);
			System.out.println(users_no);
			userVo.setUsers_no(users_no);
			userService.insert(userVo);
			
			return JSONResult.success(userVo);
		}
		
		
		// *******************************************************************************************************
		// **************************************** My Account ***************************************************
		// *******************************************************************************************************
		// 1. 기본 정보 수정
		// 1. 기본 정보 수정
				@Auth
				@Secret
				@RequestMapping("/account")
				public String secretModifyForm(@AuthUser UserVo authUser,Model model){
					// model에 담아보내는  UserVo에 기본정보 다있으니 jsp 에서 뽑아 써야함..
					model.addAttribute("userVo", authUser);
					return "개인정보 수정 메인 페이지";
				}
				
				@Auth
				@Secret
				@RequestMapping(value="/account/secretmodify", method= RequestMethod.POST)
				public String basicModify(@ModelAttribute UserVo userVo,@AuthUser UserVo authUser){
					
					// 입력받은 2차 비밀번호 수정사항을 세션의 authUser 정보에 덮어씌운다.
					authUser.setSec_pass_word(userVo.getSec_pass_word());
					
					// 가서 업데이트 하자 
					userService.secretModify(authUser);
					
					// 블로그 메인으로 리다이렉트~
					return "redirect:/blog/"+ authUser.getNickname();
				}
			
				@Auth
				@Secret
				@RequestMapping(value="/account/userprofilemodify", method=RequestMethod.POST)
				public String userProfileModify(@ModelAttribute BlogVo blogVo,@AuthUser UserVo authUser,
												@RequestParam(value="nickname") String nickname, @RequestParam(value="title")String title,
												@RequestParam(value="infomation") String infomation){
					userService.userProfileModify(authUser,blogVo,nickname,title,infomation);
					return "redirect:/user/account";
				}
				@Auth
				@Secret
				@RequestMapping(value="/account/petprofilemodify", method=RequestMethod.POST)
				public String petProfileModify(@ModelAttribute PetVo petVo,@AuthUser UserVo authUser){
					userService.petProfileModify(petVo);
					return "redirect:/blog/"+ authUser.getNickname();
				}
	
		
	
	
}
