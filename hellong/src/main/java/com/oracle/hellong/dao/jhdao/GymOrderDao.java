package com.oracle.hellong.dao.jhdao;

import java.util.List;

import com.oracle.hellong.model.GymOrder;

public interface GymOrderDao {

	//리뷰 작성 -> 주문 목록 있는지 확인
	List<GymOrder> selectOrder(int memberNumber, int g_id);

}