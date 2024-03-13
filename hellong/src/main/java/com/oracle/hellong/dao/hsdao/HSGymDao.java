package com.oracle.hellong.dao.hsdao;

import java.util.List;
import java.util.Map;

import com.oracle.hellong.model.GS;
import com.oracle.hellong.model.GSDetail;
import com.oracle.hellong.model.GymOrder;
import com.oracle.hellong.model.Member;

public interface HSGymDao {
	
		/* 헬스장 이용내역 조회 */
	
	int totalUsingGym(int m_number);

	List<GymOrder> listUsingGym(Member member);
	
	
		/* 헬스장 회원권 구매,환불 공통 - getGymOrder */
	
	GymOrder getGymOrder(Map<String, Object> params);
	
	
		/* 헬스장 회원권 구매 */
	
	// GSDetail에 구매정보 insert + 키값 받기
	GS insertAndGetGSDetailData(GS gs);

	// GymOrder에 구매정보 insert
	int insertGymOrder(GS gsDetailData, int m_number);

	// insert한 GSDetail 정보 업데이트
	int updateGSDetailBuy(GymOrder gymOrder);

	// Member 구매포인트 업데이트
	int updatePointBuy(GymOrder gymOrder);

	
		/* 헬스장 회원권 환불 */
	
	// 이용중인 헬스장 이름 조회
	List<GymOrder> getListGymName(int m_number);

	// 이용중인 헬스장 서비스 조회
	List<GymOrder> getListGymService(int g_id, int m_number);

	// 이용중인 헬스장 예상 환불금액 조회
	GymOrder getRefundData(int g_id, int s_number, int sd_number, int m_number);

	// GymOrder에 환불정보 업데이트
	int updateGymOrder(Map<String, Object> params);

	// GSDetail에 환불정보 업데이트
	int updateGSDetailRefund(GymOrder gymOrder);

	// Member 환불포인트 업데이트
	int updatePointRefund(GymOrder gymOrder);

}
