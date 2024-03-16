package com.oracle.hellong.model;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class GymBoardServiceJoin { //체육관 게시물 + 체육관 서비스

	//gymBoard
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

    private int fileAttached;
    private List<MultipartFile> gymBoardFile;

    //gymService
    private int s_number;//서비스번호 //pk nn
    private String s_name;//서비스명 //nn
    private String s_detail;//세부내용
    private int s_price; //공지가격 //nn
    private int s_period;//이용적용기간 //nn
    private String s_matters;//특이사항
    private int s_isdeleted;

    private int min_s_price;

    private String search;
    private String keyword;
    private	String pageNum;
    private int	start;
    private	int end;

}