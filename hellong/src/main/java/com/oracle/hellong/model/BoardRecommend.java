package com.oracle.hellong.model;

import lombok.Data;

@Data
public class BoardRecommend {
	private int m_number;
	private int b_number;
	private int isrecommended; // 추천여부 기본값 0(추천안됨)
	
}
