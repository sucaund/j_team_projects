package com.oracle.hellong.dao.jjdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.Board;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BoardDaoImpl implements BoardDao {

	// Mybatis DB 연동
	private final SqlSession session;
	
	@Override
	public int totalBoard() {
		int totBoardCount = 0;
		System.out.println("BoardDaoImpl totalBoard Start...");
		
		try {
			totBoardCount = session.selectOne("com.oracle.hellong.BoardMapper.boardTotal");
			System.out.println("BoardDaoImpl totalBoard totBoardCount->" + totBoardCount);
		} catch (Exception e) {
			System.out.println("BoardDaoImpl totalBoard Exception->" + e.getMessage());
		}
		return totBoardCount;
	}

	@Override
	public List<Board> listBoard(Board board) {
		List<Board> listBoard = null;
		System.out.println("BoardDaoImpl listBoard Start...");
		try {
			listBoard = session.selectList("jjBoardListAll", board);
			System.out.println("BoardDaoImpl listBoard listBoard.size()->" + listBoard.size());
		} catch (Exception e) {
			System.out.println("BoardDaoImpl listBoard e.getMessage()->" + e.getMessage());
		}
		return listBoard;
	}

	@Override
	public Board detailBoard(int b_number) {
		System.out.println("BoardDaoImpl detailBoard start..");
		Board board = new Board();
		try {
			int updateCount = session.update("plusCnt", b_number);
			System.out.println("BoardDaoImpl updateCount--->" + updateCount);
			board = session.selectOne("jjBoardOne", b_number);
			System.out.println("BoardDaoImpl detailBoard getB_number--->"+board.getB_number());
		} catch (Exception e) {
			System.out.println("BoardDaoImpl detailBoard Exception->"+e.getMessage());
		}
		
		return board;
	}

	@Override
	public int updateBoard(Board board) {
		System.out.println("BoardDaoImpl updateBoard start...");
		int updateCount = 0;
		try {
			System.out.println("BoardDaoImpl updateBoard board->"+board);

			updateCount = session.update("jjBoardUpdate",board);
		} catch (Exception e) {
			System.out.println("BoardDaoImpl updateBoard Exception--->"+e.getMessage());
		}
		return updateCount;
	}

	@Override
	public List<Board> listManager() {
		List<Board> listManager = null;
		System.out.println("BoardDaoImpl listManager Start...");
		try {
			listManager = session.selectList("jjSelectManager");
		} catch (Exception e) {
			System.out.println("BoardDaoImpl listManager Exception--->" + e.getMessage());
		}
		return listManager;
	}

	@Override
	public int insertBoard(Board board) {
		int result = 0;
		System.out.println("BoardDaoImpl insertBoard Start...");
		try {
			result = session.insert("jjinsertBoard", board);
		} catch (Exception e) {
			System.out.println("BoardDaoImpl insertBoard Exception--->" + e.getMessage());
		}
		return result;
	}

	@Override
	public int deleteBoard(int b_number) {
		System.out.println("BoardDaoImpl deleteBoard Start...");
		int result = 0;
		System.out.println("BoardDaoImpl deleteBoard b_number--->" + b_number);
		try {
			result = session.delete("deleteBoard", b_number);
			System.out.println("BoardDaoImpl deleteBoard result--->" + result);
		} catch (Exception e) {
			System.out.println("BoardDaoImpl deleteBoard Exception--->" + e.getMessage());
		}
		return result;
	}

	@Override
	public int hitCnt(int b_number) {
		System.out.println("BoardDaoImpl hitCnt Start...");
		int result = 0;
		System.out.println("BoardDaoImpl hitCnt b_number--->" + b_number);
		try {
			result = session.update("hitCnt", b_number);
			System.out.println("BoardDaoImpl hitCnt result--->" + result);
		} catch(Exception e) {
			System.out.println("BoardDaoImpl hitCnt Exception--->" + e.getMessage());
		}
		return result;
	}

	@Override
	public int totalSearchCnt(Board board) {
		int totalSearchCnt = 0;
		System.out.println("BoardDaoImpl totalSearchCnt Start...");
		
		try {
			totalSearchCnt = session.selectOne("totalSearchCnt", board);
			System.out.println("BoardDaoImpl totalSearchCnt ->" + totalSearchCnt);
		} catch (Exception e) {
			System.out.println("BoardDaoImpl totalSearchCnt Exception ->" + e.getMessage());
		}
		return totalSearchCnt;
	}
	
	@Override
	public List<Board> boardSearchList(Board board) {
		List<Board> boardSearchList = null;
		System.out.println("BoardDaoImpl boardSearchList Start");
		System.out.println("BoardDaoImpl boardSearchList board->"+board);
		try {
			boardSearchList = session.selectList("jjBoardSearchList", board);
			System.out.println("BoardDaoImpl boardSearchList->" + boardSearchList);
		} catch (Exception e) {
			System.out.println("BoardDaoImpl boardSearchList Exception ->" + e.getMessage());
		}
		return boardSearchList;
	}

	@Override
	public int jjReported(int b_number) {
		System.out.println("BoardDaoImpl jjReported Start...");
		int result = 0;
		System.out.println("BoardDaoImpl jjReported b_number->" + b_number);
		try {
			result = session.update("jjReported", b_number);
			System.out.println("BoardDaoImpl jjReported result->"+result);
		} catch(Exception e) {
			System.out.println("BoardDaoImpl jjReported Exception->"+e.getMessage());
		}
		return result;
	}


	
}
