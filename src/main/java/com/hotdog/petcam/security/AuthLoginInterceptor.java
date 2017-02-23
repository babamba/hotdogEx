package com.hotdog.petcam.security;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hotdog.petcam.cookie.CookieBox;
import com.hotdog.petcam.service.RaspberrypiService;
import com.hotdog.petcam.service.UserService;
import com.hotdog.petcam.vo.RaspberrypiVo;
import com.hotdog.petcam.vo.UserVo;


public class AuthLoginInterceptor extends HandlerInterceptorAdapter {
    
    @Override
    public boolean preHandle(
        HttpServletRequest request,
        HttpServletResponse response,
        Object handler/*HandlerMethod*/)
        throws Exception {
        
        String email = request.getParameter( "email" );
        String password = request.getParameter( "pass_word" );
        String nickname = request.getParameter("nickname");
        String remember = (String)request.getParameter("remember");
        
        // Web Application Context 받아오기
        ApplicationContext ac =
            WebApplicationContextUtils.getWebApplicationContext( request.getServletContext() );
        
        // Container 안에 있는 UserService Bean(객체) 받아오기
        UserService userService = ac.getBean( UserService.class );
        RaspberrypiService raspberrypiService = ac.getBean( RaspberrypiService.class );
        
        // 데이터베이스에서 해당 UserVo 받아오기
        UserVo userVo = userService.login(email, password, nickname);
        
        // 이메일과 패쓰워드가 일치하지 않는 경우
        if( userVo == null ) {
            response.sendRedirect(
                request.getContextPath() + "/user/loginfail" );
            
            return false;
        }
        // Remember Me Cookie 발급
        if ( remember != null ){
        	Cookie cookie = new Cookie("hotdog",userVo.getEmail());
        	cookie.setMaxAge(60*60*24*365);
        	userService.setCookie("hotdog",userVo.getEmail());
        	
        	System.out.println(cookie.getName());
        	System.out.println(cookie.getValue());
        	System.out.println(cookie.getMaxAge());
        	
        	response.addCookie(cookie);
        	
//        		cookieBox.createCookie("email", userVo.getEmail());
        }
        
        // Pi 정보 받아오기  
		RaspberrypiVo piVo = new RaspberrypiVo();
		piVo.setUsers_no(userVo.getUsers_no());
		
		piVo = raspberrypiService.selectByNo(piVo);
        
        // 인증 처리
        HttpSession session = request.getSession( true );
        session.setAttribute( "authUser", userVo );
        session.setAttribute( "piVo", piVo );

        String callBack = (String)session.getAttribute("authcallback");
        
        response.sendRedirect(request.getContextPath());     // request.getContextPath 에 추가하면 도메인이 일부 중복된다.
        return false;
    }

}