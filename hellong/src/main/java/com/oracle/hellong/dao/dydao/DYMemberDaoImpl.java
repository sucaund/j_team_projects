package com.oracle.hellong.dao.dydao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class DYMemberDaoImpl implements DYMemberDao {

	private final SqlSession session;
	
}
