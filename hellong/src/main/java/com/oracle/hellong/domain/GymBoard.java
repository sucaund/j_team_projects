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
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "gym_board")
@Getter
@Setter
@ToString
public class GymBoard { //체육관 게시글 gym_board
	

	@Id
	 private int g_id; //체육관id //pk //f //nn 
	
    private String gb_title;//제목 //nn
	 
    private Date gb_regdate; //작성날짜 //nn
	 
    private String gb_ment;//대표멘트
    private String gb_video; //대표사진및동영상
    private String gb_time; //운영사진및기타
    private String gb_machine;//운동기구
    private String gb_amen;//편의시설
    private String gb_photo;//헬스장사진
    private String gb_map;//지도및주소
    private int gb_hit; //nn //조회수
    

//	@OneToOne
//	@JoinColumn(name = "g_id")
//	private GymJpa gymJpa;
	
}
