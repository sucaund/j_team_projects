package com.oracle.hellong.model;

import lombok.Data;

@Data
public class GS { //체육관 서비스 g_s
       private int g_id;//체육관id //pk //foreign //nn
       private int s_number;//서비스번호 //pk nn
       private int sd_number;//서비스 상세
       
       private String s_detail;//세부내용
       private String s_name;//서비스명 //nn
       private int s_price; //공지가격 //nn
       private int s_period;//이용적용기간 //nn
       private String s_matters;//특이사항
       
       //조회용
 		private String search;
 		private	String keyword;
 		private	String pageNum;
 		private int	start;
 		private	int end;


 	         		
 		//page 정보
 		private String currentPage;
 		
 		public int getS_number() {
 			return s_number;
 		}
     
}