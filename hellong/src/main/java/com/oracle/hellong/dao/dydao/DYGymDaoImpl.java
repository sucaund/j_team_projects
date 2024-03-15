package com.oracle.hellong.dao.dydao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.Gym;

import lombok.RequiredArgsConstructor;


@Repository
@RequiredArgsConstructor
public class DYGymDaoImpl implements DYGymDao {
	
	private final SqlSession session;
	
	@Override
	public List<Gym> searchGyms(Gym gym) {
		List<Gym> searchGyms = null;
		searchGyms = session.selectList("dySearchGyms", gym);
		return searchGyms;
	}

}