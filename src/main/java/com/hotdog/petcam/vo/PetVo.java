package com.hotdog.petcam.vo;

public class PetVo {
	private int petNo;
	private String name;
	private String birthDate;
	private String type;
	private String info;
	private String petImage;
	private int usersNo;
	public int getPetNo() {
		return petNo;
	}
	public void setPetNo(int petNo) {
		this.petNo = petNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
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
	public String getPetImage() {
		return petImage;
	}
	public void setPetImage(String petImage) {
		this.petImage = petImage;
	}
	public int getUsersNo() {
		return usersNo;
	}
	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}
	
	@Override
	public String toString() {
		return "PetVo [petNo=" + petNo + ", name=" + name + ", birthDate=" + birthDate + ", type=" + type + ", info="
				+ info + ", petImage=" + petImage + ", usersNo=" + usersNo + "]";
	}
	
	
}
