package com.oracle.hellong.service.dy;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.hellong.dao.dydao.DYBoardDao;
import com.oracle.hellong.dao.dydao.DYBoardFileDao;
import com.oracle.hellong.dao.dydao.DYGymBoardDao;
import com.oracle.hellong.dao.dydao.DYGymDao;
import com.oracle.hellong.dao.dydao.DYGymReviewDao;
import com.oracle.hellong.dao.dydao.DYMemberDao;
import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.BoardFile;
import com.oracle.hellong.model.Gym;
import com.oracle.hellong.model.GymBoard;
import com.oracle.hellong.model.GymReview;
import com.oracle.hellong.model.Member;
import com.oracle.hellong.model.SearchResults;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DYServiceImpl implements DYService {

	private final DYBoardDao dybd;
	private final DYBoardFileDao dybfd;
	private final DYGymDao dygd;
	private final DYGymBoardDao dygbd;
	private final DYMemberDao dymd;
	private final DYGymReviewDao dygrd;

	@Override
	public int totalBodyProfile() {
		System.out.println("DYServiceImpl Start total...");
		int totBodyProfileCnt = dybd.totalBodyProfile();
		System.out.println("DYServiceImpl totalBodyProfile totBodyProfileCnt->" + totBodyProfileCnt);
		return totBodyProfileCnt;
	}

	@Override
	public List<Board> listBodyProfile(Board board) {
		List<Board> bodyProfileList = null;
		System.out.println("DYServiceImpl listManager Start...");
		bodyProfileList = dybd.listBodyProfile(board);
		return bodyProfileList;
	}
	@Override
	public List<BoardFile> listFileBodyProfile(BoardFile boardFile) {
		List<BoardFile> bodyProfileFileList = null;
		bodyProfileFileList = dybfd.listFileBodyProfile(boardFile);
		return bodyProfileFileList;
	}

	@Override
	public Board selectBodyProfile(int b_number) {
		System.out.println("DYServiceImpl select...");
		Board board = null;
		board = dybd.selectBodyProfile(b_number);
		return board;
	}
	
	@Override
	public List<BoardFile> selectBodyProfileFileList(int b_number) {
		List<BoardFile> boardFileList = null;
		boardFileList = dybfd.selectBodyProfileFileList(b_number);
		return boardFileList;
	}

	@Override
	public List<Board> listManager() {
		List<Board> boardList = null;
		System.out.println("DYServiceImpl listManager Start..");
		boardList = dybd.listManager();
		System.out.println("DYServiceImpl boardList.size() -> " + boardList.size());
		return boardList;
	}
	// 게시글 업데이트 
	@Override
	public void dyUpdateBodyProfile(Board board) {
		dybd.dyUpdateBodyProfile(board);
		
	}

	@Override
	public int insertBodyProfile(Board board) {
		int result = 0;
		System.out.println("DYServiceImpl Insert Start..");
		result = dybd.insertBodyProfile(board);
		return result;
	}

	@Override
	public int insertFileBodyProfile(BoardFile boardFile) {
		int result = 0;
		System.out.println("DYServiceImpl Insert BoardFile Start.." + boardFile);
		result = dybfd.insertFileBodyProfile(boardFile);
		return result;
	}
	// 게시글 삭제
	@Override
	public int deleteBodyProfile(int b_number) {
		int result = 0;
		System.out.println("DYServiceImpl delete Start..");
		result = dybd.deleteBodyProfile(b_number);
		return result;
	}
	// 게시글 파일 삭제
	@Override
	public void deleteFileById(int bf_id) {
		dybfd.deleteFileById(bf_id);
		
	}

	@Override
	public int condTotalBodyProfile(Board board) {
		System.out.println("DYServiceImpl total Start...");
		int totBodyProfileCnt = dybd.condTotalBodyProfile(board);
		System.out.println("DYServiceImpl totBodyProfileCnt -> " + totBodyProfileCnt);
		return totBodyProfileCnt;
	}

	@Override
	public List<Board> listSearchBoard(Board board) {
		List<Board> boardSearchList = null;
		System.out.println("DYServiceImpl listBoard Start...");
		boardSearchList = dybd.boardSearchList(board);
		System.out.println("DYServiceImpl boardSearchList.size() -> " + boardSearchList.size());
		return boardSearchList;
	}

	@Override
	public SearchResults totalSearch(Board board, Gym gym, GymBoard gymBoard, GymReview gymReview) {
		SearchResults result = new SearchResults();

		// 게시글 검색
		List<Board> boardResults = dybd.searchBoards(board);
		result.setBoardResults(boardResults);

		// 체육관 검색
		List<Gym> gymResults = dygd.searchGyms(gym);
		result.setGymResults(gymResults);

		// 체육관 게시글 검색
		List<GymBoard> gymBoardResults = dygbd.searchGymBoards(gymBoard);
		result.setGymBoardResults(gymBoardResults);

		// 체육관 리뷰 검색
		List<GymReview> gymReviewResults = dygrd.searchGymReviews(gymReview);
		result.setGymReviewResults(gymReviewResults);

		return result;
	}
	
	// 마이페이지 작성글 조회
	@Override
	public List<Board> myPageBoardList(Board board) {
		List<Board> myPageList = null;
		myPageList = dybd.searchMyPageList(board);
		System.out.println("DYServiceImpl myPageList.size -> " + myPageList.size());
		return myPageList;
	}

	
	// 게시판 내 파일 검색
	@Override
	public List<BoardFile> listSearchBoardFileByBoardId(int b_number) {
		List<BoardFile> listSearchBoardFileByBoardId = null;
		listSearchBoardFileByBoardId = dybfd.listSearchBoardFileByBoardId(b_number);
		return listSearchBoardFileByBoardId;
	}

	// 게시글 조회수 증가
	@Override
	public void increaseReadCount(int b_number) {
		dybd.increaseReadCount(b_number);
		
	}

	@Override
	public int dyReported(Board board) {
		// TODO Auto-generated method stub
		return 0;
	}


}