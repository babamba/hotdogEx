package com.hotdog.petcam.vo;

public class ImageVo {
	
	private int image_no;
	private String save_name;
	private String org_name;
	private String ext_name;
	private String regdate;
	
	public int getImage_no() {
		return image_no;
	}
	public void setImage_no(int image_no) {
		this.image_no = image_no;
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "ImageVo [image_no=" + image_no + ", save_name=" + save_name + ", org_name=" + org_name + ", ext_name="
				+ ext_name + ", regdate=" + regdate + "]";
	}
	
	
	
	
}
