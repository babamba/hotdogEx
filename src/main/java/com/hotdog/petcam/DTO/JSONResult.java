package com.hotdog.petcam.DTO;

public class JSONResult {

	private String result; // "success" or "fail"
	private String message; // result가 "fail" 일 때 원인
	private Object data; // result가 "succes" 일 때 전달해야 할 데이터 객체

	public static JSONResult error(String message) {
		return new JSONResult(false, message);
	}

	public static JSONResult success(Object data) {
		return new JSONResult(data);
	}

	private JSONResult() {
	}

	private JSONResult(Object data) {
		result = "success";
		this.data = data;
	}

	private JSONResult(boolean isSuccess, String message) {
		result = isSuccess ? "success" : "fail";
		this.message = message;
	}

	public String getResult() {
		return result;
	}

	public String getMessage() {
		return message;
	}

	public Object getData() {
		return data;
	}
}