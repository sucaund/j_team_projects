package com.oracle.hellong.model;

import java.util.Date;

import lombok.Data;

@Data
public class GymMemberServiceOrderJoin {
	//gs
	private int 		g_id;//체육관id //pk //foreign //nn
    private int 		s_number;//서비스번호 //pk nn
    private String 		s_name;//서비스명 //nn
    private String 		s_detail;//세부내용
    private int 		s_price; //공지가격 //nn
    private int 		s_period;//이용적용기간 //nn
    private String 		s_matters;//특이사항


	//gs_detail
    private int 		sd_number;//서비스상세 //pk //nn
    private int 		sd_price; //적용가격 //nn
    private String  	s_startdate;//이용시작기간 //nn
    private String  	s_enddate;//이용종료기간
    private int 		s_isend;//만료구분

    //member
    private int 		m_number; // pk 멤버번호 nn
	private int 		common_bcd; // f 멤버권한대분류 100
	private int 		common_mcd; // f 멤버권한중분류 ex 10 일반

	private String 		m_id; //멤버아이디
	private String 		m_pw; //멤버비밀번호
	private String 		m_name; //멤버이름(닉네임)
	private int 		m_age; //나이
	private String 		m_gender; //성별
	private String 		m_phone; //전화번호

	private String 		m_email; //이메일


	private String 		m_address; //위치(주소)
	private Date 		m_regdate; //멤버가입일(등록일자)
	private Date 		m_update; //수정일자
	private int 		m_currpoint; //포인트잔액
	private int 		m_isdeleted; //삭제여부


	//gym_order
    private int 		use_point; //사용포인트
    private String  	deal_date; //거래날짜
    private String  	refund_date; //환불일자 nn
    private int 		refund_point; //환불포인트
    private String 		refund_reason; //환불사유
    private String go_start_date; // 개인 시작 날짜
    private String go_end_date;	// 개인 종료 날짜
    private int go_isend; // 만료 여부

    private String refund_criteria;  

    //조회용
 	private String search;
 	private	String keyword;
 	private	String pageNum;
 	private int	start;
 	private	int end;

 	//page 정보
 	private String currentPage;

    //성비
 	private double maleRatio;
    private double femaleRatio;

    //나이비
 	private double age10;
 	private double age20;
 	private double age30;
 	private double age40;
 	private double age50;



}