package com.oracle.hellong.service.sh;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.oracle.hellong.dao.shdao.QBoarddao;
import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.Gym;
import com.oracle.hellong.model.Member;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SHServiceImpl implements SHService {

	private final QBoarddao qd;
	private final DataSource dataSource;

	@Override
	public int totalquestions(int M_NUMBER) {
		System.out.println("SHServiceImpl Start totalquestions...");
		int totQueCnt = qd.totalQue(M_NUMBER);
		System.out.println("SHServiceImpl totalquestions totEmpCnt->" + totQueCnt);
		return totQueCnt;
	}

	// 해당로그인 한계정이 있는지 확인...
	@Override
	public boolean authenticate(String userId) {
		String sql = "SELECT COUNT(*) FROM member WHERE M_ID=?";
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, userId);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return rs.getInt(1) > 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace(); // 실제 애플리케이션에서는 적절한 로깅 및 예외 처리를 해야 합니다.
		}
		return false;
	}

//질문글 리스트
	@Override
	public List<Board> quelist(Board board) {
		System.out.println("SHServiceImpl Start quelist...");
		List<Board> boardList = null;
		boardList = qd.quelist(board);
		System.out.println("SHServiceImpl boardList size-->" + boardList.size());
		return boardList;
	}

//아이디를 회원번호로 바꾸어주는 메서드
	@Override
	public int changeM_num(String member_id) {
		System.out.println("SHServiceImpl Start changeM_num...");
		int m_num = 0;
		m_num = qd.changeNum(member_id);
		System.out.println("SHServiceImpl changeM_num m_num" + m_num);
		return m_num;
	}

//해당 B_NUMBER글 가져오기
	@Override
	public Board boardContent(int b_NUMBER) {
		System.out.println("SHServiceImpl Start boardContent...");
		Board boardContent = null;
		boardContent = qd.ContentBoard(b_NUMBER);
		System.out.println("SHServiceImpl boardContent.size()->" + boardContent);
		return boardContent;
	}

//글추가
	@Override
	public void addAttribute(Board board) {
		System.out.println("SHServiceImpl Start addAttribute...");
		qd.addAttribute(board);

	}

//글삭제
	@Override
	public void delete_que(int bId) {
		System.out.println("SHServiceImpl Start delete_que...");
		qd.delete_que(bId);

	}

//댓글 입력+댓글 카운터 증가
	@Transactional
	@Override
	public void addComment(Board board) {
		System.out.println("SHServiceImpl Start addComment...");
		System.out.println("SHServiceImpl addComment board->>" + board);
		qd.addComment(board);

	}
//입력하자마자 입력한댓글 출력
	@Override
	public Board callComment(Board board) {
		System.out.println("SHServiceImpl Start callComment...");

		Board board2 = qd.callComment(board);
		System.out.println(
				"@SHServiceImpl callComment board2()->" + board2);
		return board2;
	}

// 댓글가져오는...
	@Override
	public List<Board> getComments(int B_NUMBER) {
		System.out.println("SHServiceImpl getComments Start...");
		System.out.println("SHServiceImpl getComments board->>" + B_NUMBER);
		List<Board> boardlist = qd.getComments(B_NUMBER);
		return boardlist;
	}
//댓글삭제
	@Override
	public void deleteComment(int b_number) {
		System.out.println("SHServiceImpl deleteComment Start...");
		qd.deleteComment(b_number);
	}
//글수정
	@Override
	public void updateAttribute(Board board) {
		System.out.println("SHServiceImpl updateAttribute Start...");
		System.out.println("SHServiceImpl updateAttribute board->" + board);
		qd.updateAttribute(board);
	}
//댓글수 확인
	@Override
	public Map<Integer, Integer> getCommentCountsForPosts(List<Board> listBoard) {
		 Map<Integer, Integer> commentCounts = new HashMap<>();
		    for (Board board : listBoard) {
		        int bNumber = board.getB_number();
		        int count = qd.countCommentsByBNumber(bNumber);
		        commentCounts.put(bNumber, count);
		    }
		    return commentCounts;
	}
//관리자 페이지=======================================
	//모든멤버 가져오기
	@Override
	public List<Member> getAllMember() {
		List<Member> getAllMember = qd.getAllMember();
		return getAllMember;
	}
	//모든헬스장 가져오기
	@Override
	public List<Gym> getAllGym() {
		List<Gym> getAllGym= qd.getAllGym();
		return getAllGym;
	}
//모달에 모든멤버 정보를 추가
	@Override
	public Member getMember(int id) {
		Member member =qd.getMember(id);
		return member;
	}
//멤버 등급변경
	@Override
	public void updateMember(int m_number, int admin) {
		System.out.println("SHServiceImpl updateMember  m_number->"+m_number);
		System.out.println("SHServiceImpl updateMember  admin->"+admin);
		qd.updateMember(m_number,admin);
		
	}
//멤저제거
	@Override
	public void deleteMember(int m_number) {
		System.out.println("SHServiceImpl updateMember  m_number->"+m_number);
		qd.deleteMember(m_number);
	}
	//자유글 댓글 구현
	@Override
	public List<Board> getPComments(int b_number) {
		System.out.println("SHServiceImpl getPComments Start!");
		List<Board> boardlist = qd.getPComments(b_number);
		System.out.println("SHServiceImpl getPComments boardlist->"+boardlist);
		return boardlist;
	}

}
