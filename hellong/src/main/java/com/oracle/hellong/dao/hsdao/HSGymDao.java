package com.oracle.hellong.dao.hsdao;

import java.util.List;

import com.oracle.hellong.model.GSDetail;
import com.oracle.hellong.model.GymOrder;
import com.oracle.hellong.model.Member;

public interface HSGymDao {
	
	// 헬스장 이용내역
	
	int totalUsingGym(int m_number);

	List<GymOrder> listUsingGym(Member member);

	
	// 헬스장 환불
	
	List<GymOrder> getListGymName(int m_number);

	List<GymOrder> getListGymService(int gymId, int m_number);

	GymOrder getRefundPrice(int gymId, int s_number, int s_detail, int m_number);



}