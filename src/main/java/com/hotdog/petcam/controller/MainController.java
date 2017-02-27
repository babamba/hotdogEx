package com.hotdog.petcam.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotdog.petcam.DTO.JSONResult;
import com.hotdog.petcam.security.AuthUser;
import com.hotdog.petcam.service.PetService;
import com.hotdog.petcam.service.RaspberrypiService;
import com.hotdog.petcam.service.UserService;
import com.hotdog.petcam.vo.PetVo;
import com.hotdog.petcam.vo.RaspberrypiVo;
import com.hotdog.petcam.vo.UserVo;

@Controller
@RequestMapping("")
public class MainController {

	@Autowired
	private PetService petService;
	@Autowired
	private UserService userService;
	@Autowired
	private RaspberrypiService raspberrypiService;

	@RequestMapping("/")
	public String index(@RequestHeader(value = "email", defaultValue = "") String email,
			@RequestHeader(value = "pass_word", defaultValue = "") String password,
			@RequestHeader(value = "nickname", defaultValue = "") String nick, @AuthUser UserVo nickname, Model model,
			PetVo petVo, HttpSession session) {
		List<PetVo> list = petService.getHotdog(petVo);
		model.addAttribute("list", list);
		
		
		// 앱 웹뷰에 로그인 구현
		if (!"".equals(email) && !"".equals(password) && !"".equals(nick)) {
			UserVo userVo = userService.login(email, password, nick);
			RaspberrypiVo piVo = new RaspberrypiVo();
			piVo.setUsers_no(userVo.getUsers_no());
			piVo = raspberrypiService.selectByNo(piVo);
			session.setAttribute("authUser", userVo);
			session.setAttribute("piVo", piVo);
		}
		return "main/page_main";
	}

	@RequestMapping("/loginpage")
	public String login() {
		return "main/loginPage";
	}

}
