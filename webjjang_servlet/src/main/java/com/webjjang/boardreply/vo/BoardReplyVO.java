package com.webjjang.boardreply.vo;

public class BoardReplyVO {

	// private 변수
	
	
	private Long rno;
	private Long no;
		private String content;
		private String writer;
		private String writeDate;
		private String pw;
		public Long getRno() {
			return rno;
		}
		public void setRno(Long rno) {
			this.rno = rno;
		}
		public Long getNo() {
			return no;
		}
		public void setNo(Long no) {
			this.no = no;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getWriter() {
			return writer;
		}
		public void setWriter(String writer) {
			this.writer = writer;
		}
		public String getWriteDate() {
			return writeDate;
		}
		public void setWriteDate(String writeDate) {
			this.writeDate = writeDate;
		}
		public String getPw() {
			return pw;
		}
		public void setPw(String pw) {
			this.pw = pw;
		}
		@Override
		public String toString() {
			return "BoardreplyVO [rno=" + rno + ", no=" + no + ", content=" + content + ", writer=" + writer
					+ ", writeDate=" + writeDate + ", pw=" + pw + ", getRno()=" + getRno() + ", getNo()=" + getNo()
					+ ", getContent()=" + getContent() + ", getWriter()=" + getWriter() + ", getWriteDate()="
					+ getWriteDate() + ", getPw()=" + getPw() + ", getClass()=" + getClass() + ", hashCode()="
					+ hashCode() + ", toString()=" + super.toString() + "]";
		}
		
		
}
