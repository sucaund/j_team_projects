package com.oracle.hellong.service.hs;

import java.util.List;
import java.util.Map;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.GS;
import com.oracle.hellong.model.GSDetail;
import com.oracle.hellong.model.GymOrder;
import com.oracle.hellong.model.Member;
import com.oracle.hellong.model.PointCharge;

public interface HSService {
	
		/* 공통 - 회원정보 받기 */
	
	Member getMemberData(int m_number);		
	
	
		/* 임시로그인 */ 
	
	int totalMember();
	
	List<Member> listMember(Member member);
	
	
		/* 공지사항 */
	
	// 공지글 리스트
	int totalNoticeBoard();
	
	List<Board> listNoticeBoard(Board board);
	
	// 공지글 세부내용 + 조회수 증가
	int updateReadCount(int b_number);	
	
	Board detailNoticeBoard(int b_number);
	
	// 공지글 작성
	int createNoticeBoard(Board board);		

	// 공지글 수정
	int updateNoticeBoard(Board board1);	

	// 공지글 삭제
	int deleteNoticeBoard(int b_number);	

	// 공지글 검색
	int condTotalNoticeBoard(Board board);	
	
	List<Board> searchNoticeBoard(Board board);

	
		/* 포인트 내역 조회 */
	
	// 포인트충전 내역
	int totalListPointCharge(int m_number);		
	
	List<PointCharge> listPointCharge(Member member);
	
	// 포인트사용 내역
	int totalListGymOrderDeal(int m_number);	
	
	List<GymOrder> listGymOrderDeal(Member member);
	
	// 포인트환불 내역
	int totalListGymOrderRefund(int m_number);	
	
	List<GymOrder> listGymOrderRefund(Member member);
	

		/* 헬스장 이용내역 조회 */
	
	int totalUsingGym(int m_number);

	List<GymOrder> listUsingGym(Member member);
	
	
		/* 헬스장 회원권 구매,환불 공통 - getGymOrder */
	
	GymOrder getGymOrder(Map<String, Object> params);
	
		/* 헬스장 회원권 구매 */
	
	// GSDetail에 구매정보 insert + 키값 받기
	GS insertAndGetGSDetailData(GS gs);

	// GymOrder에 구매정보 insert
	int insertGymOrder(GS gsDetailData, int m_number);

	// insert한 GSDetail 정보 업데이트
	int updateGSDetailBuy(GymOrder gymOrder);

	// Member 구매포인트 업데이트
	int updatePointBuy(GymOrder gymOrder);
	
		/* 헬스장 회원권 환불 */
	
	// 이용중인 헬스장 이름 조회
	List<GymOrder> getListGymName(int m_number);	

	// 이용중인 헬스장 서비스 조회
	List<GymOrder> getListGymService(int g_id, int m_number);

	// 이용중인 헬스장 예상 환불금액 조회
	GymOrder getRefundData(int g_id, int s_number, int sd_number, int m_number);

	// GymOrder에 환불정보 업데이트
	int updateGymOrder(Map<String, Object> params);

	// GSDetail에 환불정보 업데이트
	int updateGSDetailRefund(GymOrder gymOrder);

	// Member 환불포인트 업데이트
	int updatePointRefund(GymOrder gymOrder);


	






}