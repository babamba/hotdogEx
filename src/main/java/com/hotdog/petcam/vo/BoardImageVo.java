package com.hotdog.petcam.vo;

public class BoardImageVo {

	private int imageNo;
	private int boardNo;
	
	public int getImageNo() {
		return imageNo;
	}
	
	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}
	
	public int getBoardNo() {
		return boardNo;
	}
	
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	
	@Override
	public String toString() {
		return "BoardImageVo [imageNo=" + imageNo + ", boardNo=" + boardNo + "]";
	}
	
	
}
