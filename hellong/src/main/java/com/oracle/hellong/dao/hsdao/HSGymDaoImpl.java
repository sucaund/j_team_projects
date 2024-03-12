package com.oracle.hellong.dao.hsdao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.GSDetail;
import com.oracle.hellong.model.GymOrder;
import com.oracle.hellong.model.Member;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class HSGymDaoImpl implements HSGymDao {
	 
	private final SqlSession session;

	// 헬스장 이용내역
	
	@Override
	public int totalUsingGym(int m_number) {
		int totalGym = 0;
		System.out.println("GymDaoImpl totalUsingGym start...");
		
		try {
			totalGym = session.selectOne("com.oracle.hellong.GymOrderMapper.hsTotalUsingGym", m_number);
			System.out.println("GymDaoImpl totalUsingGym totalGym-> " + totalGym);
		} catch(Exception e) {
		}
		return totalGym;
	}

	@Override
	public List<GymOrder> listUsingGym(Member member) {
		List<GymOrder> listUsingGym = null;
		System.out.println("GymDaoImpl listUsingGSDetail start...");
		
		try {
			listUsingGym = session.selectList("hsListUsingGym", member);
			System.out.println("GymDaoImpl listUsingGSDetail listUsingGym.size()-> " + listUsingGym.size());
		} catch (Exception e) {
			
		}
		return listUsingGym;
	}
	
	
	// 헬스장 환불
	
	@Override
	public List<GymOrder> getListGymName(int m_number) {
		List<GymOrder> listGymName = null;
		System.out.println("GymDaoImpl getListGymOrder start...");
		try {
			listGymName = session.selectList("hsListGymName", m_number);
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
			params.put("g_id", gymId);
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
         params.put("g_id", gymId);
         params.put("s_number", s_number);
         params.put("s_detail", s_detail);
         params.put("m_number", m_number);
         
         refundPrice = session.selectOne("hsRefundPrice", params);
          System.out.println("GymDaoImpl getRefundPrice refundPrice -> " + refundPrice);
         } catch (Exception e) {
        	 System.out.println("e.getMessage()->"+e.getMessage());
         }
      return refundPrice;
   }



}