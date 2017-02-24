package com.hotdog.petcam.vo;

public class CaptureVo {

	private int capture_no;
	private String save_name;
	private String regdate;
	private String regtime;
	private int users_no;

	public int getCapture_no() {
		return capture_no;
	}

	public void setCapture_no(int capture_no) {
		this.capture_no = capture_no;
	}

	public String getSave_name() {
		return save_name;
	}

	public void setSave_name(String save_name) {
		this.save_name = save_name;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getRegtime() {
		return regtime;
	}

	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}

	public int getUsers_no() {
		return users_no;
	}

	public void setUsers_no(int users_no) {
		this.users_no = users_no;
	}

	@Override
	public String toString() {
		return "Capture [capture_no=" + capture_no + ", save_name=" + save_name + ", regdate=" + regdate + ", regtime="
				+ regtime + ", users_no=" + users_no + "]";
	}

}
