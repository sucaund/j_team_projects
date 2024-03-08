package com.oracle.hellong.dao.jhdao;

import java.util.List;

import com.oracle.hellong.model.Trainer;

public interface TrainerDao {

	int totalTrainer(int g_id);
	List<Trainer> trainerList(Trainer trainer);
	// 트레이너 추가
	int insertTrainer(Trainer trainer);
	List<Trainer> gymIdTrainerId(Trainer trainer);


}
