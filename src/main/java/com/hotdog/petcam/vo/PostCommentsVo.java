package com.hotdog.petcam.vo;

public class PostCommentsVo {

	private int comments_no;
	private String content;
	private String regdate;
	private int post_no;
	private int users_no;
	private String users_image;
	
	public int getComments_no() {
		return comments_no;
	}
	public void setComments_no(int comments_no) {
		this.comments_no = comments_no;
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
	public int getPost_no() {
		return post_no;
	}
	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	public int getUsers_no() {
		return users_no;
	}
	public void setUsers_no(int users_no) {
		this.users_no = users_no;
	}
	
	@Override
	public String toString() {
		return "Post_CommentsVo [comments_no=" + comments_no + ", content=" + content + ", regdate=" + regdate
				+ ", post_no=" + post_no + ", users_no=" + users_no + "]";
	}
	
	
	
}
