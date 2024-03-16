package com.oracle.hellong.dao.hsdao;

import java.util.List;

import com.oracle.hellong.model.GymOrder;
import com.oracle.hellong.model.Member;
import com.oracle.hellong.model.PointCharge;

public interface HSPointDao {
	
		/* 포인트 내역 조회 */

	// 포인트충전 내역
	int totalListPointCharge(int m_number);
	
	List<PointCharge> listPointCharge(Member member);
	
	// 포인트사용 내역
	int totalListGymOrderDeal(int m_number);

	List<GymOrder> listGymOrderDeal(Member member);
	
	// 포인트환불 내역
	int totalListGymOrderRefund(int member);

	List<GymOrder> listGymOrderRefund(Member member);
	
	
		/* 포인트 충전 */
	
	PointCharge insertAndGetPointCharge(PointCharge pointCharge);

	int updatePointCharge(PointCharge insertAndGetPointCharge);

}
