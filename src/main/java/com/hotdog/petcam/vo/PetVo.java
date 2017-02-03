package com.hotdog.petcam.vo;

public class PetVo {
	
	private int pet_no;
	private String name;
	private String co_date;
	private String gender;
	private String info;
	private String pet_image;
	private String age;
	private int users_no;
	
	
	public int getPet_no() {
		return pet_no;
	}
	public void setPet_no(int pet_no) {
		this.pet_no = pet_no;
	}
	public String getCo_date() {
		return co_date;
	}
	public void setCo_date(String co_date) {
		this.co_date = co_date;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCo_Date() {
		return co_date;
	}
	public void setCo_Date(String co_date) {
		this.co_date = co_date;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}

	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "PetVo [pet_no=" + pet_no + ", name=" + name + ", co_date=" + co_date + ", gender=" + gender + ", info="
				+ info + ", pet_image=" + pet_image + ", age=" + age + ", users_no=" + users_no + "]";
	}
	
	
}
