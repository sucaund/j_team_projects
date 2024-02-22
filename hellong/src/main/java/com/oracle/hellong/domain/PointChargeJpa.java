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
@Table(name = "point_charge")
@Getter
@Setter
@ToString
//@SequenceGenerator(name = "point_charge_seq_gen", sequenceName = "point_charge_seq_generate", initialValue = 1, allocationSize = 1) 
public class PointChargeJpa { //포인트 충전 point_charge
	
	
	@Id
	private int m_number; //멤버번호 //pk //f nn
	
//	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "point_charge_seq_gen")
	@Id
    private int charge_number; //충전번호 //pk nn
	
    private Date charge_date; //충전일자 //nn
	
	
    private int charge_point; //충전포인트
    private String out_account; //출금계좌
    private String card_number; //카드번호
    
//    @ManyToOne
//	@JoinColumn(name = "m_number")
//	private MemberJpa memberJpa;
}
