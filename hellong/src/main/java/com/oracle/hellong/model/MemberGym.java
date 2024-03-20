package com.oracle.hellong.model;

import java.util.Date;

import lombok.Data;

// Member 테이블과 Gym 테이블 조인 => 승인된 체육관 뜨게 하기

@Data
public class MemberGym {
	//member 테이블
	private int 		m_number; // pk 멤버번호 nn
    private int 		common_bcd; // f 멤버권한대분류 100
    private int 		common_mcd; // f 멤버권한중분류 ex 10 일반
      private String 	m_id; //멤버아이디
      private String 	m_pw; //멤버비밀번호
      private String 	m_name; //멤버이름(닉네임)
      private int 		m_age; //나이
      private int 		m_gender; //성별
      private String 	m_phone; //전화번호
      private String 	m_email; //이메일
      private String 	m_address; //위치(주소)
      private Date 		m_regdate; //멤버가입일(등록일자)
      private Date 		m_update; //수정일자
      private int 		m_currpoint; //포인트잔액
      private int 		m_isdeleted; //삭제여부
    
    //gym 테이블
      private int 		g_id; //체육관 id  pk nn
      private String 	g_name; //상호명 //nn
      private String 	g_address; //주소 //nn
      private String 	g_tel; //전화번호
      private Date 		g_regdate; //등록날짜 //nn
      private int 		g_isdeleted; //삭제여부
      private int 		g_companynumber; //사업자등록번호
      private String 	g_document; //등록신청서류

	//조회용
	private String search;
	private	String keyword;
	private	String pageNum;
	private int	start;
	private	int end;
	
	//page 정보
	private String currentPage;
    
  

	
	
}
