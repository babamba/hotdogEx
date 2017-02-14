package com.hotdog.petcam.vo;

public class CategoryVo {
	
	private int category_no;
	private String title;
	private String desc;
	
	public int getCategory_no() {
		return category_no;
	}
	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	@Override
	public String toString() {
		return "CategoryVo [category_no=" + category_no + ", title=" + title + ", desc=" + desc + "]";
	}
	
	

	
}
