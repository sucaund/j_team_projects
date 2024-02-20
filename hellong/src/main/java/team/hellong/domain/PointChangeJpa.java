package team.hellong.domain;

import java.util.Date;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Data
public class PointChangeJpa { //포인트 충전
	private static final long serialVersionUID = 7342733635568461L;
	@Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int m_number; //멤버번호 //pk //f nn
    private int charge_number; //충전번호 //pk nn
    private Date charge_date; //충전일자 //nn
    private int charge_point; //충전포인트
    private String out_account; //출금계좌
    private String card_number; //카드번호
}
