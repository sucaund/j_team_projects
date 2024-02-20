package team.hellong.model;
import java.util.Date;

import lombok.Data;

@Data
public class Report {
	   private int b_number; //게시글id f pk nn
	    private int report_id; //신고 id pk nn
	    private int m_number; //멤버번호 f
	    private int report_type; //신고유형
	    private Date report_date; //신고일자
}
