package com.oracle.hellong.dao.dydao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.GymBoard;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class DYGymBoardDaoImpl implements DYGymBoardDao {

	private final SqlSession session;

	@Override
	public List<GymBoard> searchGymBoards(GymBoard gymBoard) {
		List<GymBoard> searchGymBoards = null;

		searchGymBoards = session.selectList("dySearchGymBoards", gymBoard);
		return searchGymBoards;
	}

}