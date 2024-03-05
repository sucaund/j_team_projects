package com.oracle.hellong.service.dy;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.hellong.dao.dydao.DYBoardDao;
import com.oracle.hellong.model.Board;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DYServiceImpl implements DYService {
	
	private final DYBoardDao dybd;

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



	
	



}
