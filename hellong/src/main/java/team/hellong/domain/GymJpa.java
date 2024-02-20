package team.hellong.domain;

import lombok.Data;

import java.util.Date;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Data
public class GymJpa {//체육관
	private static final long serialVersionUID = 7347366460366648L;
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long gId; //체육관 id  pk nn

    private Long mNumber; //멤버번호-사장
    private String gName; //상호명 //nn
    private String gAddress; //주소 //nn
    private String gTel; //전화번호
    private Date gRegDate; //등록날짜 //nn
    private int gIsConfirmed; //진행상태
    private int gIsDeleted; //삭제여부
    private Long gCompanyNumber; //사업자등록번호
    private String gDocument; //등록신청서류
}
