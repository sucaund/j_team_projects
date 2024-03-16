package com.oracle.hellong.dao.jhdao;

import java.util.List;

import com.oracle.hellong.model.GymBoardReviewJoin;

public interface GymBoardReviewJoinDao {

	List<GymBoardReviewJoin> getAvgReview(GymBoardReviewJoin gymBoardReviewJoin);
	
	//지점찾기 글 상세
	GymBoardReviewJoin getAvgReviewSelect(int g_id);

}
