package com.oracle.hellong.model;

import java.util.Date;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class Member { //회원 //member
	  private int m_number; // pk 멤버번호 nn
	  private int common_bcd; // f 멤버권한대분류 100
	  private int common_mcd; // f 멤버권한중분류 ex 10 일반
	  
	  private String m_id; //멤버아이디
	  private String m_pw; //멤버비밀번호
	  private String m_name; //멤버이름(닉네임)
	  private int m_age; //나이
	  private String m_gender; //성별
	  private String m_phone; //전화번호
	    
	  private String m_email; //이메일
	    
	    
	  private String m_address; //위치(주소)
	  private Date m_regdate; //멤버가입일(등록일자)
	  private Date m_update; //수정일자
	  private int m_currpoint; //포인트잔액
	  private int m_isdeleted; //삭제여부
	    
	  // 조회용 -> 실제로 db에 없어도 됨
	  private String search;   	   private String keyword;
	  private String pageNum;  
	  private int start; 		 	   private int end;
	  // Page 정보 -> 실제로 db에 없어도 됨
	  private String currentPage;
		
}
