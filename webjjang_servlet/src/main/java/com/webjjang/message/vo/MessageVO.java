package com.webjjang.message.vo;

import lombok.Data;

@Data
public class MessageVO {

	// private 변수
	private Long no;
	private String content;
	private String senderId;
	private String senderName;
	private String senderPhoto;
	private String sendDate;
	
	private String accepterId;
	private String accepterName;
	private String accepterPhoto;
	private String acceptDate;
	private int allUser; // 기본 값이 0 - 개인, 1 - 전체 메시지
	
}
