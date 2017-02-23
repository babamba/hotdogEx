package com.hotdog.petcam.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hotdog.petcam.service.UserService;
import com.hotdog.petcam.vo.UserVo;

public class AuthLogoutInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		 ApplicationContext ac =
		            WebApplicationContextUtils.getWebApplicationContext( request.getServletContext() );
		        
		        UserService userService = ac.getBean( UserService.class );
		
		HttpSession session = request.getSession();
		if( session != null ) {
			// 로그아웃시 DB에 있는 쿠키도 삭제해주기 위해..
			UserVo authUser = (UserVo)session.getAttribute("authUser");
			userService.deleteCookie("hotdog",authUser.getEmail());
			
			session.removeAttribute( "authUser" );
			session.removeAttribute("secretUser");
			session.invalidate();
		}
		
		response.sendRedirect( request.getContextPath() );
		return false;
	}

}
