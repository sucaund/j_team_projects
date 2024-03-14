package com.oracle.hellong.dao.jhdao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class GymOrderDaoImpl implements GymOrderDao {
	private final SqlSession session;
}
