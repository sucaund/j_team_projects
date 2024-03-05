package com.oracle.hellong.dao.shdao;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.Gym;
import com.oracle.hellong.model.Member;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class QBoarddaoImpl implements QBoarddao {
	private final PlatformTransactionManager transactionManager;
	private final SqlSession session;

	@Override
	public int totalQue(int M_NUMBER) {
		int totQueCount = 0;
		System.out.println("QBoarddaoImpl Start totalQue...");

		try {
			totQueCount = session.selectOne("boardTotal", M_NUMBER);

		} catch (Exception e) {
			System.out.println("QBoarddaoImpl totalQue Exception->" + e.getMessage());
		}
		return totQueCount;
	}

	// 해당아이디 문의글만 가져오기
	@Override
	public List<Board> quelist(Board board) {
		System.out.println("QBoarddaoImpl quelist start...?");
		System.out.println("QBoarddaoImpl quelist member_id->" + board);
		List<Board> listque = null;
		try {
			listque = session.selectList("samequeboard", board);
			System.out.println("QBoarddaoImpl quelist listque.size()-->" + listque.size());
		} catch (Exception e) {
			System.out.println("여가 이상한거같습니데이 QBoarddaoImpl quelist e.getMessage()->" + e.getMessage());
		}
		return listque;
	}

// 해당아이디 회원번호로 변경
	@Override
	public int changeNum(String member_id) {
		System.out.println("멤버 교체쿼리 QBoarddaoImpl changeNum start...");
		System.out.println("QBoarddaoImpl changeNum member_id()->" + member_id);
		int NumChange = 0;
		try {
			NumChange = session.selectOne("NumChangeNum", member_id);
			System.out.println("QBoarddaoImpl changeNum NumChange->" + NumChange);
		} catch (Exception e) {
			System.out.println("QBoarddaoImpl changeNum e.getMessage()->" + e.getMessage());
		}
		return NumChange;
	}

//열람할 글 목록 가져오기...
	@Override
	public Board ContentBoard(int b_NUMBER) {
		System.out.println("QBoarddaoImpl ContentBoard b_NUMBER()->" + b_NUMBER);
		Board ContentBoard = null;
		try {
			ContentBoard = session.selectOne("ContentBoard", b_NUMBER);
			System.out.println("QBoarddaoImpl ContentBoard ContentBoard.size()->" + ContentBoard);
		} catch (Exception e) {
			System.out.println("QBoarddaoImpl ContentBoard e.getMessage()->" + e.getMessage());
		}
		return ContentBoard;
	}

	@Override
	public void addAttribute(Board board) {
		System.out.println("QBoarddaoImpl addAttribute board ->" + board);
		try {
			session.insert("Queinsert", board);
		} catch (Exception e) {
			System.out.println("QBoarddaoImpl addAttribute e.getMessage()->" + e.getMessage());
		}

	}

//삭제(두개의 쿼리문을 사용함으로)
	@Override
	public void delete_que(int bId) {
		System.out.println("QBoarddaoImpl addAttribute delete_que ->" + bId);
		TransactionStatus txStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());
		try {
			session.delete("SCRAP_delete", bId);
			session.delete("REPORT_delete", bId);
			session.delete("COMM_delete", bId);
			session.delete("que_delete", bId);
			transactionManager.commit(txStatus);

		} catch (Exception e) {
			System.out.println("QBoarddaoImpl delete_que e.getMessage()->" + e.getMessage());
			transactionManager.rollback(txStatus);
		}

	}

//댓글을 입력하고 가져오기
	@Override
	public void addComment(Board board) {
		System.out.println("QBoarddaoImpl addComment start...");
		System.out.println("QBoarddaoImpl addComment board ->" + board);
		try {
			
			session.insert("addComment", board);
			System.out.println("QBoarddaoImpl addComment board insert!!!");
		} catch (Exception e) {
			System.out.println("QBoarddaoImpl addComment e.getMessage()->" + e.getMessage());
		}	
		} 


	@Override
	public Board callComment(Board board) {
		Board board2 = session.selectOne("callComment", board);
		return board2;
	}

//댓글 초기에 가져오기
	@Override
	public List<Board> getComments(int B_NUMBER) {
		System.out.println("QBoarddaoImpl getComments board ->" + B_NUMBER);
		List<Board> boardlist = null;
		try {
			boardlist = session.selectList("getComments", B_NUMBER);
		} catch (Exception e) {
			System.out.println("QBoarddaoImpl addComment e.getMessage()->" + e.getMessage());
		}
		return boardlist;
	}

	@Override
	public void deleteComment(int b_number) {
		System.out.println("QBoarddaoImpl deleteComment b_number ->" + b_number);
		try {
			session.delete("deleteComment",b_number);
		} catch (Exception e) {
			System.out.println("QBoarddaoImpl deleteComment e.getMessage()->" + e.getMessage());
		}
	}
//질문글 수정하기
	@Override
	public void updateAttribute(Board board) {
		System.out.println("QBoarddaoImpl updateAttribute board ->" + board);
		try {
			session.update("updateAttribute", board);
		} catch (Exception e) {
			System.out.println("QBoarddaoImpl updateAttribute e.getMessage()->" + e.getMessage());
		}
		
	}

	@Override
	public int countCommentsByBNumber(int bNumber) {
		System.out.println("QBoarddaoImpl countCommentsByBNumber bNumber ->" + bNumber);
		int count = 0;
		try {
			count =  session.selectOne("countCommentsByBNumber", bNumber);
		} catch (Exception e) {
			System.out.println("QBoarddaoImpl countCommentsByBNumber e.getMessage()->" + e.getMessage());
		}
		return count;
	}

//관리자 페이지!!!!==============================================
	@Override
	public List<Member> getAllMember() {
		List<Member> getAllMember = null;
		try {
			getAllMember =session.selectList("getAllMember");
		} catch (Exception e) {
			System.out.println("QBoarddaoImpl getAllMember e.getMessage()->" + e.getMessage());
		}
		return getAllMember;
	}
//특정멤버 정보 취득
	@Override
	public Member getMember(int id) {
		Member member = null;
		System.out.println("QBoarddaoImpl getMember id ->" + id);
		try {
			member = session.selectOne("getMember", id);
		} catch (Exception e) {
			System.out.println("QBoarddaoImpl getMember e.getMessage()->" + e.getMessage());
		}
		return member;
	}
	@Override
	public List<Gym> getAllGym() {
		List<Gym> getAllGym = null;
		try {
			getAllGym =session.selectList("getAllGym");
		} catch (Exception e) {
			System.out.println("QBoarddaoImpl getAllMember e.getMessage()->" + e.getMessage());
		}
		return getAllGym;
	}

	@Override
	public void updateMember(int m_number, int admin) {
		try {
			Map<String, Object> params = new HashMap<>();
	        params.put("m_number", m_number);
	        params.put("admin", admin);
			session.update("updateMember",params);
		} catch (Exception e) {
			System.out.println("QBoarddaoImpl updateMember e.getMessage()->" + e.getMessage());
		}
		
	}

	@Override
	public void deleteMember(int m_number) {
		try {
			session.update("deleteMember", m_number);
		} catch (Exception e) {
			System.out.println("QBoarddaoImpl updateMember e.getMessage()->" + e.getMessage());

		}
		
	}

}
