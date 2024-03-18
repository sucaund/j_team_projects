package com.oracle.hellong.model;

import lombok.Data;

@Data
public class RecommCheck {
	private int b_number;
	private int m_number;
	private int rc_isrecomm; //추천여부 0-추천안됨 , 1-추천됨


}
