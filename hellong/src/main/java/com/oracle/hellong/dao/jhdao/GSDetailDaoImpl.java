package com.oracle.hellong.dao.jhdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.GS;
import com.oracle.hellong.model.GSGSDetailJoin;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class GSDetailDaoImpl implements GSDetailDao {

	private final SqlSession session;

	@Override
	public int getCreateServiceDetail(GS gs) {
		int getCreateServiceDetailResult = 0;
		try {
			getCreateServiceDetailResult = session.insert("getCreateServiceDetail",gs);
		} catch (Exception e) {
			System.out.println("GSDetailDaoImpl getCreateServiceDetail Exception->"+e.getMessage());
		}
		return getCreateServiceDetailResult;
	}

	@Override
	public int updateServiceDetail(GS gs) {
		int updateServiceDetailResult = 0;
		try {
			updateServiceDetailResult = session.update("updateServiceDetail",gs);
		} catch (Exception e) {
			System.out.println("GSDetailDaoImpl updateServiceDetail Exception->"+e.getMessage());
		}
		return updateServiceDetailResult;
	}

	@Override
	public List<GSGSDetailJoin> getListSearchService(GS gs) {
		List<GSGSDetailJoin> getListSearchServiceResult = null;
		try {
			getListSearchServiceResult = session.selectList("getListSearchService",gs);
		} catch (Exception e) {
			System.out.println("GSDetailDaoImpl getListSearchService Exception->"+e.getMessage());
		}
		return getListSearchServiceResult;
	}
	
}
