package team.hellong.domain;

import lombok.Data;
import java.util.Date;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Data
public class GymBoard { //체육관 게시글
	private static final long serialVersionUID = 7305050403667648L;
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	 private Long g_id; //체육관id //nn //gym의 gId 가져옴 f
    private String gb_title;//제목 //nn
    private Date gb_regdate; //작성날짜 //nn
    private String gb_ment;//대표멘트
    private String gb_video; //대표사진및동영상
    private String gb_time; //운영사진및기타
    private String gb_machine;//운동기구
    private String gb_amen;//편의시설
    private String gb_photo;//헬스장사진
    private String gb_map;//지도및주소
    private Long gb_hit; //nn //조회수
}
