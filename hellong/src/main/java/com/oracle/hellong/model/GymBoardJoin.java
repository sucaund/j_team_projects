package com.oracle.hellong.model;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GymBoardJoin {// 체육관 + 체육관 게시판
		
		//체육관
	   private int 		g_id; //체육관 id  pk nn
	   private int 		m_number; //멤버번호-사장 f
	   private int 		common_bcd; //진행상태-대분류 f 500
	   private int 		common_mcd; //진행상태-중분류 f ex 10 20 30
	   private String 	g_name; //상호명 //nn
	   private String 	g_address; //주소 //nn
	   private String 	g_tel; //전화번호
	   private Date 	g_regdate; //등록날짜 //nn
	   private int 		g_isdeleted; //삭제여부
	   private int 		g_companynumber; //사업자등록번호
	   private String 	g_document; //등록신청서류
	   
	   
	   //체육관 게시판
	   private String gb_title;//제목 //nn
       
       // String로 변경
       private String gb_regdate; //작성날짜 //nn
       
       private String gb_ment;//대표멘트
       private String gb_video; //대표사진및동영상
       private String gb_time; //운영사진및기타
       private String gb_machine;//운동기구
       private String gb_amen;//편의시설

       private String gb_map;//지도및주소
       private int gb_hit; //nn //조회수    
       
       private int fileAttached;
       private List<MultipartFile> gymBoardFile;
	   
	   
	
}
