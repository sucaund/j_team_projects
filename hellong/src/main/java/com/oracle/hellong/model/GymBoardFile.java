package com.oracle.hellong.model;

import lombok.Data;

@Data
public class GymBoardFile { // 체육관 게시판 파일

	private int 	gbf_id; // 파일 아이디
	private String 	gbf_originalFileName; // 파일 이름
	private String 	gbf_storedFileName; // 저장 이름
	private int 	g_id; // 체육관 id

}