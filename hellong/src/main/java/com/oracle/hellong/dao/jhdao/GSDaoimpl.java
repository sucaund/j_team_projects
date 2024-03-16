package com.oracle.hellong.dao.jhdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.GS;
import com.oracle.hellong.model.Gym;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class GSDaoimpl implements GSDao {

	private final SqlSession session;

	//서비스 리스트 불러오기
	@Override
	public int totalService(int g_id) {
		int totalService = 0;
		try {
			totalService = session.selectOne("totalService",g_id);
		} catch (Exception e) {
			System.out.println("GSDaoimpl totalService Exception -> "+e.getMessage());
		}
		return totalService;
	}

	@Override
	public List<GS> serviceList(GS gs) {
		List <GS> serviceList = null;
		try {							    
			serviceList = session.selectList("serviceList",gs);
			System.out.println("GSDaoimpl serviceList serviceList.size()->"+serviceList.size());
		} catch (Exception e) {
			System.out.println("GSDaoimpl serviceList Exception -> "+e.getMessage());
		}
		return serviceList;
	}
	
	//서비스 추가
	@Override
	public int createService(GS gs) {
		int createService = 0;
		System.out.println("GSDaoimpl createService"+ gs);
		try {
			createService = session.insert("createService",gs);
		} catch (Exception e) {
			System.out.println("GSDaoimpl createService Exception -> "+e.getMessage());
		}
		return createService;
	}
	
	@Override
	public GS fetchServiceDetails(int sNumber) {
		GS fetchServiceDetails = null;
		System.out.println("GSDaoimpl fetchServiceDetails"+ sNumber);
		try {
			fetchServiceDetails = session.selectOne("fetchServiceDetails",sNumber);
			System.out.println(fetchServiceDetails);
		} catch (Exception e) {
			System.out.println("GSDaoimpl fetchServiceDetails Exception -> "+e.getMessage());
		}
		return fetchServiceDetails;
	}
	
	
	//서비스 수정
	@Override
	public int updateService(GS sNumber) {
		int updateService = 0;
		System.out.println("GSDaoimpl updateService"+ sNumber);
		try {
			updateService = session.update("updateService",sNumber);
		} catch (Exception e) {
			System.out.println("GSDaoimpl updateService Exception -> "+e.getMessage());
		}
		return updateService;
	}


	@Override
	public int deleteService(int s_number) {
		int deleteService = 0;
		System.out.println("GSDaoimpl deleteService"+ s_number);
		try {
			deleteService = session.delete("deleteService",s_number);
		} catch (Exception e) {
			System.out.println("GSDaoimpl deleteService Exception -> "+e.getMessage());
		}
		return deleteService;
	}

	//서비스 검색
	@Override
	public int getTotalSearchService(GS gs) {
		int getTotalSearchServiceResult = 0;
		try {
			getTotalSearchServiceResult = session.selectOne("getTotalSearchService",gs);
			System.out.println("GSDaoimpl getTotalSearchService->"+getTotalSearchServiceResult);
		} catch (Exception e) {
			System.out.println("GSDaoimpl getTotalSearchService Exception -> "+e.getMessage());
		}
		return getTotalSearchServiceResult;
	}

	@Override
	public List<GS> getListSearchService(GS gs) {
		List <GS> getListSearchServiceResult = null;
		try {							    
			getListSearchServiceResult = session.selectList("getListSearchService",gs);
			System.out.println("GSDaoimpl getListSearchService serviceList.size()->"+getListSearchServiceResult.size());
		} catch (Exception e) {
			System.out.println("GSDaoimpl getListSearchService Exception -> "+e.getMessage());
		}
		return getListSearchServiceResult;
	}

	

	// 체육관 홍보 글 상세에서 서비스 리스트 띄우기***************************************************
	@Override
	public List<GS> getSelectServiceList(int g_id) {
		List <GS> getSelectServiceListResult = null;
		try {							    
			getSelectServiceListResult = session.selectList("getSelectServiceList",g_id);
			System.out.println("GSDaoimpl getSelectServiceList getSelectServiceListResult.size()->"+getSelectServiceListResult.size());
		} catch (Exception e) {
			System.out.println("GSDaoimpl getSelectServiceListResult Exception -> "+e.getMessage());
		}
		return getSelectServiceListResult;
	}



	
	
	
}
