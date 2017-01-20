package com.hotdog.petcam.vo;

import org.hibernate.validator.constraints.Length;

public class UserVo {
	private int users_no;
	private String email;
	
	@Length( min=2, max=10 )	
	private String nickname;
	
	@Length( min=4, max=12 )
	private String pass_word;
	
	@Length( min=4, max=4 )
	private int sec_pass_word;
	
	private String infomation;
	private String users_image;
	private int follower_num;
	private int following_num;
	
	public UserVo(){
		// 기본 생성자
	}
	
	public UserVo(String email, String pass_word){
		// Temp User 를 위한 생성자
		this.email=email;
		this.pass_word=pass_word;
	}
	
	public int getUsers_no() {
		return users_no;
	}
	public void setUsers_no(int users_no) {
		this.users_no = users_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPass_word() {
		return pass_word;
	}
	public void setPass_word(String pass_word) {
		this.pass_word = pass_word;
	}
	public int getSec_pass_word() {
		return sec_pass_word;
	}
	public void setSec_pass_word(int sec_pass_word) {
		this.sec_pass_word = sec_pass_word;
	}
	public String getInfomation() {
		return infomation;
	}
	public void setInfomation(String infomation) {
		this.infomation = infomation;
	}
	public String getUsers_image() {
		return users_image;
	}
	public void setUsers_image(String users_image) {
		this.users_image = users_image;
	}
	public int getFollower_num() {
		return follower_num;
	}
	public void setFollower_num(int follower_num) {
		this.follower_num = follower_num;
	}
	public int getFollowing_num() {
		return following_num;
	}
	public void setFollowing_num(int following_num) {
		this.following_num = following_num;
	}
	
	@Override
	public String toString() {
		return "UserVo [users_no=" + users_no + ", email=" + email + ", nickname=" + nickname + ", pass_word="
				+ pass_word + ", sec_pass_word=" + sec_pass_word + ", infomation=" + infomation + ", users_image="
				+ users_image + ", follower_num=" + follower_num + ", following_num=" + following_num + "]";
	}
	
	
	

}