package com.oracle.hellong.model;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GymBoardReviewJoin { //체육관 게시판 + 리뷰

	//gymboard
    private int g_id; //체육관id pk f nn
    private String gb_title;//제목 //nn

    private Date gb_regdate; //작성날짜 //nn

    private String gb_ment;//대표멘트
    private String gb_video; //대표사진및동영상
    private String gb_time; //운영사진및기타
    private String gb_machine;//운동기구
    private String gb_amen;//편의시설

    private String gb_map;//지도및주소
    private int gb_hit; //nn //조회수  

    private int fileAttached;
    private List<MultipartFile> gymBoardFile;

    // review
    private int s_number; //서비스 번호 pk nn f
    private int sd_number; //서비스 상세 pk  nn f
    private int m_number; //멤버 변호 pk nn f
    private String review_title; //리뷰 글 제목 nn
    private String review_content; //리뷰내용 nn
    private Date review_regdate; //작성날짜 nn
    private String review_comment; //점장댓글
    private int review_star; //별점

    private Double avg_review_star;
	private int count_review_star;

    private String search;
    private String keyword;
    private	String pageNum;
    private int	start;
    private	int end;
}