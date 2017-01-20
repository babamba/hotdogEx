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
import com.hotdog.petcam.service.UserService;
import com.hotdog.petcam.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {

	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	public String login(@ModelAttribute UserVo vo, Model model, HttpServletRequest request, HttpSession session){
		System.out.println("login");
		System.out.println("controller" + request);
		System.out.println("controller" + session);

		return "redirect:/";
	}
	

	
	@RequestMapping(value = "/easyjoin")
	public String easyjoin(@ModelAttribute UserVo vo, Model model) {
		int users_no = userService.join(vo);
		vo.setUsers_no(users_no);
		userService.insert(vo);
		return "redirect:/";
	}
	
	
	@RequestMapping(value = "/join")
	public String join(@RequestParam( value="nickname", required=true, defaultValue="" ) String nickname,@ModelAttribute UserVo userVo,
			HttpServletRequest request){
	
		int users_no = userService.join(userVo);
		System.out.println("service.join"+users_no);
		userVo.setUsers_no(users_no);
		
		System.out.println(userVo);
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
		System.out.println("input Code: " + inputCode);
		System.out.println("code: "+ code);
		return JSONResult.success(userService.checkCode(inputCode,code)? "yes":"no");
	}
	
	
	//닉네임체크
	@ResponseBody
	@RequestMapping("/nickCheck")
	public Object nickCheck(@RequestParam( value="nickname", required=true, defaultValue="" ) String nickname,
							HttpServletRequest request){
		
		System.out.println("닉네임체크 "+ nickname);
		Boolean result = userService.nicknameCheck(nickname);
		System.out.println(result);
		return JSONResult.success(result? "yes":"no");
	}
	
	
	
	
	
}
