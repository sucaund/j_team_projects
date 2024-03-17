package com.oracle.hellong.model;

import java.time.LocalDate;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Trainer { //트레이너
	
	    private int g_id;//체육관id nn pk f
	    private int t_id;//트레이너id nn pk
	    private String t_name;//이름 nn
	    private String t_gender;//성별 nn
	    private int t_age;//연령 nn
	    private LocalDate t_regdate; //계약일자
	    private String t_tel; //전화번호 nn
	    private String t_address; //주소
	    private int t_sal; //급여 nn
	    private String t_matters; //특이사항
	    private String t_email; //이메일

	    private String t_qualifications;
	    private String t_experience;
	    
	    private String t_photoname;
	    private String t_photostoredname;
	    
	    private MultipartFile trainerPhotoFile;
	    
	    
	    // 조회용
	      private String search;         private String keyword;
	      private String pageNum;  
	      private int start;              private int end;
	  	private int prevPage;			private int nextPage;
	      // Page 정보
	      private String currentPage;
	    
	    
}
