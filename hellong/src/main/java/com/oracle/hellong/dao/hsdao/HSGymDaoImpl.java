package com.oracle.hellong.dao.hsdao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.hibernate.internal.build.AllowSysOut;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.GS;
import com.oracle.hellong.model.GSDetail;
import com.oracle.hellong.model.GSGSDetailJoin;
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
	public List<GymOrder> listDetailUsingGym(Member member) {
		List<GymOrder> listUsingGym = null;
		System.out.println("hsGymDaoImpl listDetailUsingGym start...");
		
		try {
			listUsingGym = session.selectList("hsListDetailUsingGym", member);
			System.out.println("hsGymDaoImpl listDetailUsingGym listUsingGym.size()-> " + listUsingGym.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listUsingGym;
	}
	
		/* 헬스장 회원권 구매,환불 공통 - getGymOrder */
	
	@Override
	public GSDetail getGSDetailData(GSGSDetailJoin gsd) {
		GSDetail gymOrderData = null;
		System.out.println("hsGymDaoImpl getGSDetailData start...");
		
		try {
			gymOrderData = session.selectOne("hsGetGSDetailData", gsd);
            System.out.println("hsGymDaoImpl getGSDetailData gymOrderData-> " + gymOrderData);
		} catch (Exception e) { 
			
		}
		return gymOrderData;
	}
	
		/* 헬스장 회원권 구매 */

		/*
		 * @Override public GSDetail getGSDetailDataBuy(GSDetail gsDetail) { GSDetail
		 * gsDetailData = null;
		 * System.out.println("hsServiceImpl getGSDetailDataBuy start..."); try {
		 * gsDetailData = session.selectOne("hsGetGSDetailDataBuy", gsDetail); } catch
		 * (Exception e) {
		 * 
		 * } return gsDetailData; }
		 */

	@Override
	public GSDetail insertAndGetGymOrder(GSDetail gsDetail) {
		System.out.println("hsGymDaoImpl insertAndGetGymOrder start...");
		try {
			session.insert("hsInsertAndGetGymOrder", gsDetail);
			System.out.println("insertAndGetGymOrder check: " + gsDetail.getGo_number());
		} catch (Exception e) {
			
			
		}
		return gsDetail;
	}
	
	@Override
	public String getEndDateGymOrder(GSDetail insertAndGetGymOrder) {
		String go_enddate = null;
		System.out.println("hsGymDaoImpl getEndDateGymOrder start...");
		
		try {
			go_enddate = session.selectOne("hsGetEndDateGymOrder", insertAndGetGymOrder);
			System.out.println("hsGymDaoImpl getEndDateGymOrder result-> " + go_enddate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return go_enddate;
	}
	
	@Override
	public int updateGymOrderBuy(GSDetail insertAndGetGymOrder) {
		int updateGymOrderBuyResult = 0;
		System.out.println("hsGymDaoImpl updateGymOrderBuy start...");
		try {
			updateGymOrderBuyResult = session.update("hsUpdateGymOrderBuy", insertAndGetGymOrder);
			System.out.println("updateGymOrderBuy check-> " + updateGymOrderBuyResult);
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return updateGymOrderBuyResult;
	}

	@Override
	public int updatePointBuy(GSDetail insertAndGetGymOrder) {
		int updatePointBuyResult = 0;
		System.out.println("hsGymDaoImpl updatePointBuy start...");
		try {
			updatePointBuyResult = session.update("hsUpdatePointBuy", insertAndGetGymOrder);
			System.out.println("updatePointBuy check-> " + updatePointBuyResult);
		} catch (Exception e) {
			e.printStackTrace();
			
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
			System.out.println("getGymService params check: " + params);
			
			listGymService = session.selectList("hsListGymSerivce", params);
			
		} catch (Exception e) {
			
		}
		return listGymService;
	}
	
	// 이용중인 헬스장 예상 환불금액 조회
   @Override
   public GymOrder getRefundData(int g_id, int s_number, int sd_number, int m_number, int go_number) {
      GymOrder refundData = null;
      System.out.println("hsGymDaoImpl getRefundData start...");
           
      try {
    	  Map<String, Object> params = new HashMap<>();	
    	  params.put("g_id", g_id);
    	  params.put("s_number", s_number);
    	  params.put("sd_number", sd_number);
    	  params.put("m_number", m_number);
    	  params.put("go_number", go_number);
         
    	  System.out.println("refundData params check: " + params);
    	  refundData = session.selectOne("hsRefundData", params);
    	  System.out.println("hsGymDaoImpl getRefundData refundData -> " + refundData);
         } catch (Exception e) {
        	 System.out.println("e.getMessage()->"+e.getMessage());
         }
      return refundData;
   }

   // GymOrder에 환불정보 업데이트
	@Override
	public int updateGymOrderRefund(Map<String, Object> params) {
		int updateGymOrderRefundResult = 0;
		System.out.println("hsGymDaoImpl updateGymOrderRefund start...");
		
		try {
			System.out.println("updateGymOrder check: " +params);
			updateGymOrderRefundResult = session.update("hsUpdateGymOrderRefund", params);
			System.out.println("hsGymDaoImpl updateGymOrderRefund updateGymOrderRefundResult-> " + updateGymOrderRefundResult);
		} catch (Exception e) {
			
		}
		return updateGymOrderRefundResult;
	}
	
	// Member 환불포인트 업데이트
	@Override
	public int updatePointRefund(Map<String, Object> params) {
		int updatePointRefundResult = 0;
		System.out.println("hsGymDaoImpl updatePointRefund start...");
		
		try {
			System.out.println("updateMember check: " +params);
			updatePointRefundResult = session.update("hsUpdatePointRefund", params);
			System.out.println("hsGymDaoImpl updatePointRefund updatePointRefundResult->  " + updatePointRefundResult);
		} catch (Exception e) {
			
		}
		return updatePointRefundResult;
	}


}