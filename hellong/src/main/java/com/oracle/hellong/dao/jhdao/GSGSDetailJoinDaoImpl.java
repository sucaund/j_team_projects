package com.oracle.hellong.dao.jhdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.GS;
import com.oracle.hellong.model.GSGSDetailJoin;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class GSGSDetailJoinDaoImpl implements GSGSDetailJoinDao {
	private final SqlSession session;

	@Override
	public List<GSGSDetailJoin> serviceList(GS gs) {
		List<GSGSDetailJoin> serviceListResult = null;
		try {							    
			serviceListResult = session.selectList("serviceListJoin",gs);
			System.out.println("GSGSDetailJoinDaoImpl serviceList serviceListResult.size()->"+serviceListResult.size());
		} catch (Exception e) {
			System.out.println("GSGSDetailJoinDaoImpl serviceList Exception -> "+e.getMessage());
		}
		return serviceListResult;
	}

	@Override
	public List<GSGSDetailJoin> getSelectServiceList(int g_id) {
		List<GSGSDetailJoin> getSelectServiceListResult = null;
		try {							    
			getSelectServiceListResult = session.selectList("getSelectServiceJoinList",g_id);
			System.out.println("GSGSDetailJoinDaoImpl getSelectServiceList ->"+getSelectServiceListResult);
		} catch (Exception e) {
			System.out.println("GSGSDetailJoinDaoImpl getSelectServiceList Exception -> "+e.getMessage());
		}
		return getSelectServiceListResult;
	}
	
}
