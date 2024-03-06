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
	public List<GymBoardJoin> gymAddress() {
		List<GymBoardJoin> gymAddress = null;
		try {
			gymAddress = session.selectList("gymAddress");
			System.out.println(gymAddress.size());
		}catch(Exception e) {
			System.out.println("GymBoardJoinDaoImpl gymAddress Exception -> "+e.getMessage());
		}		
		return gymAddress;
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
