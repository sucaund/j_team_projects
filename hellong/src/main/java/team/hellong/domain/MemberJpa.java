package team.hellong.domain;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;


@Data
@Table(name = "MEMBER")
public class MemberJpa { //회원
	private static final long serialVersionUID = 7342736640368461L;
	@Id 
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 private int m_number; // pk 멤버번호 nn
    private String m_id; //멤버아이디
    private String m_pw; //멤버비밀번호
    private String m_name; //멤버이름(닉네임)
    private int m_age; //나이
    private int m_gender; //성별
    private String m_phone; //전화번호
    private String m_email; //이메일
    private String m_address; //위치(주소)
    private Date m_regdate; //멤버가입일
    private int m_currpoint; //포인트잔액
    private int m_rank; //멤버등급(권한)
    private int m_isdeleted; //삭제여부
	
	
}