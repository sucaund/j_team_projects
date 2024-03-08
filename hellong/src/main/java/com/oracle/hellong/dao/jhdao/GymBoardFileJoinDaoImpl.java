package com.oracle.hellong.dao.jhdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.Gym;
import com.oracle.hellong.model.GymBoardFileJoin;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class GymBoardFileJoinDaoImpl implements GymBoardFileJoinDao {
	
	private final SqlSession session;
	
	@Override
	public List<GymBoardFileJoin> selectGymList(int g_id) {
		List <GymBoardFileJoin> GymBoardFileJoinList = null;
		try {							    
			GymBoardFileJoinList = session.selectList("selectGymList",g_id);
			System.out.println("GymDaoImpl listEmp gymList.size()->"+GymBoardFileJoinList.size());
		} catch (Exception e) {
			System.out.println("GymDaoImpl listGym Exception -> "+e.getMessage());
		}
		
		return GymBoardFileJoinList;
	}
	
	// 지점 찾기
	@Override
	public List<GymBoardFileJoin> gymBoardFileList() {
		List <GymBoardFileJoin> gymBoardFileList = null;
		try {							    
			gymBoardFileList = session.selectList("gymBoardFileList");
			System.out.println("GymBoardFileJoinDaoImpl gymBoardFileList.size()->"+gymBoardFileList.size());
		} catch (Exception e) {
			System.out.println("GymBoardFileJoinDaoImpl gymBoardFileList Exception -> "+e.getMessage());
		}
		
		return gymBoardFileList;
	}

}
