package com.oracle.hellong.dao.dydao;

import java.util.List;

import com.oracle.hellong.model.GymBoard;

public interface DYGymBoardDao {

	List<GymBoard> searchGymBoards(GymBoard gymBoard);

}