package com.oracle.hellong.dao.jhdao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class GymReviewDaoImpl implements GymReviewDao {

	private final SqlSession session;


}