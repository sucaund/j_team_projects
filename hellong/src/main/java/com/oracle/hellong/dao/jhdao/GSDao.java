package com.oracle.hellong.dao.jhdao;

import java.util.List;

import com.oracle.hellong.model.GS;

public interface GSDao {

	//서비스 리스트 불러오기
	int totalService(int g_id);
	List<GS> serviceList(GS gs);

	//서비스 추가
	int createService(GS gs);
	
	// 서비스 불러오기
	GS fetchServiceDetails(int sNumber);
	
	//서비스 수정
	int updateService(GS sNumber);

	//서비스 삭제
	int deleteService(int s_number);
	
	// 체육관 홍보 글 상세에서 서비스 리스트 띄우기***************************************************
	List<GS> getSelectServiceList(int g_id);



}
