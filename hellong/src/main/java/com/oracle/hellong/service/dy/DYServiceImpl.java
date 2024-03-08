package com.oracle.hellong.service.dy;

import java.util.List;

import org.springframework.stereotype.Service;

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
//	@Override
//	public List<BoardFile> listFileBodyProfile(BoardFile boardFile) {
//		List<BoardFile> bodyProfileFileList = null;
//		bodyProfileFileList = dybfd.listFileBodyProfile(boardFile);
//		return bodyProfileFileList;
//	}

	@Override
	public Board selectBodyProfile(int b_number) {
		System.out.println("DYServiceImpl select...");
		Board board = null;
		board = dybd.selectBodyProfile(b_number);
		return board;
	}

	@Override
	public int dyUpdateBodyProfile(Board board) {
		System.out.println("DYServiceImpl Update...");
		int updateCount = 0;
		updateCount = dybd.dyUpdateBodyProfile(board);
		return updateCount;
	}

	@Override
	public List<Board> listManager() {
		List<Board> boardList = null;
		System.out.println("DYServiceImpl listManager Start..");
		boardList = dybd.listManager();
		System.out.println("DYServiceImpl boardList.size() -> " + boardList.size());
		return boardList;
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

	@Override
	public int deleteBodyProfile(int b_number) {
		int result = 0;
		System.out.println("DYServiceImpl delete Start..");
		result = dybd.deleteBodyProfile(b_number);
		return result;
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

}
