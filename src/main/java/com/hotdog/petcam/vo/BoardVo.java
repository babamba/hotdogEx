package com.hotdog.petcam.vo;

public class BoardVo {

	 private int board_no;
	 private int category;
	 private String title;
	 private String content;
	 private String regdate;
	 private int hits;
	 private int publish;
	 private int users_no;
	 private String nickname;
	 private int count;
	 
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public int getPublish() {
		return publish;
	}
	public void setPublish(int publish) {
		this.publish = publish;
	}
	public int getUsers_no() {
		return users_no;
	}
	public void setUsers_no(int users_no) {
		this.users_no = users_no;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "BoardVo [board_no=" + board_no + ", category=" + category + ", title=" + title + ", content=" + content
				+ ", regdate=" + regdate + ", hits=" + hits + ", publish=" + publish + ", users_no=" + users_no
				+ ", nickname=" + nickname + ", count=" + count + "]";
	}
	
	 
	 
}
