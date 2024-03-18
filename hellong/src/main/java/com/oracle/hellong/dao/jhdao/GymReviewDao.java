package com.oracle.hellong.dao.jhdao;

import com.oracle.hellong.model.GymReview;

public interface GymReviewDao {

	// 리뷰작성
	int getSaveReview(GymReview writeReview);
	// 리뷰답글
	int updateReview(GymReview replyReview);


}
