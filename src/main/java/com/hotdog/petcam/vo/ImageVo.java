package com.hotdog.petcam.vo;

public class ImageVo {
	
	private int imageNo;
	private String saveName;
	private String orgName;
	private String extName;
	private String regDate;
	
	public int getImageNo() {
		return imageNo;
	}
	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
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
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "ImageVo [imageNo=" + imageNo + ", saveName=" + saveName + ", orgName=" + orgName + ", extName="
				+ extName + ", regDate=" + regDate + "]";
	}
	
	
}
