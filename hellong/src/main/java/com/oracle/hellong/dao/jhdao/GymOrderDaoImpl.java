package com.oracle.hellong.dao.jhdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.GymOrder;
import com.oracle.hellong.model.MemberGym;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class GymOrderDaoImpl implements GymOrderDao {
	private final SqlSession session;

	@Override
	public List<GymOrder> selectOrder(int memberNumber) {
		List<GymOrder> selectOrderResult = null;
		System.out.println("MemberDaoImpl memberGymList Start ..." );
		try {                      
			selectOrderResult = session.selectList("selectOrder", memberNumber);
			System.out.println("GymOrderDaoImpl selectOrderResult.size()->"+selectOrderResult.size());
		} catch (Exception e) {
			System.out.println("GymOrderDaoImpl selectOrderResult e.getMessage()->"+e.getMessage());
		}
		return selectOrderResult;
	}
}