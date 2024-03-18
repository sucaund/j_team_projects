package com.oracle.hellong.dao.jhdao;

import com.oracle.hellong.model.GymBoardReviewJoin;

public interface GymBoardReviewJoinDao {
	
	//지점찾기 글 상세
	GymBoardReviewJoin getAvgReviewSelect(int g_id);

}
