package com.oracle.hellong.model;

import java.util.Date;

import lombok.Data;
@Data
public class Gym { //체육관 gym
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

}
