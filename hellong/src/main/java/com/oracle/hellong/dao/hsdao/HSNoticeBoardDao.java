package com.oracle.hellong.dao.hsdao;

import java.util.List;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.Member;

public interface NoticeBoardDao {

	int totalNoticeBoard();

	List<Board> listNoticeBoard(Board board);

	Board detailNoticeBoard(int b_number);

	List<Board> listManager();

	int createNoticeBoard(Board board);

	int updateNoticeBoard(Board board);

	int delteNoticeBoard(int b_number);

	int condTotalNoticeBoard(Board board);

	List<Board> searchNoticeBoard(Board board);

}
