package com.hotdog.petcam.security;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hotdog.petcam.service.UserService;
import com.hotdog.petcam.vo.UserVo;

public class AuthSignUpInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// modal 창에서 입력한 가입양식을 세션에 TempUser 로 저장해둠
		
		System.out.println("야호");
		UserVo userVo = new UserVo();
		int code=new Random().nextInt(100);
		
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String nickname = request.getParameter("nickname");
		
		
		userVo.setEmail(request.getParameter("email"));
		userVo.setPass_word(request.getParameter("password"));
		userVo.setNickname(request.getParameter("nickname"));
		
		System.out.println(userVo);
		
		
		// TempUser 에게 이메일을 보낸다.
		ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
		UserService userService = ac.getBean(UserService.class);
		userService.sendCode(userVo.getEmail(),code);
		
		
		// 세션에 TempUser 입력 정보와 발송한 Code를 저장한다.
		HttpSession session=request.getSession(true);
		session.setAttribute("TempUser",userVo);
		session.setAttribute("code", code);
		
		response.sendRedirect(request.getContextPath());
		
		return false;
	}
	
	

}
