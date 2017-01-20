package com.hotdog.petcam.vo;

public class PostImageVo {

	private int imageNo;
	private int postNo;
	
	public int getImageNo() {
		return imageNo;
	}
	
	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}
	
	public int getPostNo() {
		return postNo;
	}
	
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	
	@Override
	public String toString() {
		return "PostImageVo [imageNo=" + imageNo + ", postNo=" + postNo + "]";
	}
	
	
	
}
