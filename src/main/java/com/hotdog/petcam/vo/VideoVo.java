package com.hotdog.petcam.vo;

public class VideoVo {

	private int videoNo;
	private String saveName;
	private String orgName;
	private String extName;
	private String comments;
	private String regDate;
	private int publish;
	private int usersNo;
	
	public int getVideoNo() {
		return videoNo;
	}
	
	public void setVideoNo(int videoNo) {
		this.videoNo = videoNo;
	}
	
	public String getSaveName() {
		return saveName;
	}
	
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	
	public String getOrgName() {
		return orgName;
	}
	
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	
	public String getExtName() {
		return extName;
	}
	
	public void setExtName(String extName) {
		this.extName = extName;
	}
	
	public String getComments() {
		return comments;
	}
	
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	public String getRegDate() {
		return regDate;
	}
	
	public void setRegDate(String regDate) {
		this.regDate = regDate;
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
		return "VideoVo [videoNo=" + videoNo + ", saveName=" + saveName + ", orgName=" + orgName + ", extName="
				+ extName + ", comments=" + comments + ", regDate=" + regDate + ", publish=" + publish + ", usersNo="
				+ usersNo + "]";
	}
	
	
	
}
