package team.hellong.domain;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Data
public class ScrapJpa { //스크랩(게시물)
	private static final long serialVersionUID = 77427366403684368L;
	@Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 private int m_number; //멤버번호 pk f nn 
    private int b_number; //게시글  pk f nn
}
