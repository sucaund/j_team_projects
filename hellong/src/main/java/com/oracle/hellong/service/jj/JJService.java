package com.oracle.hellong.service.jj;

import java.util.List;

import com.oracle.hellong.model.Board;

public interface JJService {

	int 		totalBoard();
	List<Board> listBoard(Board board);
	Board 		detailBoard(int b_number);
	int 		updateBoard(Board board);
	List<Board> listManager();
	int 		insertBoard(Board board);
	int 		deleteBoard(int b_number);
	int 		hitCnt(int b_number);
	int 		totalSearchCnt(Board board);
	List<Board> listSearchBoard(Board board);
	int 		jjReported(int b_number);

}
