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
	
	//트레이너 조회
	@Override
	public Trainer getTrainerById(int trainerId) {
		Trainer getTrainerById = null;
		try {							    
			getTrainerById = session.selectOne("getTrainerById",trainerId);
			System.out.println("TrainerDaoImpl getTrainerById select->"+getTrainerById);
		} catch (Exception e) {
			System.out.println("TrainerDaoImpl getTrainerById Exception -> "+e.getMessage());
		}
		return getTrainerById;
	}
	
	// 트레이너 수정
	@Override
	public int updateTrainer(Trainer trainer) {
		System.out.println("************** TrainerDaoImpl updateTrainer**********"+trainer);
		int updateTrainerResult = 0;
		try {							    
			updateTrainerResult = session.update("updateTrainer",trainer);
			System.out.println("TrainerDaoImpl updateTrainer updateCount->"+updateTrainerResult);
		} catch (Exception e) {
			System.out.println("TrainerDaoImpl updateTrainer Exception -> "+e.getMessage());
		}
		return updateTrainerResult;
	}
	

	//트레이너 삭제
	@Override
	public int getDeleteTrainer(int t_id) {
		int trainerDelete = 0;
		try {							    
			trainerDelete = session.delete("getDeleteTrainer",t_id);
			System.out.println("TrainerDaoImpl getDeleteTrainer delete->"+trainerDelete);
		} catch (Exception e) {
			System.out.println("TrainerDaoImpl getDeleteTrainer Exception -> "+e.getMessage());
		}
		return trainerDelete;
	}

	@Override
	public List<Trainer> getSelectTrainerList(int g_id) {
		List<Trainer> getSelectTrainerListResult = null;
		try {							    
			getSelectTrainerListResult = session.selectList("getSelectTrainerList",g_id);
			System.out.println("TrainerDaoImpl getSelectTrainerList->"+getSelectTrainerListResult.size());
		} catch (Exception e) {
			System.out.println("TrainerDaoImpl getSelectTrainerList Exception -> "+e.getMessage());
		}
		return getSelectTrainerListResult;
	}

	@Override
	public int getTotaltrainerSearch(Trainer trainer) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Trainer> getTrainerSearchList(Trainer trainer) {
		// TODO Auto-generated method stub
		return null;
	}


	
}