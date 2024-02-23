package com.oracle.hellong.dao.shdao;

import java.util.List;

import com.oracle.hellong.model.Board;

public interface QBoarddao {

	int               totalQue();



	int sameId(String member_id);

	List<Board> quelist(String member_id);

}
