package team.hellong.domain;

import java.util.Date;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Data 
public class TrainerJpa { //트레이너
	private static final long serialVersionUID = 7426640368433369L;
	  	@Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	  	 private Long g_id;//체육관id nn pk f
	    private Long t_id;//트레이너id nn pk
	    private String t_name;//이름 nn
	    private String t_gender;//성별 nn
	    private int t_age;//연령 nn
	    private Date t_regdate; //계약일자
	    private Date t_period; //계약기간
	    private Long t_tel; //전화번호 nn
	    private String t_address; //주소
	    private int t_sal; //급여 nn
	    private String t_matters; //특이사항
	    
}
