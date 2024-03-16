package com.oracle.hellong.service.dy;

import java.util.List;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.BoardFile;
import com.oracle.hellong.model.Gym;
import com.oracle.hellong.model.GymBoard;
import com.oracle.hellong.model.GymReview;
import com.oracle.hellong.model.Member;
import com.oracle.hellong.model.SearchResults;

public interface DYService {

	int totalBodyProfile();

	List<Board> listBodyProfile(Board board);

	Board selectBodyProfile(int b_number);

	List<Board> listManager();

	int insertBodyProfile(Board board);

	int deleteBodyProfile(int b_number);

	int condTotalBodyProfile(Board board);

	List<Board> listSearchBoard(Board board);

	int insertFileBodyProfile(BoardFile boardFile);
	// 통합검색
	SearchResults totalSearch(Board board, Gym gym, GymBoard gymBoard, GymReview gymReview);

	List<BoardFile> selectBodyProfileFileList(int b_number);

	void deleteFileById(int bf_id);

	List<BoardFile> listFileBodyProfile(BoardFile boardFile);

	void dyUpdateBodyProfile(Board board);
	
	// 마이페이지 작성글
	List<Board> myPageBoardList(Board board);
	
	// 게시판 내 파일 검색
	List<BoardFile> listSearchBoardFileByBoardId(int b_number);
	
	// 게시글 신고
	int dyReported(Board board);
	// 게시글 조회수 증가
	void increaseReadCount(int b_number);

	int checkRecommendation(int m_number, int b_number);






	
}
