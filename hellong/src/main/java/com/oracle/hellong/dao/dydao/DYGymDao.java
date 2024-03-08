package com.oracle.hellong.dao.dydao;

import java.util.List;

import com.oracle.hellong.model.Gym;

public interface DYGymDao {

	List<Gym> searchGyms(Gym gym);

}
