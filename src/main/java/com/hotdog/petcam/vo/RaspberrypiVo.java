package com.hotdog.petcam.vo;

public class RaspberrypiVo {

	private int users_no;
	private String device_num;
	private String ip_address;
	private int temperature;

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

	public String getIp_address() {
		return ip_address;
	}

	public void setIp_address(String ip_address) {
		this.ip_address = ip_address;
	}

	public int getTemperature() {
		return temperature;
	}

	public void setTemperature(int temperature) {
		this.temperature = temperature;
	}

	@Override
	public String toString() {
		return "Raspberrypi [users_no=" + users_no + ", device_num=" + device_num + ", ip_address=" + ip_address
				+ ", temperature=" + temperature + "]";
	}

}
