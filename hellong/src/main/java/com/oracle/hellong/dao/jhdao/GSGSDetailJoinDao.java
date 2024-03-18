package com.oracle.hellong.dao.jhdao;

import java.util.List;

import com.oracle.hellong.model.GS;
import com.oracle.hellong.model.GSGSDetailJoin;

public interface GSGSDetailJoinDao {
	
	// 서비스 리스트 가져오기
	List<GSGSDetailJoin> serviceList(GS gs);

	// 체육관 홍보글 게시글
	List<GSGSDetailJoin> getSelectServiceList(int g_id);

}
