package com.oracle.hellong.domain;

import java.util.Date;

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
@Table(name = "report")
@Getter
@Setter
@ToString
//@SequenceGenerator(name = "report_seq_gen", sequenceName = "report_seq_generate", initialValue = 1, allocationSize = 1) 
public class ReportJpa { //신고

	
	@Id
	  private int b_number; //게시글id f pk nn
	
	@Id
//	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "report_seq_gen")
    private int report_id; //신고 id pk nn

    private int m_number; //멤버번호 f
    
    private int report_type; //신고유형
    private Date report_date; //신고일자
    
//    @ManyToOne
//	@JoinColumn(name = "b_number")
//	private BoardJpa boardJpa;
    

//	@ManyToOne
//	@JoinColumn(name = "m_number")
//	private MemberJpa memberJpa;
	
	
}
