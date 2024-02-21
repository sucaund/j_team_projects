package com.oracle.hellong.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

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
import jakarta.persistence.Transient;

@Entity
@Table(name = "gym")
@Getter
@Setter
@ToString
//@SequenceGenerator(name = "gym_seq_gen", sequenceName = "g_id", initialValue = 1, allocationSize = 1) 
public class GymJpa {//체육관
	
	@Id
//    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "gym_seq_gen")	
	private int g_id; //체육관 id  pk nn
	
    private int m_number; //멤버번호-사장 f
    
    private String g_name; //상호명 //nn
    
    private String g_address; //주소 //nn
    private String g_tel; //전화번호
    
    private Date g_regdate; //등록날짜 //nn
    private int g_isconfirmed; //진행상태
    private int g_isdeleted; //삭제여부
    private int g_companynumber; //사업자등록번호
    private String g_document; //등록신청서류
    
//	@ManyToOne
//	@JoinColumn(name = "m_number")
//	private MemberJpa memberJpa;
	
    
    
}
