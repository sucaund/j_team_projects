package team.hellong.domain;

import java.util.Date;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Data
public class GymOrderJpa { //주문. 체육관 서비스 등록
	private static final long serialVersionUID = 7305050403666948L;
	@Id
	  @GeneratedValue(strategy = GenerationType.IDENTITY)
	 private int g_id; //체육관id //pk foreign nn
    private int s_number;//서비스번호 //pk foreign nn
    private int s_detail; //서비스상세 //pk foreign nn
    private int m_number; //멤버변호 //pk foreign nn
    private int use_point; //사용포인트
    private Date deal_date; //거래날짜
    private int refund_date; //환불일자 nn
    private int refund_point; //환불포인트
    private String refund_reason; //환불사유
}
