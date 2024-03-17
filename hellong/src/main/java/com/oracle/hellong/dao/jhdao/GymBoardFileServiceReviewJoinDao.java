package com.oracle.hellong.dao.jhdao;

import java.util.List;

import com.oracle.hellong.model.GymBoardServiceJoin;

public interface GymBoardServiceJoinDao {

	List<GymBoardServiceJoin> getMinPrice(GymBoardServiceJoin gymBoardServiceJoin);

}
