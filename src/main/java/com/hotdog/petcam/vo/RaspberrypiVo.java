package com.hotdog.petcam.vo;

public class RaspberrypiVo {

	private int users_no;
	private String device_num;
	private String token;
	private int temperature;
	private int humidity;
	public int getUsers_no() {
		return users_no;
	}
	public void setUsers_no(int users_no) {
		this.users_no = users_no;
	}
	public String getDevice_num() {
		return device_num;
	}
	public void setDevice_num(String device_num) {
		this.device_num = device_num;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public int getTemperature() {
		return temperature;
	}
	public void setTemperature(int temperature) {
		this.temperature = temperature;
	}
	public int getHumidity() {
		return humidity;
	}
	public void setHumidity(int humidity) {
		this.humidity = humidity;
	}
	@Override
	public String toString() {
		return "RaspberrypiVo [users_no=" + users_no + ", device_num=" + device_num + ", token=" + token
				+ ", temperature=" + temperature + ", humidity=" + humidity + "]";
	}
	
	

}
