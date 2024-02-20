package team.hellong.domain;

import java.util.Date;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Data
public class GymReviewJpa { //체육관 리뷰
	private static final long serialVersionUID = 73056604036664L;
	@Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 private int g_id	; //체육관Id pk nn f
    private int s_number; //서비스 번호 pk nn f
    private int s_detail; //서비스 상세 pk  nn f
    private int m_number; //멤버 변호 pk nn f
    private String review_title; //리뷰 글 제목 nn
    private String review_content; //리뷰내용 nn
    private Date review_regdate; //작성날짜 nn
    private String review_comment; //점장댓글
    private int review_star; //별점
}
