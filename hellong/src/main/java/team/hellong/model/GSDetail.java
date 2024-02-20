package team.hellong.model;
import java.util.Date;

import lombok.Data;

@Data
public class GSDetail {
	   private int g_id; //체육관id //pk //nn
	    private int s_number;//서비스번호 //pk //nn
	    private int s_detail;//서비스상세 //pk //nn
	    private int s_price; //적용가격 //nn
	    private Date s_startdate;//이용시작기간 //nn
	    private Date s_enddate;//이용종료기간
	    private String s_matters;//특이사항
	    private String s_isend;//만료구분
}
