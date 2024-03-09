package com.oracle.hellong.dao.dydao;

import java.util.List;

import com.oracle.hellong.model.BoardFile;

public interface DYBoardFileDao {

	int insertFileBodyProfile(BoardFile boardFile);
	
	List<BoardFile> selectBodyProfileFileList(int b_number);
	
	// List<BoardFile> listFileBodyProfile(BoardFile boardFile);

}