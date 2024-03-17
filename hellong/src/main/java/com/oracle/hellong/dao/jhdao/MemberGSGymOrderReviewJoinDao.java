package com.oracle.hellong.dao.jhdao;

import java.util.List;
import java.util.Map;

import com.oracle.hellong.model.MemberGSGymOrderReviewJoin;
import com.oracle.hellong.model.MemberGym;

public interface MemberGSGymOrderReviewJoinDao {
	
	//리뷰작성
	List<MemberGSGymOrderReviewJoin> getReviewSearch(MemberGSGymOrderReviewJoin reviewListSearch);
	
	//리뷰 불러오기
	List<MemberGSGymOrderReviewJoin> getselectReviewList(int g_id);

	// 체육관 관리자 세션 인증용
	MemberGSGymOrderReviewJoin gymManagerSelect(MemberGym memberGymManager);

}