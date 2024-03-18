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

	List<GymOrder> listDetailUsingGym(Member member);
	
	
		/* 헬스장 회원권 구매,환불 공통 - getGymOrder */
	
	GSDetail getGSDetailData(GSDetail gsDetail);
	
	
		/* 헬스장 회원권 구매 */

		/* GSDetail getGSDetailDataBuy(GSDetail gsDetail); */

	GSDetail insertAndGetGymOrder(GSDetail gsDetail);
	
	int updateGymOrderBuy(GSDetail insertAndGetGymOrder);

	int updatePointBuy(GSDetail insertAndGetGymOrder);
	
		/* 헬스장 회원권 환불 */
	
	// 이용중인 헬스장 이름 조회
	List<GymOrder> getListGymName(int m_number);

	// 이용중인 헬스장 서비스 조회
	List<GymOrder> getListGymService(int g_id, int m_number);

	// 이용중인 헬스장 예상 환불금액 조회
	GymOrder getRefundData(int g_id, int s_number, int sd_number, int m_number, int go_number);

	// GymOrder에 환불정보 업데이트
	int updateGymOrderRefund(Map<String, Object> params);

	// Member 환불포인트 업데이트
	int updatePointRefund(Map<String, Object> params);

}