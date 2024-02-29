package com.oracle.hellong.dao.shdao;

import java.util.List;

import com.oracle.hellong.model.Board;

public interface QBoarddao {

	int               totalQue(int m_num);


	List<Board> quelist(Board board);


	int changeNum(String member_id);


	Board ContentBoard(int b_NUMBER);


	void addAttribute(Board board);


	void delete_que(int bId);


	void addComment(Board board);


	List<Board> getComments(int board);


	Board callComment(Board board);


	void deleteComment(int b_number);


}
