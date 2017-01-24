package com.hotdog.petcam.vo;

public class BoardImageVo {

	private int image_no;
	private int board_no;
	
	public int getImage_no() {
		return image_no;
	}
	public void setImage_no(int image_no) {
		this.image_no = image_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	
	@Override
	public String toString() {
		return "BoardImageVo [image_no=" + image_no + ", board_no=" + board_no + "]";
	}
	
	
	
	
}
