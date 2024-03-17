package com.oracle.hellong.dao.jhdao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.GymReview;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class GymReviewDaoImpl implements GymReviewDao {
	
	private final SqlSession session;
	
	// 리뷰작성
	@Override
	public int getSaveReview(GymReview writeReview) {
		int getSaveReviewResult  = 0;
		System.out.println("GymReviewDaoImpl getSaveReview****"+writeReview);
		try {
			getSaveReviewResult = session.insert("getSaveGymReview",writeReview);
		}catch(Exception e) {
			System.out.println("GymReviewDaoImpl getSaveReview Exception -> "+e.getMessage());
		}		
		return getSaveReviewResult;
	}

	// 리뷰 답글
	@Override
	public int updateReview(GymReview replyReview) {
		int updateReviewResult  = 0;
		System.out.println("GymReviewDaoImpl updateReview****"+replyReview);
		try {
			updateReviewResult = session.update("updateReview",replyReview);
		}catch(Exception e) {
			System.out.println("GymReviewDaoImpl updateReview Exception -> "+e.getMessage());
		}		
		return updateReviewResult;
	}


	
	
}