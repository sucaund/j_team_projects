package team.hellong.domain;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Data
public class ZzimJpa { //찜(헬스장)
	private static final long serialVersionUID = 73424573403399339L;
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	 private int g_id; //체육관id pk nn f
    private int m_number; //멤버번호 pk nn  f
}
