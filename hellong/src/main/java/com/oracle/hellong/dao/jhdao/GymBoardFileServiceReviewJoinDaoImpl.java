package com.oracle.hellong.dao.jhdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.GymBoardReviewJoin;
import com.oracle.hellong.model.GymBoardServiceJoin;

import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class GymBoardServiceJoinDaoImpl implements GymBoardServiceJoinDao {

	private final SqlSession session;

	@Override
	public List<GymBoardServiceJoin> getMinPrice(GymBoardServiceJoin gymBoardServiceJoin) {
		List <GymBoardServiceJoin> getMinPriceResult = null;
		try {							    
			getMinPriceResult = session.selectList("getMinPrice",gymBoardServiceJoin);
			System.out.println("GymBoardReviewJoinDaoImpl getAvgReview.size()->"+getMinPriceResult.size());
		} catch (Exception e) {
			System.out.println("GymBoardReviewJoinDaoImpl getAvgReview Exception -> "+e.getMessage());
		}
		
		return getMinPriceResult;
	}
	
	
}
