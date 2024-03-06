package com.oracle.hellong.dao.hsdao;

import java.util.List;

import com.oracle.hellong.model.GymOrder;

public interface GymDao { //..

	List<GymOrder> getListGymOrder(int m_number);

}
