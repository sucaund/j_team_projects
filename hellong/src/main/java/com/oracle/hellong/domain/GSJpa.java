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
@Table(name = "g_s")
@Getter
@Setter
@ToString
//@SequenceGenerator(name = "gs_seq_gen", sequenceName = "s_number", initialValue = 1, allocationSize = 1) 
public class GSJpa { //체육관서비스 g_s
	
	
	@Id
	 private int g_id;//체육관id //pk //foreign //nn
	
	@Id
//    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "gs_seq_gen")
	private int s_number;//서비스번호 pk nn
    
	private String s_name;//서비스명 //nn
	 
    private String s_detail;//세부내용
    
    private int s_price; //공지가격 //nn
    
    private int s_period;//이용적용기간 //nn
    
    private String s_matters;//특이사항

    
//    @ManyToOne
//	@JoinColumn(name = "g_id")
//	private GymJpa gymJpa;
	

}
