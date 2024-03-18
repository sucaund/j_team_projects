package com.oracle.hellong.service.jh;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.oracle.hellong.dao.jhdao.MemberGSGymOrderReviewJoinDao;
import com.oracle.hellong.model.GS;
import com.oracle.hellong.model.GSGSDetailJoin;
import com.oracle.hellong.model.Gym;
import com.oracle.hellong.model.GymBoard;
import com.oracle.hellong.model.GymBoardFile;
import com.oracle.hellong.model.GymBoardFileJoin;
import com.oracle.hellong.model.GymBoardJoin;
import com.oracle.hellong.model.GymBoardReviewJoin;
import com.oracle.hellong.model.GymBoardFileServiceReviewJoin;
import com.oracle.hellong.model.GymMemberServiceOrderJoin;
import com.oracle.hellong.model.GymOrder;
import com.oracle.hellong.model.GymReview;
import com.oracle.hellong.model.MemberGSGymOrderReviewJoin;
import com.oracle.hellong.model.MemberGym;
import com.oracle.hellong.model.Trainer;

public interface JHService {
	int totalGym();

	List<Gym> listGym(Gym gym);
	
	// 체육관이 승인된 회원 리스트**********************************************************************
	int totalConfirmed();
	List<MemberGym> listGym(MemberGym memberGym);

	// 체육관 관리 상세*****************************************************************************
	List<Gym> manageList(int i);

	// 체육관 홍보 글 화면 이동***********************************************************************
	int gymForm(Gym g_id);
	
	List<Gym> createGymPost(int g_id);
	List<GymBoard> gymBoardDetail(Gym g_id);
	List<GymBoardFile> gbf_idList(Gym g_id);
	
	
	//파일 게시판 조인
	List<GymBoardFileJoin> selectGymFile(int g_id);
	
	
	//체육관 홍보 글 등록
	void saveGymPost(GymBoard gymboard, Gym gym) throws IOException;
	//체육관 홍보 글 수정
	void updateGymPost(GymBoard gymboard, Gym gym)throws IOException;
	//체육관 홍보 글 삭제
	void deleteGymPost(int g_id) throws IOException;	
	
	// 트레이너 리스트 불러오기***********************************************************************
	int totalTrainer(int g_id);
	List<Trainer> trainerList(Trainer trainer);
	int gymId(int g_id);
	
	// 트레이너 리스트 추가
	int saveTrainer(Trainer trainer) throws IOException;
	List<Trainer> gymIdTrainerId(Trainer trainer);	//트레이너 들어간 결과
	
	// 트레이너 불러오기
	Trainer getTrainerById(int trainerId);
	
	// 트레이너 수정
	int updateTrainer(Trainer trainer) throws IOException;
	
	// 트레이너 삭제
	int getDeleteTrainer(int t_id);
	
	// 트레이너 검색
	int getTotaltrainerSearch(Trainer trainer);
	List<Trainer> getTrainerSearchList(Trainer trainer);

	// 체육관 서비스 리스트***************************************************************************
	int totalService(int g_id);
	List<GSGSDetailJoin> serviceList(GS gs);
	//서비스 등록
	int createService(GS gs);
	// 서비스 디테일도 등록
	int getCreateServiceDetail(GS gs);
	
	// 서비스 불러오기
	GS fetchServiceDetails(int sNumber);	
	//서비스 수정
	int updateService(GS gs);
	// 
	int updateServiceDetail(GS gs);
	
	//서비스 삭제
	int deleteService(int s_number);
	
	//서비스 검색
	int getTotalSearchService(GS gs);
	List<GSGSDetailJoin> getListSearchService(GS gs);

	// 헬스장 회원 리스트***************************************************************************
	List<GymMemberServiceOrderJoin> getGymMemberList(GymMemberServiceOrderJoin gymMemberServiceOrderJoin);
	//누적회원
	int getTotalGymMemberList(int g_id);
	//누적매출액
	int getSumSale(int g_id);
	//성비
	Map<String, Double> getGenderRatio(int g_id);
	//나이비
	Map<String, Double> getAgeRatio(int g_id);
	
	//현재 이용중인 회원 리스트
	int getCurrentTotalMemberList(int g_id);

	// 지점찾기 페이지*****************************************************************************

	//전체 지점 글 카운트
	int getGymImformationCount(GymBoardFileServiceReviewJoin gymBoardServiceJoin);
	List<GymBoardFileServiceReviewJoin> getGymSearchPage(GymBoardFileServiceReviewJoin gymBoardServiceJoin);
	
	
	// 지점찾기 글 상세*****************************************************************************
	List<GymBoardJoin> gymBoardDetailRead(int g_id);
	List<GymBoardFile> gymBoardFileListRead(int g_id);
	// 리뷰점수, 리뷰 카운트
	GymBoardReviewJoin getAvgReviewSelect(int g_id);
	// 서비스 리스트 가져오기
	List<GSGSDetailJoin> getSelectServiceList(int g_id);
	// 트레이너 리스트 가져오기
	List<Trainer> getSelectTrainerList(int g_id);
	//리뷰 불러오기
	List<MemberGSGymOrderReviewJoin> getselectReviewList(int g_id);
	
	// 세셤에 체욱관관리자 인증용
	MemberGSGymOrderReviewJoin gymManagerSelect(MemberGym memberGymManager);
	// 리뷰 작성  -> 주문 목록 확인
	List<MemberGSGymOrderReviewJoin> getReviewSearch(MemberGSGymOrderReviewJoin reviewListSearch);
	// 리뷰 등록
	int getSaveReview(GymReview writeReview);
	// 리뷰 답글
	int updateReview(GymReview replyReview);






















	












































	
	
	
}
