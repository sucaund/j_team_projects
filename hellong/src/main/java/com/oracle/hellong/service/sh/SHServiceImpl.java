package com.oracle.hellong.service.sh;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.stereotype.Service;

import com.oracle.hellong.dao.shdao.QBoarddao;
import com.oracle.hellong.model.Board;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SHServiceImpl implements SHService {

	private final QBoarddao qd;
	private final DataSource dataSource;
	
	
	@Override
	public int totalquestions() {
		System.out.println("SHServiceImpl Start totalquestions..." );
		int totQueCnt= qd.totalQue();
		System.out.println("SHServiceImpl totalquestions totEmpCnt->" + totQueCnt);
		return totQueCnt;
	}
	
	

	
	//입력한 id값이 기존 멤버와 일치하는지?
	@Override
	public int sameId(String member_id) {
		System.out.println("SHServiceImpl Start sameId..." );

		int same = qd.sameId(member_id);
		System.out.println("SHServiceImpl sameId same->" + same);

		return same;
	}

	@Override
	public List<Board> quelist(String member_id) {
		System.out.println("SHServiceImpl Start quelist..." );
		List<Board> boardList = null;
		boardList = qd.quelist(member_id);
		System.out.println("SHServiceImpl boardList size-->" + boardList.size());
		return boardList;
	}




	@Override
	public boolean authenticate(String userId, String password) {
        String sql = "SELECT COUNT(*) FROM member WHERE M_ID=? AND M_PW=?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, userId);
            pstmt.setString(2, password);
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


}
