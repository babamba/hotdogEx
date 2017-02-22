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
	
	public CookieBox(){
		
	}
	// 요청에서 쿠키를 받아오는 생성자
	public CookieBox(HttpServletRequest request){ 
		Cookie[] cookies = request.getCookies();
	}
	
	public Cookie createCookie(String name, String value) throws IOException {
        return new Cookie(name, URLEncoder.encode(value, "utf-8"));
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
         return (Cookie)cookieMap.get(name); 
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
