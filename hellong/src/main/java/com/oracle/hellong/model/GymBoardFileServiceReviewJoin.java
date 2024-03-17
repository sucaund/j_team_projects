package com.oracle.hellong.model;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class GymBoardFileServiceReviewJoin { //체육관 게시물 + 체육관 서비스 + gym_review + gym + gymboerdFile
	
	// gym
    private int g_id; //체육관 id  pk nn
    private int m_number; //멤버번호-사장 f
    private int common_bcd; //진행상태-대분류 f 500
    private int common_mcd; //진행상태-중분류 f ex 10 20 30
    private String g_name; //상호명 //nn
    private String g_address; //주소 //nn
    private String g_tel; //전화번호
    private Date g_regdate; //등록날짜 //nn
    private int g_isdeleted; //삭제여부
    private int g_companynumber; //사업자등록번호
    private String g_document; //등록신청서류	
	
	
	//gymBoard
    private String gb_title;//제목 //nn   
    private Date gb_regdate; //작성날짜 //nn 
    private String gb_ment;//대표멘트
    private String gb_video; //대표사진및동영상
    private String gb_time; //운영사진및기타
    private String gb_machine;//운동기구
    private String gb_amen;//편의시설
    private String gb_map;//지도및주소
    private int gb_hit; //nn //조회수  
    private int fileAttached;
    private List<MultipartFile> gymBoardFile;
    
    //gymboard_file
	private int gbf_id; // 파일 아이디
	private String gbf_originalFileName; // 파일 이름
	private String gbf_storedFileName; // 저장 이름
    
    
    //gymService
    private int s_number;//서비스번호 //pk nn
    private String s_name;//서비스명 //nn   
    private String s_detail;//세부내용
    private int s_price; //공지가격 //nn
    private int s_period;//이용적용기간 //nn
    private String s_matters;//특이사항
    private int s_isdeleted;
    
    //review
    private int sd_number; //서비스 상세 pk  nn f
    private int go_number;
    private String review_title; //리뷰 글 제목 nn
    private String review_content; //리뷰내용 nn
    private Date review_regdate; //작성날짜 nn
    private String review_comment; //점장댓글
    private int review_star; //별점
    private Date review_comment_date;
    
    // 그룹화 컬럼
    private Double avg_review_star;
    private int count_review_star;
    private int min_s_price;
    
    //조회 컬럼
    // 조회용
    private String search;         private String keyword;
    private String pageNum;  
    private int start;              private int end;
	private int prevPage;			private int nextPage;
    // Page 정보
    private String currentPage;
    
    
    
}
