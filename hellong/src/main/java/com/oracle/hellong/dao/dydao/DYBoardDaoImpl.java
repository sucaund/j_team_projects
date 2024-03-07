package com.oracle.hellong.dao.dydao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.Board;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class DYBoardDaoImpl implements DYBoardDao {

	private final SqlSession session;

	@Override
	public int totalBodyProfile() {
		int totBodyProfileCnt = 0;
		System.out.println("DYBoardDaoImpl Start total...");

		try {
			totBodyProfileCnt = session.selectOne("dyBoardTotal");
			System.out.println("DYBoardDaoImpl totalBodyProfile totBodyProfileCnt -> " + totBodyProfileCnt);
		} catch (Exception e) {
			System.out.println("Exception-> " + e.getMessage());
		}
		return totBodyProfileCnt;
	}

	@Override
	public List<Board> listBodyProfile(Board board) {
		List<Board> bodyProfileList = null;
		System.out.println("DYBoardDaoImpl listBodyProfile Start..");
		try {
			bodyProfileList = session.selectList("dyBodyProfileListAll", board);
			System.out.println("DYBoardDaoImpl listBodyProfile bodyProfileList.size()-> " + bodyProfileList.size());
		} catch (Exception e) {
			System.out.println("DYBoardDaoImpl e.getMessage()-> " + e.getMessage());
		}
		return bodyProfileList;
	}

	@Override
	public Board selectBodyProfile(int b_number) {
		System.out.println("DYBoardDaoImpl select Start...");
		Board board = new Board();
		try {
			board = session.selectOne("dyBoardSelect", b_number);
			System.out.println("DYBoardDaoImpl select getB_num -> " + board.getB_number());
		} catch (Exception e) {
			System.out.println("DYBoardDaoImpl select Exception -> "+e.getMessage());
		}
		return board;
	}

	@Override
	public int dyUpdateBodyProfile(Board board) {
		System.out.println("DYBoardDaoImpl Update Start...");
		System.out.println("DYBoardDaoImpl dyUpdateBodyProfile  board->"+board);
		int updateCount = 0;
		try {
			updateCount = session.update("dyBodyProfileUpdate", board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return updateCount;
	}

	@Override
	public List<Board> listManager() {
		List<Board> boaList = null;
		System.out.println("DYBoardDaoImpl listManager Start...");
		try {
			boaList = session.selectList("dySelectManager");
		} catch (Exception e) {
			System.out.println("DYBoardDaoImpl listManager Exception -> " + e.getMessage());
		}
		return boaList;
	}

	@Override
	public int insertBodyProfile(Board board) {
		int result = 0;
		System.out.println("DYBoardDaoImpl Insert Start...");
		try {
			result = session.insert("dyInsertBodyProfile", board);
			System.out.println("DYBoardDaoImpl dyInsertBodyProfile"+ board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteBodyProfile(int b_number) {
		System.out.println("DYBoardDaoImpl delete Start...");
		int result = 0;
		System.out.println("DYBoardDaoImpl delete b_num -> " + b_number);
		try {
			result = session.delete("dyDeleteBodyProfile", b_number);
			System.out.println("dyDaoImpl delete result->" + result);
		} catch (Exception e) {
			System.out.println("dyDaoImpl delete Exception-> " + e.getMessage());
		}
		return result;
	}

	@Override
	public int condTotalBodyProfile(Board board) {
		int totBodyProfileCount = 0;
		System.out.println("dyDaoImpl condTotalBodyProfile Start..");
		
		try {
			totBodyProfileCount = session.selectOne("dyCondBodyProfileTotal", board);
			System.out.println("dyDaoImpl totalBodyProfile totBodyProfileCount -> " + totBodyProfileCount);
		} catch (Exception e) {
			System.out.println("dyDaoImpl totalBodyProfile Exception -> " + e.getMessage());
		}
		return totBodyProfileCount;
	}

	@Override
	public List<Board> boardSearchList(Board board) {
		List<Board> boardSearchList = null;
		System.out.println("dyDaoImpl boardSearchList Start...");
		System.out.println("dyDaoImpl boardSearchList board->"+board);
		try {
			boardSearchList = session.selectList("dyBoardSearchList", board);
			System.out.println("boardSearchList "+ boardSearchList);
		} catch (Exception e) {
			System.out.println("dyDaoImpl listBoard Exception -> " + e.getMessage());
		}
		return boardSearchList;
	}

}
