package com.oracle.hellong.dao.hsdao;

import java.util.List;

import com.oracle.hellong.model.GymOrder;
import com.oracle.hellong.model.Member;
import com.oracle.hellong.model.PointCharge;

public interface PointDao {


	int totalListPointCharge(int m_number);
	
	List<PointCharge> listPointCharge(int m_number);

	int totalListGymOrderDeal(Member member);

	List<GymOrder> listGymOrderDeal(Member member);

	int totalListGymOrderRefund(Member member);

	List<GymOrder> listGymOrderRefund(Member member);

}
