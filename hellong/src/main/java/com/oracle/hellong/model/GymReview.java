package com.oracle.hellong.model;

import java.util.Date;

import lombok.Data;

@Data
public class GymReview { //체육관 리뷰 gym_review
	private int 	g_id; // 체육관Id pk nn f
	private int 	s_number; // 서비스 번호 pk nn f
	private int 	sd_number; // 서비스 상세 pk nn f
	private int 	m_number; // 멤버 변호 pk nn f
	private int 	go_number;
	private String 	review_title; // 리뷰 글 제목 nn
	private String 	review_content; // 리뷰내용 nn
	private Date 	review_regdate; // 작성날짜 nn
	private String 	review_comment; // 점장댓글
	private int 	review_star; // 별점
       
	// 통합검색용
	private String totKeyword;
	
	//0318지훈추가
	private Date review_comment_date;
}