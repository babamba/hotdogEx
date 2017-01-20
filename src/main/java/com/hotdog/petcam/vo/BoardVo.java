package com.hotdog.petcam.vo;

public class BoardVo {

	 private int boardNo;
	 private int category;
	 private String title;
	 private String content;
	 private String regDate;
	 private int hits;
	 private int publish;
	 private int usersNo;
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
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
	public int getUsersNo() {
		return usersNo;
	}
	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}
	
	@Override
	public String toString() {
		return "BoardVo [boardNo=" + boardNo + ", category=" + category + ", title=" + title + ", content=" + content
				+ ", regDate=" + regDate + ", hits=" + hits + ", publish=" + publish + ", usersNo=" + usersNo + "]";
	}
	 
	 
}
