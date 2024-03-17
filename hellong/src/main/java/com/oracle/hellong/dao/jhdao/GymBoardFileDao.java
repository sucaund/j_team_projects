package com.oracle.hellong.dao.jhdao;

import java.util.List;

import com.oracle.hellong.model.Gym;
import com.oracle.hellong.model.GymBoardFile;

public interface GymBoardFileDao {

	List<GymBoardFile> gbf_idList(Gym g_id);
	
	//사진 저장
	void saveGymFile(GymBoardFile gymBoardFile);

	List<GymBoardFile> getFilesByGymId(int g_id);
	
	//사진 삭제
	void deleteGymFile(int g_id);

	//지점찾기 글 상세
	List<GymBoardFile> gymBoardFileListRead(int g_id);
	

	





}