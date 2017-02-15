package com.hotdog.petcam.vo;

public class SearchBlogVo {
	private int users_no;
	private String  title;
	private String logo_image;
	private String nickname;
	
	
	public int getUsers_no() {
		return users_no;
	}
	public void setUsers_no(int users_no) {
		this.users_no = users_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLogo_image() {
		return logo_image;
	}
	public void setLogo_image(String logo_image) {
		this.logo_image = logo_image;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@Override
	public String toString() {
		return "SearchBlogVo [users_no=" + users_no + ", title=" + title + ", logo_image=" + logo_image + ", nickname="
				+ nickname + "]";
	}
	
	
	
}
