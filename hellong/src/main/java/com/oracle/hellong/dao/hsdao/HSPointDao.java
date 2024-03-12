package com.oracle.hellong.dao.hsdao;

import java.util.List;

import com.oracle.hellong.model.GymOrder;
import com.oracle.hellong.model.Member;
import com.oracle.hellong.model.PointCharge;

public interface HSPointDao {

	// 포인트 충전
	int totalListPointCharge(int m_number);
	
	List<PointCharge> listPointCharge(Member member);
	
	// 포인트 사용
	int totalListGymOrderDeal(int m_number);

	List<GymOrder> listGymOrderDeal(Member member);
	
	// 포인트 환불
	int totalListGymOrderRefund(int member);

	List<GymOrder> listGymOrderRefund(Member member);


}
