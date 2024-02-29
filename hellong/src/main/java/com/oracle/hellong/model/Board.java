package com.oracle.hellong.model;

import java.util.Date;

import jakarta.persistence.Id;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;


@Data
public class Board { //게시판 게시물 board
	    private int b_number; //게시글id //pk //not null  1
	    private int m_number; //멤버번호 //foreign1
	    private int b_category; //카테고리1
	    private String b_title; //제목1
	    private String b_content; //내용1
	    private int b_readcount; //조회수
	    private Date b_regdate; //생성일자
	    private Date b_update; //수정일자
	    private int b_isreported; //신고여부
	    private int b_recomm_count; //추천수
	    private int b_isrecomm; //추천여부
	    private String b_images; //첨부이미지
	    private int b_comm_group; //그룹(댓글)
	    private int b_comm_indent; //indent
	    private int b_comm_step; //step
	    
	 // 조회용
		private String search;   	   private String keyword;
		private String pageNum;  
		private int start; 		 	   private int end;
		private String m_id; //멤버id
		// Page 정보
		private String currentPage;
}
