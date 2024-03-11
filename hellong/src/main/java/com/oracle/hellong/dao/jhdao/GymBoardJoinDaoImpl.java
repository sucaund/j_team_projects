package com.oracle.hellong.dao.jhdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.GymBoardFile;
import com.oracle.hellong.model.GymBoardJoin;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class GymBoardJoinDaoImpl implements GymBoardJoinDao {
	
	private final SqlSession session;

	@Override
	public List<GymBoardJoin> gymGymBoardList() {
		List<GymBoardJoin> gymGymBoardResult = null;
		try {
			gymGymBoardResult = session.selectList("gymGymBoard");
			System.out.println(gymGymBoardResult.size());
		}catch(Exception e) {
			System.out.println("GymBoardJoinDaoImpl gymAddress Exception -> "+e.getMessage());
		}		
		return gymGymBoardResult;
	}

	@Override
	public List<GymBoardJoin> gymBoardDetailRead(int g_id) {
		List<GymBoardJoin> gymBoardDetailRead = null;
		try {
			gymBoardDetailRead = session.selectList("gymBoardDetailRead",g_id);
			System.out.println("GymBoardJoinDaoImpl gymBoardDetailRead"+gymBoardDetailRead.size());
		}catch(Exception e) {
			System.out.println("GymBoardJoinDaoImpl gymAddress Exception -> "+e.getMessage());
		}		
		return gymBoardDetailRead;
	}
	
	
}
