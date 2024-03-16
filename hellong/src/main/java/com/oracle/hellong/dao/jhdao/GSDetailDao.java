package com.oracle.hellong.dao.jhdao;

import java.util.List;

import com.oracle.hellong.model.GS;
import com.oracle.hellong.model.GSGSDetailJoin;

public interface GSDetailDao {

	// 섭비스 추가시 서비스 디테일 추가
	int getCreateServiceDetail(GS gs);
	// 서비스 수정시 기존 서비스 만료 및 enddate삽입
	int updateServiceDetail(GS gs);
	// 서비스 검색
	List<GSGSDetailJoin> getListSearchService(GS gs);

}