package com.hotdog.petcam.vo;

public class PetVo {
	private int pet_no;
	private String name;
	private String birthdate;
	private String type;
	private String info;
	private String pet_image;
	private int users_no;
	public int getPet_no() {
		return pet_no;
	}
	public void setPet_no(int pet_no) {
		this.pet_no = pet_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getPet_image() {
		return pet_image;
	}
	public void setPet_image(String pet_image) {
		this.pet_image = pet_image;
	}
	public int getUsers_no() {
		return users_no;
	}
	public void setUsers_no(int users_no) {
		this.users_no = users_no;
	}
	@Override
	public String toString() {
		return "PetVo [pet_no=" + pet_no + ", name=" + name + ", birthdate=" + birthdate + ", type=" + type + ", info="
				+ info + ", pet_image=" + pet_image + ", users_no=" + users_no + "]";
	}
	
	
	
	
}
