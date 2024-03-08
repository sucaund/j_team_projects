package com.oracle.hellong.dao.hsdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.GymOrder;
import com.oracle.hellong.model.Member;
import com.oracle.hellong.model.PointCharge;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class PointDaoImpl implements PointDao {

	private final SqlSession session;

	/*
	 * @Override public int condTotalListPoint(Member member) { int
	 * condTotalListPointCnt = 0;
	 * System.out.println("PointDaoImpl condTotalListPoint start...");
	 * 
	 * try { condTotalListPointCnt =
	 * session.selectOne("com.oracle.hellong.MemberMapper.hsCondTotalListPointCount"
	 * ); } catch (Exception e) {
	 * System.out.println("PointDaoImpl condTotalListPoint Exception ->" +
	 * e.getMessage()); } return condTotalListPointCnt; }
	 */

	@Override
	public int totalListPointCharge(int m_number) {
		int totalListPointChargeCnt = 0;
		System.out.println("PointDaoImpl totalListPointCharge start...");
		
		try { 
			totalListPointChargeCnt = session.selectOne("com.oracle.hellong.PointChargeMapper.hsTotalListPointChargeCnt", m_number);
			System.out.println("PointDaoImpl totalListPointCharge totalListPointChargeCnt ->" + totalListPointChargeCnt);
		} catch (Exception e) {
			System.out.println("PointDaoImpl totalListPointCharge Exception ->" + e.getMessage()); 
		} 
		return totalListPointChargeCnt;
	}
	
	@Override
	public List<PointCharge> listPointCharge(int m_number) {
		List<PointCharge> listPoint = null;
		System.out.println("PointDaoImpl listPointCharge start...");

		try {
			listPoint = session.selectList("hsListPointCharge", m_number);
			System.out.println("PointDaoImpl totalListPointCharge listPoint.size()->" + listPoint.size());
		} catch (Exception e) {
			System.out.println("PointDaoImpl listPointCharge Exception ->" + e.getMessage());
		}
		return listPoint;
	}

	@Override
	public int totalListGymOrderDeal(Member member) {
		int totalListGymOrderDealCnt = 0;
		System.out.println("PointDaoImpl totalListGymOrderDeal start...");
		try { totalListGymOrderDealCnt = session.selectOne("com.oracle.hellong.GymOrderMapper.hsTotalListGymOrderDealCnt");
		} catch (Exception e) {
			System.out.println("PointDaoImpl totalListGymOrderDeal Exception ->" + e.getMessage()); 
		} 
		return totalListGymOrderDealCnt;
	}

	@Override
	public List<GymOrder> listGymOrderDeal(Member member) {
		List<GymOrder> listPoint = null;
		System.out.println("PointDaoImpl listGymOrderDeal start...");

		try {
			listPoint = session.selectList("hsListGymOrderDeal", member);
		} catch (Exception e) {
			System.out.println("PointDaoImpl listGymOrderDeal Exception ->" + e.getMessage());
		}
		return listPoint;
	}

	@Override
	public int totalListGymOrderRefund(Member member) {
		int totalListGymOrderRefundCnt = 0;
		System.out.println("PointDaoImpl totalListGymOrderRefund start...");
		try { totalListGymOrderRefundCnt = session.selectOne("hsTotalListGymOrderRefundCnt", member);
		} catch (Exception e) {
			System.out.println("PointDaoImpl totalListGymOrderRefund Exception ->" + e.getMessage()); 
		} 
		return totalListGymOrderRefundCnt;
	}

	@Override
	public List<GymOrder> listGymOrderRefund(Member member) {
		List<GymOrder> listPoint = null;
		System.out.println("PointDaoImpl listGymOrderRefund start...");

		try {
			listPoint = session.selectList("hsListGymOrderRefund", member);
		} catch (Exception e) {
			System.out.println("PointDaoImpl listGymOrderRefund Exception ->" + e.getMessage());
		}
		return listPoint;
	}


}
