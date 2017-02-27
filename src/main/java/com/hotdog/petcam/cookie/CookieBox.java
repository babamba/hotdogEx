package com.hotdog.petcam.cookie;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

@Component
public class CookieBox {

	private Map cookieMap = new HashMap();
	Cookie[]  cookies;
	public CookieBox(){
		
	}
	// 요청에서 쿠키를 받아오는 생성자
	public CookieBox(HttpServletRequest request){ 
		cookies = request.getCookies();
	
	}
	
	public Cookie createCookie(String name, String value) throws IOException {
		Cookie cookie =new Cookie(name, URLEncoder.encode(value, "utf-8"));
		// hotdog 라는 이름의 쿠키를 생성할 예정, Value 에  email이 들어올 예정
		cookie.setMaxAge(60*60*24*30); // 쿠키 유효기간 ( 초 단위 )
		cookie.setPath("/"); // 삭제를 위해 있어야함
		
        return cookie;
        
    }
	public static Cookie createCookie(String name, String value, String path, int maxAge) throws IOException {
       Cookie cookie = new Cookie(name,URLEncoder.encode(value, "utf-8"));
       cookie.setPath(path);
       cookie.setMaxAge(maxAge);
       return cookie;
   }
	 public static Cookie createCookie(String name, String value,String domain, String path, int maxAge) throws IOException {
	     Cookie cookie = new Cookie(name,URLEncoder.encode(value, "utf-8"));
	     cookie.setDomain(domain);
	     cookie.setPath(path);
	     cookie.setMaxAge(maxAge);
	     return cookie;
	 }
	 
	 public Cookie getCookie(String name) {
		 
			// 쿠키들을 꺼낸다.
			for(int i=0;i<cookies.length;i++){
				
				// -1
				
				// null
			}
			
		return null;
     }
     
     public String getValue(String name) throws IOException {
         Cookie cookie = (Cookie)cookieMap.get(name);
         if (cookie == null) return null;
         return URLDecoder.decode(cookie.getValue(), "utf-8");
     }
     
     public boolean exists(String name) {
         return cookieMap.get(name) != null;
     }
     
     
}
