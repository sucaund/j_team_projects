package com.oracle.hellong.dao.dydao;

import com.oracle.hellong.model.RecommCheck;

public interface DYRecommCheckDao {

	RecommCheck checkRecomm(int b_number, int m_number);

	void insertRecomm(RecommCheck rec);



}
