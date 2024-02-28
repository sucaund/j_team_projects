package com.oracle.hellong.model;

import lombok.Data;

@Data
public class GymBoardFile { //체육관 게시판 파일
	
	private final String g_id;			//체육관 id //pk  f
	private final String g_b_f_id;	//파일 아이디(체육관 사진 id)    //pk
	private final String g_b_f_originalFileName;// 파일 이름
	private final String g_b_f_storedFileName;	// 저장될때 이름 (uuid로 변환)
}