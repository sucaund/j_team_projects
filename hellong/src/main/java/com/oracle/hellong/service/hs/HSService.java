package com.oracle.hellong.service.hs;

import java.util.List;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.GymOrder;
import com.oracle.hellong.model.Member;
import com.oracle.hellong.model.PointCharge;

public interface HSService {
	
	/* 임시로그인 */ 
	int totalMember(Member member);

	List<Member> listMember(Member member);
	
	/* 공지사항 */

	int totalNoticeBoard();

	List<Board> listNoticeBoard(Board board);
	
	Board detailNoticeBoard(int b_number);	// 공지글 세부내용

	List<Board> listManager();

	int createNoticeBoard(Board board);		// 공지글 작성

	int updateNoticeBoard(Board board1);	// 공지글 수정

	int deleteNoticeBoard(int b_number);	// 공지글 삭제

	int condTotalNoticeBoard(Board board);	// 공지글 검색

	List<Board> searchNoticeBoard(Board board);
	
	Member getMemberData(int m_number);		// 회원정보 받기

	/* 포인트 내역 */
	
	int totalListPointCharge(int i);		// 포인트충전 내역
	
	List<PointCharge> listPointCharge(int i);

	int totalListGymOrderDeal(Member member);	// 포인트사용 내역

	List<GymOrder> listGymOrderDeal(Member member);

	int totalListGymOrderRefund(Member member);	// 포인트환불 내역

	List<GymOrder> listGymOrderRefund(Member member);

	/* 헬스장주문(이용) 내역 */
	
//	List<GymOrder> getListGymOrder(int m_number);	// 헬스장 주문 내역






}
