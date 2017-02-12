package com.hotdog.petcam.vo;

public class PostChatVo {

		private int post_chat_no;
		private String content;
		private String regdate;
		private int comments_no;
		private int users_no;
		private String nickname;
		private String users_image;
		
		
		
		public String getNickname() {
			return nickname;
		}
		public void setNickname(String nickname) {
			this.nickname = nickname;
		}
		public String getUsers_image() {
			return users_image;
		}
		public void setUsers_image(String users_image) {
			this.users_image = users_image;
		}
		public int getPost_chat_no() {
			return post_chat_no;
		}
		public void setPost_chat_no(int post_chat_no) {
			this.post_chat_no = post_chat_no;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getRegdate() {
			return regdate;
		}
		public void setRegdate(String regdate) {
			this.regdate = regdate;
		}
		public int getComments_no() {
			return comments_no;
		}
		public void setComments_no(int comments_no) {
			this.comments_no = comments_no;
		}
		public int getUsers_no() {
			return users_no;
		}
		public void setUsers_no(int users_no) {
			this.users_no = users_no;
		}
		@Override
		public String toString() {
			return "PostChatVo [post_chat_no=" + post_chat_no + ", content=" + content + ", regdate=" + regdate
					+ ", comments_no=" + comments_no + ", users_no=" + users_no + ", nickname=" + nickname
					+ ", users_image=" + users_image + "]";
		}
		
		
		
}
