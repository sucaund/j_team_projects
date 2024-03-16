package com.oracle.hellong.model;

import java.util.Date;

import lombok.Data;

@Data
public class GSGSDetailJoin {
    private int g_id;//체육관id //pk //foreign //nn
    private int s_number;//서비스번호 //pk nn
    private String s_name;//서비스명 //nn

    private String s_detail;//세부내용

    private int s_price; //공지가격 //nn
    private int s_period;//이용적용기간 //nn
    private String s_matters;//특이사항	


    private int sd_number;//서비스상세 //pk //nn
    private int sd_price; //적용가격 //nn
    private Date  sd_startdate;//이용시작기간 //nn
    private Date  sd_enddate;//이용종료기간
    private String sd_matters;//특이사항
    private int sd_isend;//만료구분


    //조회용
    private String search;
    private String keyword;
	private	String pageNum;
	private int	start;
	private	int end;

	//page 정보
	private String currentPage;
}