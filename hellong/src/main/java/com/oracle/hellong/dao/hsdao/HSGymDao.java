package com.oracle.hellong.dao.hsdao;

import java.util.List;

import com.oracle.hellong.model.GymOrder;

public interface HSGymDao {

	List<GymOrder> getListGymName(int m_number);

	List<GymOrder> getListGymService(int gymId, int m_number);

	GymOrder getRefundPrice(int gymId, int s_number, int s_detail, int m_number);

}