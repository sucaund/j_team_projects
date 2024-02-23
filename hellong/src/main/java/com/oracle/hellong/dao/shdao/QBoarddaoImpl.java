package com.oracle.hellong.dao.shdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.Board;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class QBoarddaoImpl implements QBoarddao {

	private final SqlSession session;
	
	@Override
	public int totalQue() {
		int totQueCount=0;
		System.out.println("QBoarddaoImpl Start totalQue..." );

		try {
			totQueCount = session.selectOne("boardTotal");

		} catch (Exception e) {
			System.out.println("QBoarddaoImpl totalQue Exception->"+e.getMessage());
		}
		return totQueCount;
	}


	//입력id와 기존 id비교 ...
	@Override
	public int sameId(String member_id) {
		int IdSame = 0;
		try {
			System.out.println("QBoarddaoImpl sameId member_id->"+member_id);
			IdSame = session.selectOne("checkMemberIdExists",member_id);
			System.out.println("QBoarddaoImpl sameId IdSame->"+IdSame);

		} catch (Exception e) {
			System.out.println("마! 여기가 문제네요 QBoarddaoImpl sameId e.getMessage()->"+e.getMessage());
		}
		return IdSame;
	}

	//해당아이디 문의글만 가져오기
	@Override
	public List<Board> quelist(Board board) {
		System.out.println("QBoarddaoImpl quelist start...?");
		System.out.println("QBoarddaoImpl quelist member_id->"+board);
		List<Board> listque = null;
		try {
			listque =session.selectList("samequeboard",board);
			System.out.println("QBoarddaoImpl quelist listque.size()-->"+listque.size());
		} catch (Exception e) {
			System.out.println("QBoarddaoImpl quelist e.getMessage()->"+e.getMessage());
		}
		return listque;
	}

}
