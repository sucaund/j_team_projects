package com.oracle.hellong.model;

import lombok.Data;

@Data
public class GymOrder { //주문(체육관 서비스 등록) gym_order
	private int 	g_id; // 체육관id //pk foreign nn
    private int 	s_number;//서비스번호 //pk //nn
    private int 	sd_number;//서비스상세 //pk //nn
    private int 	sd_price; //적용가격 //nn
    private int 	m_number; //멤버변호 //pk foreign nn
    
    private int 	go_number; // 주문번호
    
    private int 	use_point; //사용포인트
    private String  deal_date; //거래날짜
    private String  refund_date; //환불일자 nn
    private int 	refund_point; //환불포인트
    private String refund_reason; //환불사유
    private String go_startdate; // 개인 시작 날짜
    private String go_enddate;	// 개인 종료 날짜
    private int go_isend; // 만료 여부

    // 0307 현승추가
    
    private String deal_content;
    private String refund_content;

    private String pl_date;
    private String pl_content;
    private int 	pl_point;
    
    private String g_name;
    private String s_name;
    
    private String rl_s_name;
    private String refund_criteria;

    // 0314 현승추가
    private int years;
    private int months;
    private String period_of_use;
    private String first_regist_date;
    private String gb_photo;
    
    private String g_address;
    private String gbf_storedFileName;
       
       
}