package com.oracle.hellong.dao.dydao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.GymReview;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class DYGymReviewDaoImpl implements DYGymReviewDao {

	private final SqlSession session;
	
	// 통합검색(체육관리뷰)
	@Override
	public List<GymReview> searchGymReviews(GymReview gymReview) {
		List<GymReview> searchGymReviews = null;
		
		searchGymReviews = session.selectList("dySearchGymReviews", gymReview);
		return searchGymReviews;
	}
}