package com.hotdog.petcam.vo;

public class VideoVo {

	private int video_no;
	private String save_name;
	private String org_name;
	private String ext_name;
	private String comments;
	private String regdate;
	private int publish;
	private int users_no;
	public int getVideo_no() {
		return video_no;
	}
	public void setVideo_no(int video_no) {
		this.video_no = video_no;
	}
	public String getSave_name() {
		return save_name;
	}
	public void setSave_name(String save_name) {
		this.save_name = save_name;
	}
	public String getOrg_name() {
		return org_name;
	}
	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}
	public String getExt_name() {
		return ext_name;
	}
	public void setExt_name(String ext_name) {
		this.ext_name = ext_name;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
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
	@Override
	public String toString() {
		return "VideoVo [video_no=" + video_no + ", save_name=" + save_name + ", org_name=" + org_name + ", ext_name="
				+ ext_name + ", comments=" + comments + ", regdate=" + regdate + ", publish=" + publish + ", users_no="
				+ users_no + "]";
	}
	
	
	
	
}
