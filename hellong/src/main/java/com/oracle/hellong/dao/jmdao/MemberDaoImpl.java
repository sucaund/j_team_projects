package com.oracle.hellong.dao.jmdao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberDaoImpl implements MemberDao {

	  private final SqlSession session;
	

	
}
