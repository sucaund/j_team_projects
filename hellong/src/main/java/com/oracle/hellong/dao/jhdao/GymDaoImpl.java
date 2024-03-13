package com.oracle.hellong.dao.jhdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.Gym;
import com.oracle.hellong.model.Member;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class GymDaoImpl implements GymDao {

	private final SqlSession session;

	@Override
	public int totalGym() {
		int totalGmpCount = 0;
		try {
			totalGmpCount = session.selectOne("com.oracle.hellong.GymMapper.gymTotal");
		} catch (Exception e) {
			System.out.println("GymDaoImpl totalGym Exception -> "+e.getMessage());
		}
		return totalGmpCount;
	}

	@Override
	public List<Gym> listGym(Gym gym) {
		List <Gym> gymList = null;
		try {							    
			gymList = session.selectList("jhGymListAll",gym);
			System.out.println("GymDaoImpl listEmp gymList.size()->"+gymList.size());
		} catch (Exception e) {
			System.out.println("GymDaoImpl listGym Exception -> "+e.getMessage());
		}
		
		return gymList;
	}

	@Override
	public List<Gym> manageList(Gym gym) {
		List <Gym> manageList = null;
		try {							    
			manageList = session.selectList("jhGymListManage",gym);
			System.out.println("GymDaoImpl manageList.size()->"+manageList.size());
		} catch (Exception e) {
			System.out.println("GymDaoImpl manageList Exception -> "+e.getMessage());
		}
		
		return manageList;
	}
	
	
	
	
	// 체육관 관리 상세*****************************************************************************
	@Override
	public List<Gym> gymList(int m_id) {
		List <Gym> gymList = null;
		try {							    
			gymList = session.selectList("jhGymListManager",m_id);
			System.out.println("GymDaoImpl gymList gymList.size()->"+gymList.size());
		} catch (Exception e) {
			System.out.println("GymDaoImpl gymList Exception -> "+e.getMessage());
		}
		return gymList;
	}
	
	// 체육관 홍보 글 화면 이동***********************************************************************
	@Override
	public List<Gym> createGymPost(int g_id) {
		List <Gym> createGymPost = null;
		try {							    
			createGymPost = session.selectList("jhcreateGymPost",g_id);
		} catch (Exception e) {
			System.out.println("GymDaoImpl createGymPost Exception -> "+e.getMessage());
		}
		return createGymPost;
	}
	

	
	
	
	

	// 트레이너 리스트 추가 용 id***************************************************************************
	@Override
	public int gymId(int g_id) {
		int gymId =0;
		try {
			gymId = session.selectOne("gymIdTrainer",g_id);
		}catch(Exception e) {
			System.out.println("GymDaoImpl gymId Exception -> "+e.getMessage());
		}
		return gymId;
	}


	// 세션에 g_id 추가하기***************************************************************************************
	@Override
	public List <Gym> jhGetGymIdSelect(String m_id) {
		List <Gym> jhGetGymIdSelectResult = null;
		try {
			jhGetGymIdSelectResult = session.selectList("jhGetGymIdSelect",m_id);
		}catch(Exception e) {
			System.out.println("GymDaoImpl jhGetGymIdSelect Exception -> "+e.getMessage());
		}
		return jhGetGymIdSelectResult;
	}
	
	
	
}
