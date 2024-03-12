package com.oracle.hellong.service.hs;

import java.util.List;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.GSDetail;
import com.oracle.hellong.model.GymOrder;
import com.oracle.hellong.model.Member;
import com.oracle.hellong.model.PointCharge;

public interface HSService {
	
	/* 임시로그인 */ 
	
	int totalMember();
	
	List<Member> listMember(Member member);
	
	/* 공지사항 */
	
	// 공지글 리스트
	int totalNoticeBoard();
	
	List<Board> listNoticeBoard(Board board);
	
	// 공지글 세부내용
	int updateReadCount(int b_number);	
	
	Board detailNoticeBoard(int b_number);
	
	List<Board> listManager();

	// 공지글 작성
	int createNoticeBoard(Board board);		

	// 공지글 수정
	int updateNoticeBoard(Board board1);	

	// 공지글 삭제
	int deleteNoticeBoard(int b_number);	

	// 공지글 조건부 검색
	int condTotalNoticeBoard(Board board);	
	
	List<Board> searchNoticeBoard(Board board);
	
	// 회원정보 받기
	Member getMemberData(int m_number);		

	/* 포인트 내역 */
	
	// 포인트충전 내역
	int totalListPointCharge(int m_number);		
	
	List<PointCharge> listPointCharge(Member member);
	
	// 포인트사용 내역
	int totalListGymOrderDeal(int m_number);	
	
	List<GymOrder> listGymOrderDeal(Member member);
	
	// 포인트환불 내역
	int totalListGymOrderRefund(int m_number);	
	
	List<GymOrder> listGymOrderRefund(Member member);
	

	/* 헬스장주문(이용) 내역 */
	
	int totalUsingGym(int m_number);

	List<GymOrder> listUsingGym(Member member);
	
	/* 헬스장 환불 */
	
	List<GymOrder> getListGymName(int m_number);	// 헬스장 주문 내역

	List<GymOrder> getListGymService(int gymId, int m_number);

	GymOrder getRefundPrice(int gymId, int s_number, int s_detail, int m_number);








}