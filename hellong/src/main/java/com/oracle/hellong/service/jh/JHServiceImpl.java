package com.oracle.hellong.service.jh;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.hellong.dao.jhdao.GSDao;
import com.oracle.hellong.dao.jhdao.GymBoardDao;
import com.oracle.hellong.dao.jhdao.GymBoardFileDao;
import com.oracle.hellong.dao.jhdao.GymBoardFileJoinDao;
import com.oracle.hellong.dao.jhdao.GymBoardJoinDao;
import com.oracle.hellong.dao.jhdao.GymBoardReviewJoinDao;
import com.oracle.hellong.dao.jhdao.GymBoardServiceJoinDao;
import com.oracle.hellong.dao.jhdao.GymDao;
import com.oracle.hellong.dao.jhdao.GymMemberServiceOrderJoinDao;
import com.oracle.hellong.dao.jhdao.MemberDao;
import com.oracle.hellong.dao.jhdao.TrainerDao;
import com.oracle.hellong.model.GS;
import com.oracle.hellong.model.Gym;
import com.oracle.hellong.model.GymBoard;
import com.oracle.hellong.model.GymBoardFile;
import com.oracle.hellong.model.GymBoardFileJoin;
import com.oracle.hellong.model.GymBoardJoin;
import com.oracle.hellong.model.GymBoardReviewJoin;
import com.oracle.hellong.model.GymBoardServiceJoin;
import com.oracle.hellong.model.GymMemberServiceOrderJoin;
import com.oracle.hellong.model.MemberGym;
import com.oracle.hellong.model.Trainer;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class JHServiceImpl implements JHService {

	private final GymDao gd;
	private final MemberDao md;
	private final GymBoardDao gbd;
	private final GymBoardFileDao gbfd;
	private final GymBoardJoinDao gbjd; 
	private final GymBoardFileJoinDao gbfjd;
	private final TrainerDao td;
	private final GSDao gsd;
	private final GymMemberServiceOrderJoinDao gmsojd;
	private final GymBoardReviewJoinDao gbrjd;
	private final GymBoardServiceJoinDao gbsjd;
	
	private final GymBoardFileProcessor gymBoardFileProcessor;
	private final TrainerFileProcessor trainerFileProcessor;

	@Override
	public int totalGym() {
		int totalGmpCnt = gd.totalGym();
		return totalGmpCnt;
	}

	@Override
	public List<Gym> listGym(Gym gym) {
		List<Gym> gymList = gd.listGym(gym);
		return gymList;
	}

	// 체육관이 승인된 회원
	// 리스트********************************************************************
	@Override
	public List<MemberGym> listGym(MemberGym memberGym) {
		List<MemberGym> memberGymList = null;
		memberGymList = md.memberGymList(memberGym);
		return memberGymList;
	}

	@Override
	public int totalConfirmed() {
		int totConCount = md.totConCount();
		return totConCount;
	}

	// 체육관 관리
	// 상세*****************************************************************************
	@Override
	public List<Gym> manageList(int m_id) {
		List<Gym> gymList = null;
		gymList = gd.gymList(m_id);
		return gymList;
	}

	// 체육관 홍보 글 화면
	// 이동***********************************************************************
	@Override
	public int gymForm(Gym g_id) {
		int gymForm = gbd.gymForm(g_id);
		return gymForm;
	}

	@Override
	public List<GymBoard> gymBoardDetail(Gym g_id) {
		List<GymBoard> selectGymBoard = gbd.gymBoardDetail(g_id);
		return selectGymBoard;
	}

	@Override
	public List<GymBoardFileJoin> selectGymFile(int g_id) {
		List<GymBoardFileJoin> selectGymList = gbfjd.selectGymList(g_id);
		return selectGymList;
	}

	@Override
	public List<Gym> createGymPost(int g_id) {
		List<Gym> gymList = null;
		gymList = gd.createGymPost(g_id);
		return gymList;
	}

	@Override
	public List<GymBoardFile> gbf_idList(Gym g_id) {
		List<GymBoardFile> gbf_idList = null;
		gbf_idList = gbfd.gbf_idList(g_id);
		return gbf_idList;
	}


	@Override
	public void saveGymPost(GymBoard gymboard, Gym gym) throws IOException {
		if (gymboard.getGymBoardFile().get(0).isEmpty()) {
			gymboard.setFileAttached(0);
			int savedGymBoard = gbd.saveGymPost(gymboard);
		} else {
			gymboard.setFileAttached(1);
			int savedGymBoard = gbd.saveGymPost(gymboard);
			for (MultipartFile gymboardFile : gymboard.getGymBoardFile()) {
				gymBoardFileProcessor.processFile(gymboardFile, gym, GymBoardFileProcessor.GymBoardFileAction.SAVE);
			}
		}
	}

	@Override
	public void updateGymPost(GymBoard gymboard, Gym gym) throws IOException {
		gymBoardFileProcessor.deleteFileAndRecord(gym.getG_id());
		if (gymboard.getGymBoardFile().get(0).isEmpty()) {
			gymboard.setFileAttached(0);
			int updateGymPost = gbd.updateGymPost(gymboard);
		} else {
			gymboard.setFileAttached(1);
			int updateGymPost = gbd.updateGymPost(gymboard);
			for (MultipartFile gymboardFile : gymboard.getGymBoardFile()) {
				gymBoardFileProcessor.processFile(gymboardFile, gym, GymBoardFileProcessor.GymBoardFileAction.UPDATE);

			}
		}
	}

	@Override
	public void deleteGymPost(int g_id) throws IOException {
		gymBoardFileProcessor.deleteFileAndRecord(g_id);
		gbd.deleteGymPost(g_id);	
	}


	// 트레이너 리스트
	// 불러오기***********************************************************************
	@Override
	public int totalTrainer(int g_id) {
		int totalTrainer = td.totalTrainer(g_id);
		return totalTrainer;
	}

	@Override
	public List<Trainer> trainerList(Trainer trainer) {
		List<Trainer> trainerList = null;
		trainerList = td.trainerList(trainer);
		return trainerList;
	}

	@Override
	public int gymId(int g_id) {
		int gymId = 0;
		gymId = gd.gymId(g_id);
		return gymId;
	}

	// 트레이너 리스트 추가
	@Override
	public int saveTrainer(Trainer trainer) throws IOException {
		MultipartFile trainerPhotoFile = trainer.getTrainerPhotoFile();
		Trainer trPhotoFile = trainerFileProcessor.processFile(trainerPhotoFile, trainer);
		int insertTrainer = td.insertTrainer(trPhotoFile);
		return insertTrainer;
	}

	// 트레이너 추가 결과
	@Override
	public List<Trainer> gymIdTrainerId(Trainer trainer) {
		List<Trainer> gymIdTrainerId = td.gymIdTrainerId(trainer);
		return gymIdTrainerId;
	}
	
	//트레이너 조회
	@Override
	public Trainer getTrainerById(int trainerId) {
		Trainer trainerDetail = td.getTrainerById(trainerId);
		return trainerDetail;
	}
	
	// 트레이너 수정
	@Override
	public int updateTrainer(Trainer trainer) throws IOException {
		Trainer trainerFile = td.getTrainerById(trainer.getT_id());		
		if (trainerFile.getT_photostoredname() != null) {
			trainerFileProcessor.deleteFileAndRecord(trainerFile);
		}
		MultipartFile trainerPhotoFile = trainer.getTrainerPhotoFile();
		Trainer trPhotoFile = trainerFileProcessor.processFile(trainerPhotoFile, trainer);
		int updateTrainerCount = td.updateTrainer(trPhotoFile);
		return updateTrainerCount;	
	}
				

	//트레이너 삭제
	@Override
	public int getDeleteTrainer(int t_id) {
		int deleteCount = td.getDeleteTrainer(t_id);
		return deleteCount;
	}


	// 체육관 서비스 리스트
	// 불러오기***********************************************************************
	@Override
	public int totalService(int g_id) {
		int totalService = gsd.totalService(g_id);
		return totalService;
	}

	@Override
	public List<GS> serviceList(GS gs) {
		List<GS> serviceList = gsd.serviceList(gs);
		return serviceList;
	}

	// 서비스 추가
	@Override
	public int createService(GS gs) {
		int createService = gsd.createService(gs);
		return createService;
	}

	@Override
	public GS fetchServiceDetails(int sNumber) {
		GS fetchServiceDetails = gsd.fetchServiceDetails(sNumber);
		return fetchServiceDetails;
	}
	
	// 서비스 수정
	@Override
	public int updateService(GS sNumber) {
		int updateService = gsd.updateService(sNumber);
		return updateService;
	}


	// 서비스 삭제
	@Override
	public int deleteService(int s_number) {
		int deleteService = gsd.deleteService(s_number);
		return deleteService;
	}
	
	// 체육관 회원 리스트****************************************************************************************************************************
	@Override
	public List<GymMemberServiceOrderJoin> getGymMemberList(GymMemberServiceOrderJoin gymMemberServiceOrderJoin) {
		List<GymMemberServiceOrderJoin> getGymMemberListResult = gmsojd.getGymMemberList(gymMemberServiceOrderJoin);
		return getGymMemberListResult;
	}

	@Override
	public int getTotalGymMemberList(int g_id) {
		int totCountList = gmsojd.getTotalGymMemberList(g_id);
		return totCountList;
	}

	@Override
	public int getSumSale(int g_id) {
		int sumSaleResult = gmsojd.getSumSale(g_id);
		return sumSaleResult;
	}

	@Override
	public Map<String, Double> getGenderRatio(int g_id) {
		Map<String, Double> getGenderRatioResult = gmsojd.getGenderRatio(g_id);
		return getGenderRatioResult;
	}

	@Override
	public Map<String, Double> getAgeRatio(int g_id) {
		Map<String, Double> getAgeRatioResult = gmsojd.getAgeRatio(g_id);
		return getAgeRatioResult;
	}

	//체육관 지점 찾기*****************************************************************************
	@Override
	public List<GymBoardJoin> gymGymBoardList(GymBoardJoin gymBoardJoin) {
		List<GymBoardJoin> gymGymBoardListResult =gbjd.gymGymBoardList(gymBoardJoin);
		return gymGymBoardListResult;
	}
	@Override
	public List<GymBoardFile> gymBoardFileList(GymBoardFile gymBoardFile) {
		List<GymBoardFile> gymBoardFileList = gbfd.gymBoardFileList(gymBoardFile);
		return gymBoardFileList;
	}
	
	@Override
	public int getGymImformationCount() {
		int getGymImformationCountResult = gbjd.getGymImformationCount();
		return getGymImformationCountResult;
	}
	
	//리뷰 평균점수
	@Override
	public List<GymBoardReviewJoin> getAvgReview(GymBoardReviewJoin gymBoardReviewJoin) {
		List<GymBoardReviewJoin> getAvgReviewResult = gbrjd.getAvgReview(gymBoardReviewJoin);
		return getAvgReviewResult;
	}
	
	//체육관 별 서비스 중 최저가
	@Override
	public List<GymBoardServiceJoin> getMinPrice(GymBoardServiceJoin gymBoardServiceJoin) {
		List<GymBoardServiceJoin> getMinPriceResult = gbsjd.getMinPrice(gymBoardServiceJoin);
		return getMinPriceResult;
	}
	
	
	
	// 지점 찾기 글 상세****************************************************************************
	@Override
	public List<GymBoardJoin> gymBoardDetailRead(int g_id) {
		List<GymBoardJoin> gymBoardDetailRead = gbjd.gymBoardDetailRead(g_id);
		return gymBoardDetailRead;
	}
	
	//사진가져오기
	@Override
	public List<GymBoardFile> gymBoardFileListRead(int g_id) {
		List<GymBoardFile> gymBoardFileListRead = gbfd.gymBoardFileListRead(g_id);
		return gymBoardFileListRead;
	}
	
	//평점,리뷰 카운트 가져오기
	@Override
	public GymBoardReviewJoin getAvgReviewSelect(int g_id) {
		GymBoardReviewJoin GymBoardReviewJoinResult = gbrjd.getAvgReviewSelect(g_id);
		return GymBoardReviewJoinResult;
	}

	//서비스 리스트 가져오기
	@Override
	public List<GS> getSelectServiceList(int g_id) {
		List <GS> getSelectServiceListResult = gsd.getSelectServiceList(g_id);
		return getSelectServiceListResult;
	}
	
	//트레이너 리스트 가져오기
	@Override
	public List<Trainer> getSelectTrainerList(int g_id) {
		List<Trainer> getSelectTrainerListResult = null;
		return getSelectTrainerListResult;
	}

	//세션에서 g_id 받아오기**********************************************************************************************************
	@Override
	public List<Gym> jhGetGymIdSelect(String m_id) {
		List<Gym> jhGetGymIdSelectResult = gd.jhGetGymIdSelect(m_id);
		return jhGetGymIdSelectResult;
	}
















}