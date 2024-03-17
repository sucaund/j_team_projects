package com.oracle.hellong.dao.jhdao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.GymBoardReviewJoin;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class GymBoardReviewJoinDaoImpl implements GymBoardReviewJoinDao {
	private final SqlSession session;


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