package com.oracle.hellong.dao.jhdao;

import java.util.List;
import java.util.Map;

import com.oracle.hellong.model.GymMemberServiceOrderJoin;

public interface GymMemberServiceOrderJoinDao {

	List<GymMemberServiceOrderJoin> getGymMemberList(GymMemberServiceOrderJoin gymMemberServiceOrderJoin);

	int getTotalGymMemberList(int g_id);

	int getSumSale(int g_id);

	Map<String, Double> getGenderRatio(int g_id);

	Map<String, Double> getAgeRatio(int g_id);

}