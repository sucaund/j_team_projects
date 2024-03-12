package com.oracle.hellong.dao.jhdao;

import java.util.List;

import com.oracle.hellong.model.GymBoardJoin;

public interface GymBoardJoinDao {
	
	// 지점찻기 글 전체 조회
	List<GymBoardJoin> gymGymBoardList(GymBoardJoin gymBoardJoin);
	//지점 찾기 글 상세
	List<GymBoardJoin> gymBoardDetailRead(int g_id);
	//지점 찾기 글 카운트
	int getGymImformationCount();

}
