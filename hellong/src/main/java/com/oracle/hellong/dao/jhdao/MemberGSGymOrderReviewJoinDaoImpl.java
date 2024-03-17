package com.oracle.hellong.dao.jhdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.MemberGSGymOrderReviewJoin;
import com.oracle.hellong.model.MemberGym;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberGSGymOrderReviewJoinDaoImpl implements MemberGSGymOrderReviewJoinDao {
	private final SqlSession session;

	@Override
	public List<MemberGSGymOrderReviewJoin> getReviewSearch(MemberGSGymOrderReviewJoin reviewListSearch) {
		List<MemberGSGymOrderReviewJoin>  getReviewSearchResult = null;
		System.out.println(reviewListSearch);
		try {
			getReviewSearchResult = session.selectList("getReviewSearch",reviewListSearch);
		}catch(Exception e) {
			System.out.println("MemberGSGymOrderReviewJoinDaoImpl getReviewSearch Exception -> "+e.getMessage());
		}		
		return getReviewSearchResult;
	}

	@Override
	public List<MemberGSGymOrderReviewJoin> getselectReviewList(int g_id) {
		List<MemberGSGymOrderReviewJoin>  getselectReviewListResult = null;
		try {
			getselectReviewListResult = session.selectList("getselectReviewList",g_id);
		}catch(Exception e) {
			System.out.println("MemberGSGymOrderReviewJoinDaoImpl getselectReviewList Exception -> "+e.getMessage());
		}		
		return getselectReviewListResult;
	}

	// 관리자 세션 인증용
	@Override
	public MemberGSGymOrderReviewJoin gymManagerSelect(MemberGym memberGymManager) {
		MemberGSGymOrderReviewJoin gymManagerSelectResult = null;
		try {
			gymManagerSelectResult = session.selectOne("gymManagerSelectOne",memberGymManager);
		}catch(Exception e) {
			System.out.println("MemberGSGymOrderReviewJoinDaoImpl gymManagerSelect Exception -> "+e.getMessage());
		}		
		return gymManagerSelectResult;
	}
	
}