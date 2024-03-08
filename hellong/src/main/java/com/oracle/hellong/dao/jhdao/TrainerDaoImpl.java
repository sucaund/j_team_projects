package com.oracle.hellong.dao.jhdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.Gym;
import com.oracle.hellong.model.Trainer;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class TrainerDaoImpl implements TrainerDao {

	private final SqlSession session;

	@Override
	public int totalTrainer(int g_id) {
		int totalTrainer = 0;
		try {
			totalTrainer = session.selectOne("totalTrainer",g_id);
		} catch (Exception e) {
			System.out.println("TrainerDaoImpl totalTrainer Exception -> "+e.getMessage());
		}
		return totalTrainer;
	}
	
	@Override
	public List<Trainer> trainerList(Trainer trainer) {
		List <Trainer> trainerList = null;
		try {							    
			trainerList = session.selectList("trainerList",trainer);
			System.out.println("TrainerDaoImpl listEmp gymList.size()->"+trainerList.size());
		} catch (Exception e) {
			System.out.println("TrainerDaoImpl listGym Exception -> "+e.getMessage());
		}
		
		return trainerList;
	}

	// 트레이너 추가
	@Override
	public int insertTrainer(Trainer trainer) {
		int trainerInsert = 0;
		try {
			trainerInsert = session.insert("trainerInsert", trainer);
		}catch(Exception e) {
			System.out.println("TrainerDaoImpl insertTrainer Exception -> "+e.getMessage());			
		}
		return trainerInsert;
	}
	//트레이너 등록확인
	@Override
	public List<Trainer> gymIdTrainerId(Trainer trainer) {
		List<Trainer>gymIdTrainerId = null;
		try {							    
			gymIdTrainerId = session.selectList("gymIdTrainerId",trainer);
			System.out.println("TrainerDaoImpl gymIdTrainerId gymList.size()->"+gymIdTrainerId.size());
		} catch (Exception e) {
			System.out.println("TrainerDaoImpl gymIdTrainerId Exception -> "+e.getMessage());
		}
		return gymIdTrainerId;
	}


	
}
