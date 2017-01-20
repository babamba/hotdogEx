package com.hotdog.petcam.vo;

public class FollowVo {

	private int usersNo;
	private int followUsersNo;
	public int getUsersNo() {
		return usersNo;
	}
	
	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}
	
	public int getFollowUsersNo() {
		return followUsersNo;
	}
	
	public void setFollowUsersNo(int followUsersNo) {
		this.followUsersNo = followUsersNo;
	}
	
	@Override
	public String toString() {
		return "FollowVo [usersNo=" + usersNo + ", followUsersNo=" + followUsersNo + "]";
	}
	
	
}
