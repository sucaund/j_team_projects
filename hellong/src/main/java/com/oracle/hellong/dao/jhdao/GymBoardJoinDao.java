package com.oracle.hellong.dao.jhdao;

import java.util.List;

import com.oracle.hellong.model.GymBoardJoin;

public interface GymBoardJoinDao {
	

	//지점 찾기 글 상세
	List<GymBoardJoin> gymBoardDetailRead(int g_id);


}
