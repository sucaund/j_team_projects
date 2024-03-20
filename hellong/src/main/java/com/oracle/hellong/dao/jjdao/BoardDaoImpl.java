package com.oracle.hellong.dao.jjdao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.Common;
import com.oracle.hellong.model.RecommCheck;
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
			System.out.println("BoardDaoImpl detailBoard board--->"+board);
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

	@Override
	public List<Common> commonList(Common common) {
		List<Common> commonList = null;
		System.out.println("BoardDaoImpl commonList Start!");
		System.out.println("BoardDaoImpl commonList common->"+common);
		try {
			commonList = session.selectList("commonList", common);
			System.out.println("BoardDaoImpl commonList->"+commonList);
		} catch (Exception e) {
			System.out.println("BoardDaoImpl commonList Exception->" + e.getMessage());
		}
		return commonList;
	}

	@Override
	public RecommCheck checkRecomm(int b_number, int m_number) {
		Map<String, Object> params = new HashMap<>();
        params.put("b_number", b_number);
        params.put("m_number", m_number);
       
        return session.selectOne("jjCheckRecomm", params);
	}

	@Override
	public void insertRecomm(RecommCheck rec) {
		session.insert("jjInsertRecomm", rec);
		
	}

	@Override
	public void increaseRecommCount(int b_number) {
		session.update("jjIncreaseRecommCount", b_number);
		
	}

	@Override
	public int recommandCount(int b_number) {
		int recommandCount = 0;
		System.out.println("BoardDaoImpl recommandCount Start!");
		try { 
			recommandCount = session.selectOne("jjRecommandCount", b_number);
			System.out.println("BoardDaoImpl recommandCount recommandCount->"+recommandCount);
		} catch (Exception e) {
			System.out.println("BoardDaoImpl recommandCount Exception->" + e.getMessage());
		}
		return recommandCount;
	}

	@Override
	public List<Board> getPComments(int b_number) {
		System.out.println("BoardDaoImpl getPComments Start!");
		List<Board> boardlist = null;
		try {
			boardlist = session.selectList("jjGetPComments", b_number);
		} catch (Exception e) {
			System.out.println("BoardDaoImpl getPComments Exception->" + e.getMessage());
		}
		return boardlist;
	}

	@Override
	public int jschangeNum(String member_id) {
		System.out.println("BoardDaoImpl jschangeNum start...");
		System.out.println("BoardDaoImpl jschangeNum member_id()->" + member_id);
		int NumChange = 0;
		try {
			NumChange = session.selectOne("jjNumChangeNum", member_id);
			System.out.println("BoardDaoImpl jschangeNum NumChange->" + NumChange);
		} catch (Exception e) {
			System.out.println("BoardDaoImpl jschangeNum e.getMessage()->" + e.getMessage());
		}
		return NumChange;
	}

	@Override
	public void jjAddComment(Board board) {
		System.out.println("BoardDaoImpl jjAddComment start...");
		System.out.println("BoardDaoImpl jjAddComment board ->" + board);
		try {
			
			session.insert("jjAddComment", board);
			System.out.println("BoardDaoImpl jjAddComment board insert!!!");
		} catch (Exception e) {
			System.out.println("BoardDaoImpl jjAddComment e.getMessage()->" + e.getMessage());
		}	
		
	}

	@Override
	public Board jsCallComment(Board board) {
		System.out.println("BoardDaoImpl jsCallComment start...");
		Board jsCallComment = new Board();
		try {
			jsCallComment = session.selectOne("jsCallComment", board);
			System.out.println("BoardDaoImpl jsCallComment jsCallComment->" + jsCallComment);
		} catch (Exception e) {
			System.out.println("BoardDaoImpl jsCallComment Exception->"+e.getMessage());
		}
		return jsCallComment;
	}
	
	@Override
	public void jsDeleteComment(int b_number) {
		System.out.println("BoardDaoImpl jsDeleteComment start...");
		System.out.println("BoardDaoImpl jsDeleteComment b_number ->" + b_number);
		try {
			session.delete("jsDeleteComment",b_number);
		} catch (Exception e) {
			System.out.println("QBoarddaoImpl jsDeleteComment e.getMessage()->" + e.getMessage());
		}
		
	}


	
}
