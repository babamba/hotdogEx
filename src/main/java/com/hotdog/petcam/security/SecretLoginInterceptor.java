package com.hotdog.petcam.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hotdog.petcam.service.UserService;
import com.hotdog.petcam.vo.UserVo;

public class SecretLoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// 파라미터로 오는 값을 paseInt 처리한다.
		int sec_pass_word = Integer.parseInt((request.getParameter( "sec_pass_word" )));
		
		
		// Web Application Context 받아오기
		ApplicationContext ac =
			WebApplicationContextUtils.getWebApplicationContext( request.getServletContext() );
		
		HttpSession session = request.getSession(true);
		
		UserVo authUser=(UserVo)session.getAttribute("authUser");
		
		authUser.setSec_pass_word(sec_pass_word);
		
		// Secret User 권한을 설정하기 위해 UserVo 빈가져오기
		UserService userService = ac.getBean(UserService.class);
		UserVo userVo = new UserVo();
		
		userVo = userService.secretLogin(authUser);
		// 비교
		
		
		// 인증 처리
		
		session.setAttribute( "secretUser", userVo );
		response.sendRedirect( request.getContextPath() );
		return false;
	}
	
}
