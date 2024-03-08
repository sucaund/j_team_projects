package com.oracle.hellong.dao.dydao;

import java.util.List;

import com.oracle.hellong.model.GymReview;

public interface DYGymReviewDao {

	List<GymReview> searchGymReviews(GymReview gymReview);

}
