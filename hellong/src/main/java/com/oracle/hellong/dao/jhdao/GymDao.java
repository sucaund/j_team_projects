package com.oracle.hellong.dao.jhdao;

import java.util.List;

import com.oracle.hellong.model.GS;
import com.oracle.hellong.model.Gym;

public interface GymDao {
	int totalGym();

	List<Gym> listGym(Gym gym);

	List<Gym> manageList(Gym gym);

	
	// 체육관 관리 상세*****************************************************************************
	List<Gym> gymList(int m_id);
	
	// 체육관 홍보 글 화면 이동***********************************************************************
	List<Gym> createGymPost(int g_id);
	

	
	// 트레이너 리스트 추가 용 id***************************************************************************
	int gymId(int g_id);



}
