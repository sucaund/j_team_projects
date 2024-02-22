package com.oracle.hellong.domain;

import java.util.Date;

import com.oracle.hellong.model.GSDetail;

import jakarta.persistence.Column;
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
@Table(name = "gym_order")
@Getter
@Setter
@ToString
public class GymOrderJpa { //주문( 체육관 서비스 등록) gym_order
	
	
	@Id
	 private int g_id; //체육관id //pk foreign nn
	
	
	@Id
    private int s_number;//서비스번호 //pk foreign nn
    
   
    @Id
    private int s_detail; //서비스상세 //pk foreign nn
    
    
    @Id
    private int m_number; //멤버변호 //pk foreign nn
    
    
    private int use_point; //사용포인트
    private Date deal_date; //거래날짜
    
    private Date refund_date; //환불일자 nn
    
    private int refund_point; //환불포인트
    private String refund_reason; //환불사유
    
//    @ManyToOne
//	@JoinColumn(name = "g_id")
//	private GSDetail gsdetail;
//    
//    @ManyToOne
//	@JoinColumn(name = "s_number")
//	private GSDetail gsdetail2;
//    
//    @ManyToOne
//   	@JoinColumn(name = "s_detail")
//       private GSDetail gsdetail3;
//    
//    @ManyToOne
//	@JoinColumn(name = "m_id")
//	private MemberJpa memberJpa;
    
	
}
