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
	
	//지점찾기 글 카운트 조회
	@Override
	public int getGymImformationCount() {
		int getGymImformationCountResult =0;
		try {
			getGymImformationCountResult = session.selectOne("getGymImformationCount");
			System.out.println("GymBoardJoinDaoImpl getGymImformationCount"+getGymImformationCountResult);
		}catch(Exception e) {
			System.out.println("GymBoardJoinDaoImpl getGymImformationCount Exception -> "+e.getMessage());
		}		
		return getGymImformationCountResult;
	}
	
	
}