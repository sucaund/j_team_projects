package com.oracle.hellong.dao.dydao;

import java.util.List;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.Common;

public interface DYBoardDao {

	int totalBodyProfile();

	List<Board> listBodyProfile(Board board);

	Board selectBodyProfile(int b_number);

	void dyUpdateBodyProfile(Board board);

	List<Board> listManager();

	int insertBodyProfile(Board board);

	int deleteBodyProfile(int b_number);

	int condTotalBodyProfile(Board board);
	// 
	List<Board> boardSearchList(Board board);
	// 게시판 내 검색기능
	List<Board> searchBoards(Board board);

	// 마이페이지 게시글 조회
	List<Board> searchMyPageList(Board board);

	// 조회수
	void increaseReadCount(int b_number);

	// 추천
	void increaseRecommCount(int b_number);

	// 신고
	int dyReported(Board board);

	List<Common> commonList(Common common);

	List<Board> getPComments(int b_number);

	Board callComment(Board board);

}