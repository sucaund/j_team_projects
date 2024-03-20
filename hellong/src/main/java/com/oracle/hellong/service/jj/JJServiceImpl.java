package com.oracle.hellong.service.jj;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.hellong.dao.jjdao.BoardDao;
import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.Common;
import com.oracle.hellong.model.RecommCheck;

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
		System.out.println("JJServiceImpl insertBoard result->" + result);
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
	public int jjReported(Board board) {
		int result = 0;
		System.out.println("JJServiceImpl jjReported Start...");
		result = bd.jjReported(board);
		return result;
	}

	@Override
	public List<Board> listCategorySearchBoard(Board board) {
		List<Board> listCategorySearchBoard = null;
		System.out.println("JJServiceImpl listCategorySearchBoard Start...");
		listCategorySearchBoard = bd.listCategorySearchBoard(board);
		System.out.println("JJServiceImpl listCateBoard.()->" + listCategorySearchBoard.size());
		return listCategorySearchBoard;
	}

	@Override
	public int totalCategorySearchCnt(Board board) {
		System.out.println("JJServiceImpl totalCategorySearchCnt Start...");
		int totalCategorySearchCnt = bd.totalCategorySearchCnt(board);
		return totalCategorySearchCnt;
	}

	@Override
	public List<Common> commonList(Common common) {
		List<Common> commonList = null;
		System.out.println("JJServiceImpl commonList Start...");
		commonList = bd.commonList(common);
		System.out.println("JJServiceImpl commonList.size()->"+commonList.size());
		return commonList;
	}

	@Override
	public String recommendBoard(int b_number, int m_number) {
		RecommCheck check = bd.checkRecomm(b_number, m_number);
	       if (check != null) {
	           return "이미 추천하셨습니다.";
	       }
	       RecommCheck rec = new RecommCheck();
	       // 객체의 필드에 값을 설정하는 부분
	       rec.setB_number(b_number);
	       rec.setM_number(m_number);
	       rec.setRc_isrecomm(1); // 추천 상태 설정
	       bd.insertRecomm(rec); // 수정된 부분
	       bd.increaseRecommCount(b_number);
	       return "추천되었습니다.";

	}

	@Override
	public int recommandCount(int b_number) {
		int recommandCount = 0;
		System.out.println("JJServiceImpl recommandCount Start!");
		recommandCount = bd.recommandCount(b_number);
		System.out.println("JJServiceImpl recommandCount recommandCount->"+recommandCount);
		return recommandCount;
	}

	@Override
	public List<Board> getPComments(int b_number) {
		System.out.println("JJServiceImpl getPComments Start!");
		List<Board> boardlist = bd.getPComments(b_number);
		System.out.println("JJServiceImpl getPComments boardlist->"+boardlist);
		return boardlist;
	}

	@Override
	public int jschangeM_num(String member_id) {
		System.out.println("JJServiceImpl jschangeM_num Start...");
		int m_num = 0;
		m_num = bd.jschangeNum(member_id);
		System.out.println("JJServiceImpl jschangeM_num m_num" + m_num);
		return m_num;
	}

	@Override
	public void jjAddComment(Board board) {
		System.out.println("SHServiceImpl Start addComment...");
		System.out.println("SHServiceImpl addComment board->>" + board);
		bd.jjAddComment(board);
		
	}

	@Override
	public Board jsCallComment(Board board) {
		System.out.println("JJServiceImpl jsCallComment Start...");
		Board board2 = bd.jsCallComment(board);
		System.out.println("JJServiceImpl jsCallComment board2()->" + board2);
		return board2;
	}

	@Override
	public void jsDeleteComment(int b_number) {
		System.out.println("SHServiceImpl deleteComment Start...");
		bd.jsDeleteComment(b_number);
	}


}