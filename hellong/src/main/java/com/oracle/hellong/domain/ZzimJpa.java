package com.oracle.hellong.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "zzim")
@Getter
@Setter
@ToString
public class ZzimJpa { //찜(헬스장) zzim
	
	@Id
	 private int g_id; //체육관id pk nn f
	
	@Id
    private int m_number; //멤버번호 pk nn  f
	
//	@ManyToOne
//	@JoinColumn(name = "g_id")
//	private GymJpa gymJpa;
	
//	@ManyToOne
//	@JoinColumn(name = "m_number")
//	private MemberJpa memberJpa;
}
