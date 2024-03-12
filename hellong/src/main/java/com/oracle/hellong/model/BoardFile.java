package com.oracle.hellong.model;

import lombok.Data;
@Data
public class BoardFile {
	private int 		b_number; // 게시판 ID
	private int 		bf_id; // 게시판 파일 ID
	private String 		bf_originalName; // 파일 원래이름
	private String 		bf_savedName; // 저장될 파일이름
	private String 		bf_storedFileName; // 저장될 파일에 대한 새로운 이름
	
	public String getImagePath() {
		return "C:/backup/" + bf_savedName;
	}
}
