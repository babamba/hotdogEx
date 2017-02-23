package com.hotdog.petcam.security;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hotdog.petcam.cookie.CookieBox;
import com.hotdog.petcam.service.UserService;
import com.hotdog.petcam.vo.UserVo;

public class CookieLogin extends HandlerInterceptorAdapter{

	//   (1)  /hotdog/*  전체를 매핑하여 쿠키가 있는 사람을 로그인 시킨다.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
		HttpSession session = request.getSession(true);
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
//		// (2) 이미 로그인 된 사람 제외
		if ( authUser != null){
			return true;
		}
		// (3) 로그인 안된 사람들중 쿠키 검사
		Cookie[] cookies = request.getCookies(); // 요청에서부터 쿠키를 가져와 쿠키 배열을 선언한다.
		
		// (4) 쿠키 배열에서 hotdog 쿠키를 찾는다.
		Cookie hotdogCookie = null;
		
		if( cookies != null){
		
			for(int i=0;i<cookies.length;i++){
				
				if( cookies[i].getName().equals("hotdog")){ // cookie 이름이 hotdog 일때 hotdogCookie에 저장한다.
					
					hotdogCookie = cookies[i];
					
					System.out.println("핫도그 쿠키 찾았다.");
					
					break;
				}
			}
		}
		// hotdogCookie 쿠키 존재 유무를 판단하여, 없으면 인터셉터를 중지시킨다.
		if ( hotdogCookie == null){
			System.out.println("hotdog 쿠키 없다.");
			return true;
		}
		
		// 여기까지 왔으면...현재 로그인 안되어 있고,쿠키를 가지고 있는 상태이므로 로그인 시킨다.
		ApplicationContext ac =
	            WebApplicationContextUtils.getWebApplicationContext( request.getServletContext() );
		// 이메일을 꺼내온다.
		String cookieName = hotdogCookie.getName();
		String cookieValue = hotdogCookie.getValue();
		
		UserService userService = ac.getBean(UserService.class);
		
		//  받아온 쿠키 값이 DB에 저장되어 있으면..이메일 값으로 바로 로그인 시킨다.
		if( userService.searchCookie( cookieName , cookieValue ) == true ){
			
			System.out.println("쿠키값 확인 ~로그인 시킨다~");
			UserVo userVo = userService.cookieLogin(cookieName);
			
			session.setAttribute( "authUser", userVo );
			response.sendRedirect(request.getContextPath());
			
			return true;
		}
		
		return true;
	}
	
	
	
}
