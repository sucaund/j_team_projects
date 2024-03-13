package com.oracle.hellong.dao.hsdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.interceptor.DefaultTransactionAttribute;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.Member;

import lombok.RequiredArgsConstructor;
import oracle.net.aso.b;

@Repository
@RequiredArgsConstructor
public class HSNoticeBoardDaoImpl implements HSNoticeBoardDao {
	
	private final PlatformTransactionManager transactionManager;
	private final SqlSession session;
 
		/* 공지사항 */
	
	// 공지글 리스트
	@Override
	public int totalNoticeBoard() {
		int totNoticeBoardCnt = 0;
		System.out.println("NoticeBoardDaoImpl start total...");
			
		try {
			totNoticeBoardCnt = session.selectOne("com.oracle.hellong.BoardMapper.hsNoticeBoardTotal");
			System.out.println("NoticeBoardDaoImpl totalNoticeBoard totNoticeBoardCnt->" +totNoticeBoardCnt);
		} catch (Exception e) {
			System.out.println("NoticeBoardDaoImpl totalNoticeBoard Exception->" +e.getMessage());
		}
		return totNoticeBoardCnt;
	}

	@Override
	public List<Board> listNoticeBoard(Board board) {
		List<Board> noticeBoardList = null;
		System.out.println("NoticeBoardDaoImpl listNoticeBoard start...");
		try {
			noticeBoardList = session.selectList("hsNoticeBoardListAll", board);
			System.out.println("NoticeBoardDaoImpl listNoticeBoard noticeBoardList.size()->" +noticeBoardList.size());
		} catch (Exception e) {
			System.out.println("NoticeBoardDaoImpl listNoticeBoard e.getMessage()->" +e.getMessage());
		}
		return noticeBoardList;
	}
	
	// 공지글 세부내용 + 조회수 증가
	@Override
	public int updateReadCount(int b_number) {
		System.out.println("NoticeBoardDaoImpl updateReadCount start...");
		int result = 0;
		
		try { 
			result = session.update("hsUpdateNoticeBoardReadCount", b_number);
		} catch (Exception e) {
			System.out.println("NoticeBoardDaoImpl updateReadCount Exception ->" + e.getMessage());
		}
		return result;
	}
	
	@Override
	public Board detailNoticeBoard(int b_number) {
		System.out.println("NoticeBoardDaoImpl detailNoticeBoard start...");
		Board board = new Board();
		
		try {
			board = session.selectOne("hsNoticeBoardSelOne", b_number);
			System.out.println("NoticeBoardDaoImpl detail getB_number()->" +board.getB_number());
		} catch (Exception e) {
			System.out.println("NoticeBoardDaoImpl detai Exception->" + e.getMessage());
		}
		return board;
	}

	// 공지글 작성
	@Override
	public int createNoticeBoard(Board board) {
		int result = 0;
		System.out.println("NoticeBoardDaoImpl createNoticeBoard start...");
		try {
			result = session.insert("hsCreateNoticeBoard", board);
			
			System.out.println("test: " + board);
		} catch (Exception e) {
			System.out.println("NoticeBoardDaoImpl createNoticeBoard Exception ->" + e.getMessage());
		}
		return result;
	}
	
	// 공지글 수정
	@Override
	public int updateNoticeBoard(Board board) {
		System.out.println("NoticeBoardDaoImpl updateNoticeBoard start...");
		int updateCount = 0;
		try {
			updateCount = session.update("hsUpdateNoticeBoard",board);
		} catch (Exception e) {
			System.out.println("NoticeBoardDaoImpl updateNoticeBoard Exception ->" + e.getMessage());
		}
		return updateCount;
	}

	// 공지글 삭제
	@Override
	public int delteNoticeBoard(int b_number) {
		System.out.println("NoticeBoardDaoImpl delteNoticeBoard start...");
		System.out.println("NoticeBoardDaoImpl delte b_number ->" + b_number);
		int result = 0;
		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionAttribute());
		
		try {
			session.delete("hsDeleteScrap", b_number);
			session.delete("hsDeleteNoticeBoard", b_number);
			
			transactionManager.commit(txStatus);
			System.out.println("NoticeBoardDaoImpl delteNoticeBoard result ->" + result);
		} catch (Exception e) {
			System.out.println("NoticeBoardDaoImpl delteNoticeBoard Exception ->" + e.getMessage());
		}
		return result;
	}

	// 공지글 검색
	@Override
	public int condTotalNoticeBoard(Board board) {
		int condTotalBoardCnt = 0;
		System.out.println("NoticeBoardDaoImpl condTotalNoticeBoard start...");
		
		try {
			condTotalBoardCnt = session.selectOne("hsCondTotalNoticeBoardCnt", board);
			System.out.println("NoticeBoardDaoImpl condTotalNoticeBoard condTotalBoardCnt ->" + condTotalBoardCnt);
		} catch (Exception e) {
			System.out.println("NoticeBoardDaoImpl condTotalNoticeBoard Exception ->" + e.getMessage());
		}
		return condTotalBoardCnt;
	}

	@Override
	public List<Board> searchNoticeBoard(Board board) {
		List<Board> searchBoard = null;
		System.out.println("NoticeBoardDaoImpl searchNoticeBoard start...");
		
		try {
			searchBoard = session.selectList("hsSearchNoticeBoard", board);
		} catch (Exception e) {
			System.out.println("NoticeBoardDaoImpl searchNoticeBoard Exception ->" + e.getMessage());
		}
		return searchBoard;
	}

}
