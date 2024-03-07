package com.oracle.hellong.model;

import java.util.Date;

import lombok.Data;

@Data
public class Report { //신고 report
	private int 	b_number; // 게시글id f pk p nn
	private int 	report_id; // 신고 id pk nn
	private int 	m_number; // 멤버번호 f
	private int 	common_bcd; // 신고유형대분류 400 f
	private int 	common_mcd; // 신고유형중분류 ex.10 f
	private Date 	report_date; // 신고일자
}
