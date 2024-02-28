package com.oracle.hellong.model;

import java.util.Date;

import lombok.Data;

@Data
public class GymBoard { //체육관 게시글(등록) gym_board
	  private int g_id; //체육관id pk f nn
	    private String gb_title;//제목 //nn
	    private Date gb_regdate; //작성날짜 //nn
	    private String gb_ment;//대표멘트
	    private String gb_video; //대표사진및동영상
	    private String gb_time; //운영사진및기타
	    private String gb_machine;//운동기구
	    private String gb_amen;//편의시설
	    private String gb_map;//지도및주소
	    private int gb_hit; //nn //조회수
}
