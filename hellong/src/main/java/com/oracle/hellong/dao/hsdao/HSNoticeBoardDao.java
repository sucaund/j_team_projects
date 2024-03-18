package com.oracle.hellong.dao.hsdao;

import java.util.List;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.Member;

public interface HSNoticeBoardDao {
	
		/* 공지사항 */

	// 공지글 리스트
	
	int totalNoticeBoard();

	List<Board> listNoticeBoard(Board board);

	// 공지글 세부내용 + 조회수 증가
	
	int updateReadCount(int b_number);
	
	Board detailNoticeBoard(int b_number);
	
	// 공지글 작성

	int createNoticeBoard(Board board);

	// 공지글 수정
	
	int updateNoticeBoard(Board board);

	// 공지글 삭제
	
	int delteNoticeBoard(int b_number);
	
	// 공지글 검색
	
	int condTotalNoticeBoard(Board board);

	List<Board> searchNoticeBoard(Board board);

}