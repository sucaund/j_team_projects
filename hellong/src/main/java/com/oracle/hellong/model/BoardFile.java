package com.oracle.hellong.model;

import lombok.Data;
@Data
public class BoardFile {
	private final int 		b_number; // 게시판 ID
	private final int 		bf_id; // 게시판 파일 ID
	private final String 	bf_originalName; // 파일 원래이름
	private final String 	bf_savedName; // 저장될 파일이름
}
