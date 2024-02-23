package com.oracle.hellong.domain;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "board")
@Getter
@Setter
@ToString
//@SequenceGenerator(name = "board_seq_gen", sequenceName = "b_number", initialValue = 1, allocationSize = 1) 
public class BoardJpa { //게시판 게시물 board

	@Id
//    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "board_seq_gen")
	 private int b_number; //게시글id //pk //nnull
	
	
	 private int m_number; //멤버번호 //foreign
	 
	 private int b_category; //카테고리
	    private String b_title; //제목
	    private String b_content; //내용
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
	    
	    
	    
//	    @ManyToOne
//		@JoinColumn(name = "m_number")
//		private MemberJpa memberJpa;
		
}

