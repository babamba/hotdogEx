package com.hotdog.petcam.vo;

public class BoardCommentsVo {

	private int commentsNo;
	private String content;
	private String regDate;
	private int boardNo;
	private int usersNo;
	
	public int getCommentsNo() {
		return commentsNo;
	}
	public void setCommentsNo(int commentsNo) {
		this.commentsNo = commentsNo;
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
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getUsersNo() {
		return usersNo;
	}
	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}
	@Override
	public String toString() {
		return "BoardCommentsVo [commentsNo=" + commentsNo + ", content=" + content + ", regDate=" + regDate
				+ ", boardNo=" + boardNo + ", usersNo=" + usersNo + "]";
	}
	
	
	
}
