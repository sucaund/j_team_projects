package com.oracle.hellong.service.sh;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.hellong.dao.shdao.QBoarddao;
import com.oracle.hellong.model.Board;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SHServiceImpl implements SHService {

	private final QBoarddao qd;

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


}
