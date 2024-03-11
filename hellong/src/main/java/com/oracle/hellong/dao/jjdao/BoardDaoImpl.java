package com.oracle.hellong.dao.jjdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.Report;

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
		System.out.println("BoardDaoImpl insertBoard board->"+board);

		try {
			result = session.insert("jjinsertBoard", board);
			System.out.println(result);
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
	public int jjReported(Board board) {
		System.out.println("BoardDaoImpl jjReported Start...");
		int result = 0;
		System.out.println("BoardDaoImpl jjReported board->" + board);
		try {
			result = session.update("jjUpReported", board.getB_number());
			System.out.println("BoardDaoImpl jjReported result->"+result);
			int insertReported = session.insert("jjInReported", board);
			System.out.println("BoardDaoImpl jjReported insertReported->" + insertReported);
		} catch(Exception e) {
			System.out.println("BoardDaoImpl jjReported Exception->"+e.getMessage());
		}
		return result;
	}

	@Override
	public List<Board> listCategorySearchBoard(Board board) {
		List<Board> listCategorySearchBoard = null;
		System.out.println("BoardDaoImpl listCategorySearchBoard Start...");
		System.out.println("BoardDaoImpl listCategorySearchBoard board->" + board);
		try {
			listCategorySearchBoard = session.selectList("listCategorySearchBoard", board);
			System.out.println("BoardDaoImpl listCategorySearchBoard->" + listCategorySearchBoard);
		} catch (Exception e) {
			System.out.println("BoardDaoImpl listCategorySearchBoard Exception->" + e.getMessage());
		}
		return listCategorySearchBoard;
	}

	@Override
	public int totalCategorySearchCnt(Board board) {
		int totalCategorySearchCnt = 0;
		System.out.println("BoardDaoImpl totalCategorySearchCnt Start...");
		
		try {
			totalCategorySearchCnt = session.selectOne("totalCategorySearchCnt", board);
			System.out.println("BoardDaoImpl totalCategorySearchCnt ->" + totalCategorySearchCnt);
		} catch (Exception e) {
			System.out.println("BoardDaoImpl totalCategorySearchCnt Exception ->" + e.getMessage());
		}
		return totalCategorySearchCnt;
	}


	
}