package com.oracle.hellong.dao.jjdao;

import java.util.List;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.Common;
import com.oracle.hellong.model.RecommCheck;

public interface BoardDao {

	int 		totalBoard();
	List<Board> listBoard(Board board);
	Board 		detailBoard(int b_number);
	int 		updateBoard(Board board);
	List<Board> listManager();
	int 		insertBoard(Board board);
	int 		deleteBoard(int b_number);
	int 		jjReported(Board board);
	List<Board> listCategorySearchBoard(Board board);
	int 		totalCategorySearchCnt(Board board);
	List<Common> commonList(Common common);
	RecommCheck checkRecomm(int b_number, int m_number);
	void 		insertRecomm(RecommCheck rec);
	void 		increaseRecommCount(int b_number);
	int 		recommandCount(int b_number);
	List<Board> getPComments(int b_number);
	int 		jschangeNum(String member_id);
	void 		jjAddComment(Board board);
	Board 		jsCallComment(Board board);
	void 		jsDeleteComment(int b_number);

}