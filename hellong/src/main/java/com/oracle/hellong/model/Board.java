package com.oracle.hellong.model;

import lombok.Data;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;

@Data
public class Board { //게시판 게시물 board
	private int 	b_number; //게시글id //pk //nnull  
    private int 	m_number; //멤버번호 //foreign
    private int 	common_bcd; //글유형대분류 //foreign 200
    private int 	common_mcd; //글유형중분류 //foreign ex.10  20
	private String 	b_title; //제목
    private String 	b_content; //내용
	private int 	b_readcount; //조회수
	private String  b_regdate; //생성일자(등록일자)
	private String  b_update; //수정일자
    private int 	b_isreported; //신고여부
    private int 	b_recomm_count; //추천수
    private List<MultipartFile> b_images; //첨부이미지 kwon
//    private String 	b_images; //첨부이미지 기존
    private int 	b_comm_group; //그룹(댓글)
    private int 	b_comm_indent; //indent
    private int 	b_comm_step; //step

    // 조회용
    private String 	search;        		private String 	keyword;
    private String 	pageNum;  			private String jjcategory;
    private int 	start;              private int 	end;
  	private int 	prevPage;			private int 	nextPage;

  	private int		report_id;// report
  	private String  reportSelect;

  	// Page 정보
    private String currentPage;
    
    //0306임시
  	private String 	m_name;
  	
	// 통합검색용
	private String totKeyword;
	
	private String cateSearch;
}
