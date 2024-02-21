package com.oracle.hellong.domain;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "g_s_detail")
@Getter
@Setter
@ToString
public class GSDetailJpa { //체육관 상세서비스

	
	@Id
	private int g_id; //체육관id //pk //f //nn 
	
	@Id
    private int s_number; //서비스번호 pk f
    

	@Id
	private int s_detail;//서비스상세 //pk //nn
    
	private int s_price; //적용가격 //nn
    
	private Date s_startdate;//이용시작기간 //nn
    
	private Date s_enddate;//이용종료기간
    private String s_matters;//특이사항
    private int s_isend;//만료구분
    

//	@ManyToOne
//	@JoinColumn(name = "g_id")
//	private GSJpa gsJpa;
//	
//
//	@ManyToOne
//	@JoinColumn(name = "s_number")
//	private GSJpa gsJpa2;
}
