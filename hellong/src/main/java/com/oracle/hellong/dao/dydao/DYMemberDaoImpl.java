package com.oracle.hellong.dao.dydao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.Member;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class DYMemberDaoImpl implements DYMemberDao {

	private final SqlSession session;

	
}