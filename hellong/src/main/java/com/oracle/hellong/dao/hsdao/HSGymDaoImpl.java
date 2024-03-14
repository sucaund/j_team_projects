package com.oracle.hellong.dao.hsdao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.hibernate.internal.build.AllowSysOut;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.GS;
import com.oracle.hellong.model.GSDetail;
import com.oracle.hellong.model.GymOrder;
import com.oracle.hellong.model.Member;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class HSGymDaoImpl implements HSGymDao {
	 
	private final SqlSession session;

		/* 헬스장 이용내역 조회 */
	
	@Override
	public int totalUsingGym(int m_number) {
		int totalGym = 0;
		System.out.println("hsGymDaoImpl totalUsingGym start...");
		
		try {
			totalGym = session.selectOne("com.oracle.hellong.GymOrderMapper.hsTotalUsingGym", m_number);
			System.out.println("hsGymDaoImpl totalUsingGym totalGym-> " + totalGym);
		} catch(Exception e) {
		}
		return totalGym;
	}

	@Override
	public List<GymOrder> listUsingGym(Member member) {
		List<GymOrder> listUsingGym = null;
		System.out.println("hsGymDaoImpl listUsingGSDetail start...");
		
		try {
			listUsingGym = session.selectList("hsListUsingGym", member);
			System.out.println("hsGymDaoImpl listUsingGSDetail listUsingGym.size()-> " + listUsingGym.size());
		} catch (Exception e) {
			
		}
		return listUsingGym;
	}
	
		/* 헬스장 회원권 구매,환불 공통 - getGymOrder */
	
	@Override
	public GymOrder getGymOrder(Map<String, Object> params) {
		GymOrder gymOrder = null;
		System.out.println("hsGymDaoImpl getGymOrder start...");
		
		try {
            gymOrder = session.selectOne("hsGetGymOrder", params);
            System.out.println("hsGymDaoImpl getGymOrder getGymOrder-> " + gymOrder);
		} catch (Exception e) { 
			
		}
		return gymOrder;
	}
	
		/* 헬스장 회원권 구매 */

	// GSDetail에 구매정보 insert + 키값 받기
	@Override
	public GS insertAndGetGSDetailData(GS gs) {
		System.out.println("hsGymDaoImpl addGSDetail start...");
		
		try {
			session.insert("com.oracle.hellong.GSDetailMapper.hsInsertAndGetGSDetailData", gs);
			System.out.println("hsGymDaoImpl insertAndGetGSDetailData gs.getS_detail()-> " +gs.getSd_number()); 
		} catch (Exception e) {
			
		}
		return gs;
	}

	// GymOrder에 구매정보 insert
	@Override
	public int insertGymOrder(GS gsDetailData, int m_number) {
		int insertGymOrderResult = 0;
		System.out.println("hsGymDaoImpl insertGymOrder start...");
		 
		try {
            Map<String, Object> params = new HashMap<>();	
            params.put("g_id", gsDetailData.getG_id());
            params.put("s_number", gsDetailData.getS_number());
            params.put("sd_number", gsDetailData.getSd_number());
            params.put("m_number", m_number);
            params.put("use_point", gsDetailData.getS_price());
 
			insertGymOrderResult = session.insert("com.oracle.hellong.GymOrderMapper.hsInsertGymOrder", params);
			System.out.println("hsGymDaoImpl insertGymOrder insertGymOrderResult-> " + insertGymOrderResult);
		} catch (Exception e) {
			
		}
		return insertGymOrderResult;
	}
	
	// insert한 GSDetail 정보 업데이트
	@Override
	public int updateGSDetailBuy(GymOrder gymOrder) {
		int updateGSDetailBuyResult = 0;
		System.out.println("hsGymDaoImpl updateGSDetailBuy start...");
		
		try {
			updateGSDetailBuyResult = session.update("hsUpdateGSDetailBuy", gymOrder);
			System.out.println("hsGymDaoImpl updateGSDetailBuy updateGSDetailBuyResult-> " + updateGSDetailBuyResult);
		} catch (Exception e) {
			
		}
		return updateGSDetailBuyResult;
	}

	// Member 구매포인트 업데이트
	@Override
	public int updatePointBuy(GymOrder gymOrder) {
		int updatePointBuyResult = 0;
		System.out.println("hsGymDaoImpl updatePointBuy start...");
		
		try {
			updatePointBuyResult = session.update("hsUpdatePointBuy", gymOrder);
			System.out.println("hsGymDaoImpl updatePointBuy updatePointBuyResult-> " + updatePointBuyResult);
		} catch (Exception e) {
			
		}
		return updatePointBuyResult;
	}

	
		/* 헬스장 회원권 환불 */
	
	// 이용중인 헬스장 이름 조회
	@Override
	public List<GymOrder> getListGymName(int m_number) {
		List<GymOrder> listGymName = null;
		System.out.println("hsGymDaoImpl getListGymOrder start...");
		try {
			listGymName = session.selectList("hsListGymName", m_number);
			System.out.println("hsGymDaoImpl getListGymOrder listGymOrder.size()-> " + listGymName.size());
		} catch (Exception e) {
		}
		return listGymName;
	}

	// 이용중인 헬스장 서비스 조회
	@Override
	public List<GymOrder> getListGymService(int g_id, int m_number) {
		List<GymOrder> listGymService = null;
		System.out.println("hsGymDaoImpl getListGymService start...");
		try {
			
			Map<String, Object> params = new HashMap<>();
			params.put("g_id", g_id);
			params.put("m_number", m_number);
			
			listGymService = session.selectList("hsListGymSerivce", params);
			
		} catch (Exception e) {
			
		}
		return listGymService;
	}
	
	// 이용중인 헬스장 예상 환불금액 조회
   @Override
   public GymOrder getRefundData(int g_id, int s_number, int sd_number, int m_number) {
      GymOrder refundData = null;
      System.out.println("hsGymDaoImpl getRefundData start...");
           
      try {
    	  Map<String, Object> params = new HashMap<>();	
    	  params.put("g_id", g_id);
    	  params.put("s_number", s_number);
    	  params.put("sd_number", sd_number);
    	  params.put("m_number", m_number);
         
    	  refundData = session.selectOne("hsRefundData", params);
    	  System.out.println("hsGymDaoImpl getRefundData refundData -> " + refundData);
         } catch (Exception e) {
        	 System.out.println("e.getMessage()->"+e.getMessage());
         }
      return refundData;
   }

   // GymOrder에 환불정보 업데이트
	@Override
	public int updateGymOrder(Map<String, Object> params) {
		int updateGymOrderResult = 0;
		System.out.println("hsGymDaoImpl updateGymOrder start...");
		
		try {
			updateGymOrderResult = session.update("hsUpdateGymOrder", params);
			System.out.println("hsGymDaoImpl updateGymOrder updateGymOrderResult-> " + updateGymOrderResult);
		} catch (Exception e) {
			
		}
		return updateGymOrderResult;
	}
	
	// GSDetail에 환불정보 업데이트
	@Override
	public int updateGSDetailRefund(GymOrder gymOrder) {
		int updateGSDetailRefundResult = 0;
		System.out.println("hsGymDaoImpl updateGSDetailRefund start...");
		
		try {
			updateGSDetailRefundResult = session.update("hsUpdateGSDetailRefund", gymOrder);
			System.out.println("hsGymDaoImpl updateGSDetailRefund updateGSDetailRefundResult-> " + updateGSDetailRefundResult);
		} catch (Exception e) {
			
		}
		return updateGSDetailRefundResult;
	}

	// Member 환불포인트 업데이트
	@Override
	public int updatePointRefund(GymOrder gymOrder) {
		int updatePointRefundResult = 0;
		System.out.println("hsGymDaoImpl updatePointRefund start...");
		
		try {
			updatePointRefundResult = session.update("hsUpdatePointRefund", gymOrder);
			System.out.println("hsGymDaoImpl updatePointRefund updatePointRefundResult->  " + updatePointRefundResult);
		} catch (Exception e) {
			
		}
		return updatePointRefundResult;
	}
   

}