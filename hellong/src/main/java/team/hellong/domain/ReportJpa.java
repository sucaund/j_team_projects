package team.hellong.domain;

import java.util.Date;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Data
public class ReportJpa { //신고
	private static final long serialVersionUID = 764273660368684L;
	@Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	  private int b_number; //게시글id f pk nn
    private int report_id; //신고 id pk nn
    private int m_number; //멤버번호 f
    private int report_type; //신고유형
    private Date report_date; //신고일자
}
