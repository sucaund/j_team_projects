package com.oracle.hellong.dao.jjdao;

import java.util.List;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.Common;

public interface BoardDao {

	int 		totalBoard();
	List<Board> listBoard(Board board);
	Board 		detailBoard(int b_number);
	int 		updateBoard(Board board);
	List<Board> listManager();
	int 		insertBoard(Board board);
	int 		deleteBoard(int b_number);
	int 		hitCnt(int b_number);
	int 		jjReported(Board board);
	List<Board> listCategorySearchBoard(Board board);
	int 		totalCategorySearchCnt(Board board);
	List<Common> commonList(Common common);

}