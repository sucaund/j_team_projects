package com.oracle.hellong.dao.jhdao;

import java.util.List;

import com.oracle.hellong.model.GymBoardFileJoin;

public interface GymBoardFileJoinDao {

	List<GymBoardFileJoin> selectGymList(int g_id);

	// 지점찾기
	List<GymBoardFileJoin> gymBoardFileList();

}
