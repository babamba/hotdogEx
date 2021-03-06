package com.hotdog.petcam.vo;

public class PostVo {

	private int post_no;
	private String title;
	private String content;
	private String regdate;
	private String post_image;
	private int publish;
	private int users_no;
	private int hits;
	private int shared;
	private String nickname;
	private int count;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPost_no() {
		return post_no;
	}
	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getPost_image() {
		return post_image;
	}
	public void setPost_image(String post_image) {
		this.post_image = post_image;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public int getPublish() {
		return publish;
	}
	public void setPublish(int publish) {
		this.publish = publish;
	}
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	
	
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public int getShared() {
		return shared;
	}
	public void setShared(int shared) {
		this.shared = shared;
	}
	@Override
	public String toString() {
		return "PostVo [post_no=" + post_no + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+ ", post_image=" + post_image + ", publish=" + publish + ", users_no=" + users_no + ", hits=" + hits
				+ ", shared=" + shared + ", nickname=" + nickname + ", count=" + count + "]";
	}
	
	
	
	
}
