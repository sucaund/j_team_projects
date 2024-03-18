package com.oracle.hellong.dao.jhdao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.GymBoardJoin;
import com.oracle.hellong.model.GymMemberServiceOrderJoin;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class GymMemberServiceOrderJoinDaoImpl implements GymMemberServiceOrderJoinDao {

	private final SqlSession session;
	
	//전체회원 조회
	@Override
	public List<GymMemberServiceOrderJoin> getGymMemberList(GymMemberServiceOrderJoin gymMemberServiceOrderJoin) {
		List<GymMemberServiceOrderJoin> getGymMemberListResult = null;
		try {
			getGymMemberListResult = session.selectList("getGymMemberList",gymMemberServiceOrderJoin);
			System.out.println("GymMemberServiceOrderJoinDaoImpl getGymMemberList->"+getGymMemberListResult.size());
			System.out.println("GymMemberServiceOrderJoinDaoImpl getGymMemberList->"+getGymMemberListResult);
		}catch(Exception e) {
			System.out.println("GymMemberServiceOrderJoinDaoImpl getGymMemberList Exception -> "+e.getMessage());
		}		
		return getGymMemberListResult;
	}

	//누적회원
	@Override
	public int getTotalGymMemberList(int g_id) {
		int  getTotalGymMemberListResult = 0;
		try {
			getTotalGymMemberListResult = session.selectOne("getTotalGymMemberList",g_id);
			System.out.println("GymMemberServiceOrderJoinDaoImpl getTotalGymMemberList");
		}catch(Exception e) {
			System.out.println("GymMemberServiceOrderJoinDaoImpl getTotalGymMemberList Exception -> "+e.getMessage());
		}		
		return getTotalGymMemberListResult;
	}

	//누적 매출액
	@Override
	public int getSumSale(int g_id) {
		int  getSumSaleResult = 0;
		try {
			getSumSaleResult = session.selectOne("getSumSale",g_id);
			System.out.println("GymMemberServiceOrderJoinDaoImpl getSumSale");
		}catch(Exception e) {
			System.out.println("GymMemberServiceOrderJoinDaoImpl getSumSale Exception -> "+e.getMessage());
		}		
		return getSumSaleResult;
	}

	//성비 조회
	@Override
	public Map<String, Double> getGenderRatio(int g_id) {
		Map<String, Double> getGenderRatioResult = null;
		try {
			getGenderRatioResult = session.selectOne("getGenderRatio",g_id);
			System.out.println("GymMemberServiceOrderJoinDaoImpl getSumSale"+getGenderRatioResult);
		}catch(Exception e) {
			System.out.println("GymMemberServiceOrderJoinDaoImpl getSumSale Exception -> "+e.getMessage());
		}		
		return getGenderRatioResult;
	}

	@Override
	public Map<String, Double> getAgeRatio(int g_id) {
		Map<String, Double> getAgeRatioResult = null;
		try {
			getAgeRatioResult = session.selectOne("getAgeRatio",g_id);
			System.out.println("GymMemberServiceOrderJoinDaoImpl getAgeRatioResult"+getAgeRatioResult);
		}catch(Exception e) {
			System.out.println("GymMemberServiceOrderJoinDaoImpl getSumSale Exception -> "+e.getMessage());
		}		
		return getAgeRatioResult;
	}

	// 현재 이용중인 회원
	public int getCurrentTotalMemberList(GymMemberServiceOrderJoin gymMember) {
		int  getCurrentTotalMemberListResult = 0;
		try {
			getCurrentTotalMemberListResult = session.selectOne("getCurrentTotalMemberList",gymMember);
			System.out.println("GymMemberServiceOrderJoinDaoImpl getCurrentTotalMemberList");
		}catch(Exception e) {
			System.out.println("GymMemberServiceOrderJoinDaoImpl getCurrentTotalMemberList Exception -> "+e.getMessage());
		}		
		return getCurrentTotalMemberListResult;
	}
	
}
