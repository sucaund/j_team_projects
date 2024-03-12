package com.oracle.hellong.dao.hsdao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.GymOrder;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class HSGymDaoImpl implements HSGymDao {
	 
	private final SqlSession session;

	@Override
	public List<GymOrder> getListGymName(int m_number) {
		List<GymOrder> listGymName = null;
		System.out.println("GymDaoImpl getListGymOrder start...");
		try {
			listGymName = session.selectList("com.oracle.hellong.GymOrderMapper.hsListGymName", m_number);
			System.out.println("GymDaoImpl getListGymOrder listGymOrder.size()-> " + listGymName.size());
		} catch (Exception e) {
		}
		return listGymName;
	}

	@Override
	public List<GymOrder> getListGymService(int gymId, int m_number) {
		List<GymOrder> listGymService = null;
		System.out.println("GymDaoImpl getListGymService start...");
		try {
			
			Map<String, Object> params = new HashMap<>();
			params.put("gymId", gymId);
			params.put("m_number", m_number);
			
			listGymService = session.selectList("hsListGymSerivce", params);
			
		} catch (Exception e) {
			
		}
		return listGymService;
	}

   @Override
   public GymOrder getRefundPrice(int gymId, int s_number, int s_detail, int m_number) {
      GymOrder refundPrice = null;
      System.out.println("GymDaoImpl getRefundPrice start...");
      
      try {
         Map<String, Object> params = new HashMap<>();
         params.put("gymId", gymId);
         params.put("s_number", s_number);
         params.put("s_detail", s_detail);
         params.put("m_number", m_number);
         
         refundPrice = session.selectOne("hsRefudPrice", params);
         System.out.println("GymDaoImpl getRefundPrice refundPrice -> " + refundPrice.getRefund_point() + " & " + refundPrice.getRefund_criteria());
         } catch (Exception e) {
         }
      return refundPrice;
   }

}