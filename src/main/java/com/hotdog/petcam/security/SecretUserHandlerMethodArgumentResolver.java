package com.hotdog.petcam.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import com.hotdog.petcam.vo.UserVo;

public class SecretUserHandlerMethodArgumentResolver implements HandlerMethodArgumentResolver{

	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		 SecretUser secretUser = parameter.getParameterAnnotation(SecretUser.class);
	      // @SecretUser 이 안붙어 있음
	      if( secretUser == null ) {
	         return false;
	      }
	      // 파라미터 타입이 UserVo 가 아님
	      if(parameter.getParameterType().equals(UserVo.class) == false ){
	         return false;
	      }
	      return true;
	}

	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		
		if( supportsParameter( parameter ) == false ) {
	         return WebArgumentResolver.UNRESOLVED;
	      }
	      
	      // @SecretUser 붙어있고,  파라미터 타입이 UserVo
	      HttpServletRequest request = webRequest.getNativeRequest(HttpServletRequest.class);
	      HttpSession session = request.getSession();
	      
	      if( session ==null){
	         return WebArgumentResolver.UNRESOLVED;
	         
	      }
	      return session.getAttribute("secretUser");
	      
	}

}