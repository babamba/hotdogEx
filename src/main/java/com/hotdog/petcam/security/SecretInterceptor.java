package com.hotdog.petcam.security;

import java.lang.annotation.Annotation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hotdog.petcam.vo.UserVo;

public class SecretInterceptor extends HandlerInterceptorAdapter{

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        
        
        if(handler instanceof HandlerMethod == false){
            return true;
        }
        
        boolean isTypeAnnotationSecret = false;
        
        for( Annotation annotation : ((HandlerMethod)handler).getBeanType().getDeclaredAnnotations()){
            if ( annotation.toString().contains(Secret.class.getName())){
                isTypeAnnotationSecret = true;
            }
        }
        
        if ( isTypeAnnotationSecret == false){
            Secret secret = ((HandlerMethod)handler).getMethodAnnotation(Secret.class);
            
            if(secret == null ){
                return true;
            }
        }
        HttpSession session = request.getSession();
        System.out.println(request.getRequestURI()+"-----> 인터셉터에서 확인");
        
        if(session == null){
            response.sendRedirect(request.getContextPath()+"/ 로그인 경로 처리");
        }
        // 콜백 값을 세션에 저장
        session.setAttribute("secretcallback", request.getRequestURI());
        
        // 시크릿 유저 꺼내본다.
        UserVo SecretUser = (UserVo)session.getAttribute("secretUser");
        
        if(SecretUser == null){
            response.sendRedirect(request.getContextPath()+"/user/secretcontrol");
        }
        
        return true;
    }
}