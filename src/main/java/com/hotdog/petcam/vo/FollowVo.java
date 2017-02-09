package com.hotdog.petcam.vo;

public class FollowVo {

	private int users_no;
	private int follow_users_no;
	
	public int getUsers_no() {
		return users_no;
	}
	
	public void setUsers_no(int users_no) {
		this.users_no = users_no;
	}
	
	public int getFollow_users_no() {
		return follow_users_no;
	}
	
	public void setFollow_users_no(int follow_users_no) {
		this.follow_users_no = follow_users_no;
	}
	
	@Override
	public String toString() {
		return "FollowVo [users_no=" + users_no + ", follow_users_no=" + follow_users_no + "]";
	}
	
	
	
}
