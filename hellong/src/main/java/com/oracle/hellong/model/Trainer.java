package com.oracle.hellong.model;

import java.util.Date;

import lombok.Data;

@Data
public class Trainer { //트레이너
	 private int g_id;//체육관id nn pk f
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
}
