package com.oracle.hellong.dao.dydao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class DYBoardRecommendDaoImpl implements DYBoardRecommendDao {
	private final SqlSession session;

	@Override
    public int checkRecommendation(int m_number, int b_number) {
        Map<String, Object> params = new HashMap<>();
        params.put("m_number", m_number);
        params.put("b_number", b_number);

        int checkRecommendation = 0;
        System.out.println("DYBoardRecommendDaoImpl checkRecommendation Start...");
        checkRecommendation = session.selectOne("dyCheckRecommendation", params);

        return checkRecommendation;
    }
}
