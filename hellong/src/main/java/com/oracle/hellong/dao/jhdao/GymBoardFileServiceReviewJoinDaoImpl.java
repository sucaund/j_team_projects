package com.oracle.hellong.dao.jhdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.GymBoardReviewJoin;
import com.oracle.hellong.model.GymBoardFileServiceReviewJoin;

import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class GymBoardFileServiceReviewJoinDaoImpl implements GymBoardFileServiceReviewJoinDao {

	private final SqlSession session;

	// 지점 찾기 글 조회
	@Override
	public List<GymBoardFileServiceReviewJoin> getGymSearchPage(GymBoardFileServiceReviewJoin gymBoardServiceJoin) {
		List<GymBoardFileServiceReviewJoin>  getGymSearchPageResult = null;
		try {							    
			getGymSearchPageResult = session.selectList("getGymSearchPage",gymBoardServiceJoin);
			System.out.println("GymBoardFileServiceReviewJoinDaoImpl GymBoardFileServiceReviewJoin.size()->"+getGymSearchPageResult.size());
		} catch (Exception e) {
			System.out.println("GymBoardFileServiceReviewJoinDaoImpl GymBoardFileServiceReviewJoin Exception -> "+e.getMessage());
		}
		
		return getGymSearchPageResult;
	}

	//지점찾기 글 개수
	@Override
	public int getGymImformationCount(GymBoardFileServiceReviewJoin gymBoardServiceJoin) {
		int getGymImformationCountResult =0;
		try {
			getGymImformationCountResult = session.selectOne("getGymImformationCount",gymBoardServiceJoin);
			System.out.println("GymBoardJoinDaoImpl getGymImformationCount"+getGymImformationCountResult);
		}catch(Exception e) {
			System.out.println("GymBoardJoinDaoImpl getGymImformationCount Exception -> "+e.getMessage());
		}		
		return getGymImformationCountResult;
	}
	
	
}
