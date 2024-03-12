package com.oracle.hellong.model;

import java.util.Date;

import lombok.Data;

@Data
public class PointCharge { //포인트충전 point_charge
	private int 	m_number; // 멤버번호 //pk //f nn
	private int 	charge_number; // 충전번호 //pk nn
	private Date 	charge_date; // 충전일자(등록일자) //nn
	private int 	charge_point; // 충전포인트
	private String 	out_account; // 출금계좌
	private String 	card_number; // 카드번호
       
    // 조회용 (0307 현승추가)
	private String search;   	   private String keyword;
	private String pageNum;  
	private int start; 		 	   private int end;
	private String currentPage;

	private String charge_content;

    private String pl_date;
    private String pl_content;
    private String pl_point;
}