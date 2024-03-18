package com.oracle.hellong.dao.jhdao;

import java.util.List;

import com.oracle.hellong.model.GymBoardFileServiceReviewJoin;

public interface GymBoardFileServiceReviewJoinDao {

	// 지점찾기 글 조회
	List<GymBoardFileServiceReviewJoin> getGymSearchPage(GymBoardFileServiceReviewJoin gymBoardServiceJoin);
	// 지점찾기 글 개수
	int getGymImformationCount(GymBoardFileServiceReviewJoin gymBoardServiceJoin);

}
