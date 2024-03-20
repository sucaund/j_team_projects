package com.oracle.hellong.dao.dydao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.RecommCheck;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class DYRecommCheckDaoImpl implements DYRecommCheckDao {

	private final SqlSession session;

	@Override
	public RecommCheck checkRecomm(int b_number, int m_number) {
		Map<String, Object> params = new HashMap<>();
        params.put("b_number", b_number);
        params.put("m_number", m_number);
       
        return session.selectOne("dyCheckRecomm", params);
		
	}

	@Override
	public void insertRecomm(RecommCheck rec) {
		session.insert("dyInsertRecomm", rec);
		
	}

	


}
