package com.oracle.hellong.service.hs;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.hellong.dao.hsdao.HSGymDao;
import com.oracle.hellong.dao.hsdao.HSMemberDao;
import com.oracle.hellong.dao.hsdao.HSNoticeBoardDao;
import com.oracle.hellong.dao.hsdao.HSPointDao;
import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.GymOrder;
import com.oracle.hellong.model.Member;
import com.oracle.hellong.model.PointCharge;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HSServiceImpl implements HSService { 
	     
	private final HSNoticeBoardDao nbd;
	private final HSMemberDao md;
	private final HSPointDao pd;
	private final HSGymDao gd;

	/* 임시로그인 */
	
	@Override
	public int totalMember(Member member) {
		System.out.println("hsServiceImpl start total...");
		int totalMemberCnt = md.totalMember(member);
		System.out.println("hsServiceImpl totalMember totalMemberCnt-> " + totalMemberCnt);
		return totalMemberCnt;
	}

	@Override
	public List<Member> listMember(Member member) {
		List<Member> listMember = null;
		System.out.println("hsServiceImpl listMember start...");
		listMember = md.listMember(member);
		System.out.println("hsServiceImpl listMember listMember.size()-> " + listMember.size());
		return listMember;
	}
	
	/* 공지사항 */
	
	// 공지사항 리스트
	@Override
	public int totalNoticeBoard() {
		System.out.println("hsServiceImpl start total...");
		int totNoticeBoardCnt = nbd.totalNoticeBoard();
		System.out.println("hsServiceImpl totalNoticeBoard totNoticeBoardCnt->" +totNoticeBoardCnt);
		return totNoticeBoardCnt;
	} 

	@Override 
	public List<Board> listNoticeBoard(Board board) {
		List<Board> noticeBoardList = null;
		System.out.println("hsServiceImpl listNoticeBoard start...");
		noticeBoardList = nbd.listNoticeBoard(board);
		System.out.println("hsServiceImpl listNoticeBoard noticeBoardList.size()->" + noticeBoardList.size());
		return noticeBoardList;
	}
	
	// 공지글 클릭 시 세부내용+조회수 증가
	@Override
	public int updateReadCount(int b_number) {
		System.out.println("hsServiceImpl updateReadCount start...");
		int result = 0;
		result = nbd.updateReadCount(b_number);
		return result;
	}
	
	@Override
	public Board detailNoticeBoard(int b_number) {
		System.out.println("hsServiceImpl detail start...");
		Board board = null; 
		board = nbd.detailNoticeBoard(b_number);
		return board;
	}

	@Override
	public List<Board> listManager() {
		List<Board> noticeBoardList = null;
		System.out.println("hsServiceImpl listManager Start..." );
		noticeBoardList = nbd.listManager();
		System.out.println("hsServiceImpl listNoticeBoard noticeBoardList.size()->" +noticeBoardList.size());
		return noticeBoardList;
	}
	
	// 공지글 작성
	@Override
	public int createNoticeBoard(Board board) {
		int result = 0;
		System.out.println("hsServiceImpl createNoticeBoard start...");
		result = nbd.createNoticeBoard(board); 
		return result;
	}
	
	// 공지글 수정
	@Override
	public int updateNoticeBoard(Board board) {
		int updateCount = 0;
		System.out.println("hsServiceImpl updateNoticeBoard start...");
		updateCount = nbd.updateNoticeBoard(board);
		return updateCount;
	}
	
	// 공지글 삭제
	@Override
	public int deleteNoticeBoard(int b_number) {
		int result = 0;
		System.out.println("hsServiceImpl deleteNoticeBoard start...");
		result = nbd.delteNoticeBoard(b_number);
		return result;
	}
	
	// 공지글 특정조건으로 검색
	@Override
	public int condTotalNoticeBoard(Board board) {
		System.out.println("hsServiceImpl condTotalNoticeBoard start...");
		int condTotalBoardCnt = nbd.condTotalNoticeBoard(board);
		System.out.println("hsServiceImpl condTotalNoticeBoard condTotalBoardCnt ->" + condTotalBoardCnt);
		return condTotalBoardCnt;
	}

	@Override
	public List<Board> searchNoticeBoard(Board board) {
		System.out.println("hsServiceImpl searchNoticeBoard start...");
		List<Board> searchBoard = null;
		searchBoard = nbd.searchNoticeBoard(board);
		System.out.println("hsServiceImpl searchNoticeBoard searchBoard.size() ->" + searchBoard.size());
		return searchBoard;
	}
	
	/*
	 * @Override public int condTotalListPoint(Member member) {
	 * System.out.println("hsServiceImpl condTotalListPoint start..."); int
	 * condTotalListPointCnt = pd.condTotalListPoint(member); System.out.
	 * println("hsServiceImpl condTotalListPoint condTotalListPointCnt ->" +
	 * condTotalListPointCnt); return condTotalListPointCnt; }
	 */
	
	/* 회원정보 받기 */
	
	@Override
	public Member getMemberData(int m_number) {
		System.out.println("hsServiceImpl getMemberData start...");
		Member memberData = md.getMemberData(m_number);
		System.out.println("hsServiceImpl getMemberData memberNumber-> " +memberData.getM_number());
		return memberData;
	}
	
	/* 포인트내역 - 충전 */

	@Override
	public int totalListPointCharge(int m_number) {
		System.out.println("hsServiceImpl totalListPointCharge start...");
		int totalListPointChargeCnt = pd.totalListPointCharge(m_number);
		System.out.println("hsServiceImpl totalListPointCharge totalListPointChargeCnt ->" + totalListPointChargeCnt);
		return totalListPointChargeCnt;
	}
	
	@Override
	public List<PointCharge> listPointCharge(Member memberData) {
		List<PointCharge> listPoint = null;
		System.out.println("hsServiceImpl listPointCharge start...");
		listPoint = pd.listPointCharge(memberData);
		System.out.println("hsServiceImpl listPointCharge listPoint.size() ->" +listPoint.size());
		
		return listPoint;
	}
	
	/* 포인트내역 - 주문(사용) */
	@Override
	public int totalListGymOrderDeal(int m_number) {
		System.out.println("hsServiceImpl totalListGymOrderDeal start...");
		int totalListGymOrderDealCnt = pd.totalListGymOrderDeal(m_number);
		System.out.println("hsServiceImpl totalListGymOrderDeal totalListGymOrderDealCnt ->" + totalListGymOrderDealCnt);
		return totalListGymOrderDealCnt;
	}

	@Override
	public List<GymOrder> listGymOrderDeal(Member memberData) {
		List<GymOrder> listPoint = null;
		System.out.println("hsServiceImpl listGymOrderDeal start...");
		listPoint = pd.listGymOrderDeal(memberData);
		System.out.println("hsServiceImpl listGymOrderDeal listPoint.size() ->" +listPoint.size());
		return listPoint;
	}

	/* 포인트내역 - 환불 */
	
	@Override
	public int totalListGymOrderRefund(int m_number) {
		System.out.println("hsServiceImpl totalListGymOrderRefund start...");
		int totalListGymOrderRefundCnt = pd.totalListGymOrderRefund(m_number);
		System.out.println("hsServiceImpl totalListGymOrderRefund totalListGymOrderRefundCnt ->" + totalListGymOrderRefundCnt);
		return totalListGymOrderRefundCnt;
	}

	@Override
	public List<GymOrder> listGymOrderRefund(Member memberData) {
		List<GymOrder> listPoint = null;
		System.out.println("hsServiceImpl listGymOrderRefund start...");
		listPoint = pd.listGymOrderRefund(memberData);
		System.out.println("hsServiceImpl listGymOrderRefund listPoint.size() ->" +listPoint.size());
		return listPoint;
	}

	
	/* 헬스주문 내역 불러오기 */
	@Override
	public List<GymOrder> getListGymName(int m_number) {
		List<GymOrder> listGymName = null;
		System.out.println("hsServiceImpl getListGymOrder start...");
		listGymName = gd.getListGymName(m_number);
		System.out.println("hsServiceImpl getListGymOrder listGymOrder.size()-> " + listGymName.size());
		return listGymName;
	}
 
	@Override
	public List<GymOrder> getListGymService(int gymId, int m_number) {
		List<GymOrder> listGymService = null;
		System.out.println("hsServiceImpl getListGymService start...");
		listGymService = gd.getListGymService(gymId, m_number);
		System.out.println("hsServiceImpl getListGymService listGymService.size()-> " + listGymService.size());
		return listGymService;
	}

	@Override
	public GymOrder getRefundPrice(int gymId, int s_number, int s_detail, int m_number) {
		GymOrder refundPrice = null;
		System.out.println("hsServiceImpl getRefundPrice start...");
		refundPrice = gd.getRefundPrice(gymId, s_number, s_detail, m_number);
		System.out.println("hsServiceImpl getRefundPrice refundPrice-> " + refundPrice); 
		return refundPrice;
	}



}
