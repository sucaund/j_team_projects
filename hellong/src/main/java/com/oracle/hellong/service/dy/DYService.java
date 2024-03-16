package com.oracle.hellong.service.dy;

import java.util.List;

import com.oracle.hellong.model.Board;

public interface DYService {

	int totalBodyProfile();

	List<Board> listBodyProfile(Board board);

	Board selectBodyProfile(int b_number);

	int dyUpdateBodyProfile(Board board);

	List<Board> listManager();

	int insertBodyProfile(Board board);

	int deleteBodyProfile(int b_number);

	int condTotalBodyProfile(Board board);

	List<Board> listSearchBoard(Board board);






	
}
