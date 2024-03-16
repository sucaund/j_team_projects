package com.oracle.hellong.service.jj;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.hellong.dao.jjdao.BoardDao;
import com.oracle.hellong.model.Board;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class JJServiceImpl implements JJService {
	
	private final BoardDao bd;
	
	@Override
	public int totalBoard() {
		System.out.println("JJServiceImpl totalBoard Start...");
		int totBoardCnt = bd.totalBoard();
		System.out.println("JJServiceImpl totalBoard totBoardCnt->" + totBoardCnt);
		return totBoardCnt;
	}

	@Override
	public List<Board> listBoard(Board board) {
		List<Board> listBoard = null;
		System.out.println("JJServiceImpl listBoard Start...");
		listBoard = bd.listBoard(board);
		System.out.println("JJServiceImpl listBoard listBoard.size()->" + listBoard.size());
		return listBoard;
	}

	@Override
	public Board detailBoard(int b_number) {
		System.out.println("JJServiceImpl detailBoard...");
		Board board = null;
		board = bd.detailBoard(b_number);
		return board;
	}

	@Override
	public int updateBoard(Board board) {
		System.out.println("JJServiceImpl updateBoard...");
		int updateCount = 0;
		updateCount = bd.updateBoard(board);
		return updateCount;
	}

	@Override
	public List<Board> listManager() {
		List<Board> listManager = null;
		System.out.println("JJServiceImpl listManager Start...");
		listManager = bd.listManager();
		System.out.println("JJServiceImpl listManager listManager.size()--->" + listManager.size());
		return listManager;
	}

	@Override
	public int insertBoard(Board board) {
		int result = 0;
		System.out.println("JJServiceImpl insertBoard Start...");
		result = bd.insertBoard(board);
		return result;
	}

	@Override
	public int deleteBoard(int b_number) {
		int result = 0;
		System.out.println("JJServiceImpl deleteBoard Start...");
		result = bd.deleteBoard(b_number);
		return result;
	}

	@Override
	public int HitCnt(int b_number) {
		int result = 0;
		System.out.println("JJServiceImpl HitCnt Start...");
		result = bd.hitCnt(b_number);
		return result;
	}

}
