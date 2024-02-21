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
@Table(name = "trainer")
@Getter
@Setter
@ToString
//@SequenceGenerator(name = "trainer_seq_gen", sequenceName = "trainer_seq_generate", initialValue = 1, allocationSize = 1) 
public class TrainerJpa { //트레이너

	
	  	@Id
	  	 private int g_id;//체육관id nn pk f
	  	
	 	@Id
//	 	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "trainer_seq_gen")
	    private int t_id;//트레이너id nn pk
	 	
	 	
	    private String t_name;//이름 nn
	    private String t_gender;//성별 nn
	    private int t_age;//연령 nn
	    private Date t_regdate; //계약일자
	    private Date t_period; //계약기간
	    private String t_tel; //전화번호 nn
	    private String t_address; //주소
	    private int t_sal; //급여 nn
	    private String t_matters; //특이사항
	    
//	    @ManyToOne
//		@JoinColumn(name = "g_id")
//		private GymJpa gymJpa;
	    
}
