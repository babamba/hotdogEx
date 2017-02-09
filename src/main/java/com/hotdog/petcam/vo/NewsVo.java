package com.hotdog.petcam.vo;

public class NewsVo {
	private Long rn;
	private int users_no;
	private String title;
	private String regdate;
	private String users_image;
	private String nickname;
	
	
	public Long getRn() {
		return rn;
	}
	public void setRn(Long rn) {
		this.rn = rn;
	}
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getUsers_image() {
		return users_image;
	}
	public void setUsers_image(String users_image) {
		this.users_image = users_image;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@Override
	public String toString() {
		return "NewsVo [rn=" + rn + ", users_no=" + users_no + ", title=" + title + ", regdate=" + regdate
				+ ", users_image=" + users_image + ", nickname=" + nickname + "]";
	}
	
	
}
