package com.oracle.hellong.model;

import java.util.Date;

import lombok.Data;

@Data
public class GymOrder { //주문(체육관 서비스 등록) gym_order
	private int 	g_id; // 체육관id //pk foreign nn
	private int 	s_number;// 서비스번호 //pk foreign nn
	private int 	s_detail; // 서비스상세 //pk foreign nn
	private int 	m_number; // 멤버변호 //pk foreign nn
	private int 	use_point; // 사용포인트
	private String 	deal_date; // 거래날짜
	private String 	refund_date; // 환불일자 nn
	private int 	refund_point; // 환불포인트
	private String 	refund_reason; // 환불사유
       
	// 0307 현승추가

    private String deal_content;
    private String refund_content;

    private String pl_date;
    private String pl_content;
    private int 	pl_point;

    private String g_name;

    private String rl_s_name;
    private String refund_criteria;   
}