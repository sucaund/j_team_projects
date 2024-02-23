package com.oracle.hellong.service.sh;

import java.util.List;

import com.oracle.hellong.model.Board;

public interface SHService {

	int totalquestions();

	boolean authenticate(String userId, String password);

	int sameId(String member_id);

	List<Board> quelist(Board board);

	

}
