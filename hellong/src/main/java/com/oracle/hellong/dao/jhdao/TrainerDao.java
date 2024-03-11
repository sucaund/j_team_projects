package com.oracle.hellong.dao.jhdao;

import java.util.List;

import com.oracle.hellong.model.Trainer;

public interface TrainerDao {

	int totalTrainer(int g_id);
	List<Trainer> trainerList(Trainer trainer);
	// 트레이너 추가
	int insertTrainer(Trainer trainer);
	List<Trainer> gymIdTrainerId(Trainer trainer);
	// 트레이너 개인별 조회
	Trainer getTrainerById(int trainerId);
	// 트레이너 수정
	int updateTrainer(Trainer trainer);
	// 트레이너 삭제
	int getDeleteTrainer(int t_id);



}