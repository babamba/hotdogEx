package com.hotdog.petcam.vo;

public class BlogVo {

	private int users_no;
	private String title;
	private String logo_image;
	

	public int getUsers_no() {
		return users_no;
	}
	public void setUsers_no(int users_no) {
		this.users_no = users_no;
	}
	public String getLogo_image() {
		return logo_image;
	}
	public void setLogo_image(String logo_image) {
		this.logo_image = logo_image;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	
	@Override
	public String toString() {
		return "BlogVo [users_no=" + users_no + ", title=" + title + ", logo_image=" + logo_image + "]";
	}
	

	
	
	
}
