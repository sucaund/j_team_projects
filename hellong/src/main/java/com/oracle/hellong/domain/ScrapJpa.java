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
@Table(name = "scrap")
@Getter
@Setter
@ToString
public class ScrapJpa { //스크랩(게시물)

	
	@Id
	 private int m_number; //멤버번호 pk f nn 
	
	
	
	@Id
    private int b_number; //게시글번호  pk f nn
	
//	@ManyToOne
//	@JoinColumn(name = "m_number")
//	private MemberJpa memberJpa;
//	
//
//	@ManyToOne
//	@JoinColumn(name = "b_number")
//	private BoardJpa boardJpa;
	
}
