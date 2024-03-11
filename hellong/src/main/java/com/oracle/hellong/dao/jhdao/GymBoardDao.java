package com.oracle.hellong.dao.jhdao;

import java.util.List;

import com.oracle.hellong.model.Gym;
import com.oracle.hellong.model.GymBoard;
import com.oracle.hellong.model.GymBoardFile;

public interface GymBoardDao {

	int gymForm(Gym g_id);

	List<GymBoard> gymBoardDetail(Gym g_id);

	//글 저장
	int saveGymPost(GymBoard gymboard);
	//글 수정
	int updateGymPost(GymBoard gymboard);
	//글 삭제
	void deleteGymPost(int g_id);
	

	







}
