package com.hotdog.petcam.vo;

public class CookieVo {
	private String email;
	private String hashcode;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHashcode() {
		return hashcode;
	}
	public void setHashcode(String hashcode) {
		this.hashcode = hashcode;
	}
	@Override
	public String toString() {
		return "CookieVo [email=" + email + ", hashcode=" + hashcode + "]";
	}
	
	
}
