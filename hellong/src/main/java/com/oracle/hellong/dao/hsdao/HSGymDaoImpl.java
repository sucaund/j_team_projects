package com.oracle.hellong.dao.hsdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.GymOrder;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class HSGymDaoImpl implements GymDao {
	
	private final SqlSession session;

	@Override
	public List<GymOrder> getListGymOrder(int m_number) {
		List<GymOrder> listGymOrder = null;
		System.out.println("GymDaoImpl getListGymOrder start...");
		try {
			listGymOrder = session.selectList("com.oracle.hellong.GymOrderMapper.hsListGymOrder", m_number);
			System.out.println("GymDaoImpl getListGymOrder listGymOrder.size()-> " + listGymOrder.size());
		} catch (Exception e) {
		}
		return listGymOrder;
	}

}
