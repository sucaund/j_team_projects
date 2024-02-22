package com.oracle.hellong.domain;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "gym_review")
@Getter
@Setter
@ToString
public class GymReviewJpa { //체육관 리뷰 gym_review

	
	@Id
	 private int g_id; //체육관Id pk nn f
	
	
	@Id
    private int s_number; //서비스 번호 pk nn f
    
	
	
	@Id
    private int s_detail; //서비스 상세 pk  nn f
	
	
	@Id
    private int m_number; //멤버 변호 pk nn f

    private String review_title; //리뷰 글 제목 nn

    private String review_content; //리뷰내용 nn

    private Date review_regdate; //작성날짜 nn
    
    private String review_comment; //점장댓글
    private int review_star; //별점
    
//    @OneToOne
//	@JoinColumn(name = "g_id")
//	private GymOrderJpa gymOrderJpa;
//    
//    @OneToOne
//	@JoinColumn(name = "s_number")
//	private GymOrderJpa gymOrderJpa2;
//    
//    @OneToOne
//	@JoinColumn(name = "s_detail")
//	private GymOrderJpa gymOrderJpa3;
//	
//
//	@OneToOne
//	@JoinColumn(name = "m_number")
//	private GymOrderJpa gymOrderJpa4;
    
}
