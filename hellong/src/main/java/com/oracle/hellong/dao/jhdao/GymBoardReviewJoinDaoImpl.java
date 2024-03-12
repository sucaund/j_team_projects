package com.oracle.hellong.dao.jhdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.GymBoardFileJoin;
import com.oracle.hellong.model.GymBoardReviewJoin;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class GymBoardReviewJoinDaoImpl implements GymBoardReviewJoinDao {
	private final SqlSession session;

	@Override
	public List<GymBoardReviewJoin> getAvgReview(GymBoardReviewJoin gymBoardReviewJoin) {
		List <GymBoardReviewJoin> getAvgReviewResult = null;
		try {							    
			getAvgReviewResult = session.selectList("getAvgReview",gymBoardReviewJoin);
			System.out.println("GymBoardReviewJoinDaoImpl getAvgReview.size()->"+getAvgReviewResult.size());
		} catch (Exception e) {
			System.out.println("GymBoardReviewJoinDaoImpl getAvgReview Exception -> "+e.getMessage());
		}

		return getAvgReviewResult;
	}

	@Override
	public GymBoardReviewJoin getAvgReviewSelect(int g_id) {
		GymBoardReviewJoin getAvgReviewSelectResult = null;
		try {							    
			getAvgReviewSelectResult = session.selectOne("getAvgReviewSelect",g_id);
			System.out.println("GymBoardReviewJoinDaoImpl getAvgReviewSelect->"+getAvgReviewSelectResult);
		} catch (Exception e) {
			System.out.println("GymBoardReviewJoinDaoImpl getAvgReviewSelect Exception -> "+e.getMessage());
		}

		return getAvgReviewSelectResult;
	}
}