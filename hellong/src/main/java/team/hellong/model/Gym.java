package team.hellong.model;

import java.util.Date;

import lombok.Data;
@Data
public class Gym {
	 private Long g_id; //체육관 id  pk nn
	    private Long m_number; //멤버번호-사장
	    private String g_name; //상호명 //nn
	    private String g_address; //주소 //nn
	    private String g_tel; //전화번호
	    private Date g_regdate; //등록날짜 //nn
	    private int g_isconfirmed; //진행상태
	    private int g_isdeleted; //삭제여부
	    private Long g_companynumber; //사업자등록번호
	    private String g_document; //등록신청서류

}
