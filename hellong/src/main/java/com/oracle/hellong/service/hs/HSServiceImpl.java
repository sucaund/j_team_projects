package com.oracle.hellong.service.hs;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.oracle.hellong.dao.hsdao.HSGymDao;
import com.oracle.hellong.dao.hsdao.HSMemberDao;
import com.oracle.hellong.dao.hsdao.HSNoticeBoardDao;
import com.oracle.hellong.dao.hsdao.HSPointDao;
import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.GS;
import com.oracle.hellong.model.GSDetail;
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
	
		/* 공통 - 회원정보 받기 */
		
	@Override
	public Member getMemberData(int m_number) {
		System.out.println("hsServiceImpl getMemberData start...");
		Member memberData = md.getMemberData(m_number);
		System.out.println("hsServiceImpl getMemberData memberNumber-> " +memberData.getM_number());
		return memberData;
	}

		/* 임시로그인 */ 
	
	@Override
	public int totalMember() {
		System.out.println("hsServiceImpl start total...");
		int totalMemberCnt = md.totalMember();
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
	
	// 공지글 리스트
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
	
	// 공지글 세부내용 + 조회수 증가
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
	
	// 공지글 검색
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
	
		/* 포인트 내역 조회 */
	
	// 포인트충전 내역
	@Override
	public int totalListPointCharge(int m_number) {
		int totalListPointChargeCnt = 0;
		System.out.println("hsServiceImpl totalListPointCharge start...");
		totalListPointChargeCnt = pd.totalListPointCharge(m_number);
		System.out.println("hsServiceImpl totalListPointCharge totalListPointChargeCnt ->" + totalListPointChargeCnt);
		return totalListPointChargeCnt;
	}
	
	@Override
	public List<PointCharge> listPointCharge(Member member) {
		List<PointCharge> listPoint = null;
		System.out.println("hsServiceImpl listPointCharge start...");
		listPoint = pd.listPointCharge(member);
		System.out.println("hsServiceImpl listPointCharge listPoint.size() ->" +listPoint.size());
		 
		return listPoint;
	}
	
	// 포인트사용 내역
	@Override
	public int totalListGymOrderDeal(int m_number) {
		System.out.println("hsServiceImpl totalListGymOrderDeal start...");
		int totalListGymOrderDealCnt = pd.totalListGymOrderDeal(m_number);
		System.out.println("hsServiceImpl totalListGymOrderDeal totalListGymOrderDealCnt ->" + totalListGymOrderDealCnt);
		return totalListGymOrderDealCnt;
	}

	@Override
	public List<GymOrder> listGymOrderDeal(Member member) {
		List<GymOrder> listPoint = null;
		System.out.println("hsServiceImpl listGymOrderDeal start...");
		listPoint = pd.listGymOrderDeal(member);
		System.out.println("hsServiceImpl listGymOrderDeal listPoint.size() ->" +listPoint.size());
		return listPoint;
	}

	// 포인트환불 내역
	@Override
	public int totalListGymOrderRefund(int m_number) {
		System.out.println("hsServiceImpl totalListGymOrderRefund start...");
		int totalListGymOrderRefundCnt = pd.totalListGymOrderRefund(m_number);
		System.out.println("hsServiceImpl totalListGymOrderRefund totalListGymOrderRefundCnt ->" + totalListGymOrderRefundCnt);
		return totalListGymOrderRefundCnt;
	}

	@Override
	public List<GymOrder> listGymOrderRefund(Member member) {
		List<GymOrder> listPoint = null;
		System.out.println("hsServiceImpl listGymOrderRefund start...");
		listPoint = pd.listGymOrderRefund(member);
		System.out.println("hsServiceImpl listGymOrderRefund listPoint.size() ->" +listPoint.size());
		return listPoint;
	}

	
		/* 헬스장 이용내역 조회 */
	
	@Override
	public int totalUsingGym(int m_number) {
		int totalGym = 0;
		System.out.println("hsServiceImpl totalUsingGym start...");
		totalGym = gd.totalUsingGym(m_number);
		System.out.println("hsServiceImpl totalUsingGym totalGym-> " + totalGym);
		return totalGym;
	}

	@Override
	public List<GymOrder> listUsingGym(Member member) {
		List<GymOrder> listGSDetail = null;
		System.out.println("hsServiceImpl listUsingGSDetail start...");
		listGSDetail = gd.listUsingGym(member);
		System.out.println("hsServiceImpl listUsingGSDetail listGSDetail.size()-> " + listGSDetail.size());
		return listGSDetail;
	}
	
		/* 헬스장 회원권 구매,환불 공통 - getGymOrder */
	
	@Override
	public GymOrder getGymOrder(Map<String, Object> params) {
		GymOrder gymOrder = null;
		System.out.println("hsServiceImpl getGymOrder start...");
		gymOrder = gd.getGymOrder(params);
		return gymOrder;
	}
	
		/* 헬스장 회원권 구매 */

	// GSDetail에 구매정보 insert + 키값 받기
	@Override
	public GS insertAndGetGSDetailData(GS gs) {
		GS gsDetailData = null;
		System.out.println("hsServiceImpl insertAndGetGSDetailData start...");
		gsDetailData = gd.insertAndGetGSDetailData(gs);
		System.out.println("hsServiceImpl insertAndGetGSDetailData gsDetailData-> " + gsDetailData.getS_number());
		return gsDetailData;
	}

	// GymOrder에 구매정보 insert
	@Override
	public int insertGymOrder(GS gsDetailData, int m_number) {
		int insertGymOrderResult = 0;
		System.out.println("hsServiceImpl insertGymOrder start...");
		insertGymOrderResult = gd.insertGymOrder(gsDetailData, m_number);
		System.out.println("hsServiceImpl insertGymOrder insertGymOrderResult-> " + insertGymOrderResult);
		return insertGymOrderResult;
	}

	// insert한 GSDetail 정보 업데이트
	@Override
	public int updateGSDetailBuy(GymOrder gymOrder) {
		int updateGSDetailBuyResult = 0;
		System.out.println("hsServiceImpl updateGSDetailBuy start...");
		updateGSDetailBuyResult = gd.updateGSDetailBuy(gymOrder);
		System.out.println("hsServiceImpl updateGSDetailBuy updateGSDetailBuyResult-> " + updateGSDetailBuyResult);
		return updateGSDetailBuyResult;
	}

	// Member 구매포인트 업데이트
	@Override
	public int updatePointBuy(GymOrder gymOrder) {
		int updatePointBuyResult = 0;
		System.out.println("hsServiceImpl updatePointBuy start...");
		updatePointBuyResult = gd.updatePointBuy(gymOrder);
		return updatePointBuyResult;
	}

	
		/* 헬스장 회원권 환불 */
	
	// 이용중인 헬스장 이름 조회
	@Override
	public List<GymOrder> getListGymName(int m_number) {
		List<GymOrder> listGymName = null;
		System.out.println("hsServiceImpl getListGymOrder start...");
		listGymName = gd.getListGymName(m_number);
		System.out.println("hsServiceImpl getListGymOrder listGymOrder.size()-> " + listGymName.size());
		return listGymName;
	}
 
	// 이용중인 헬스장 서비스 조회
	@Override
	public List<GymOrder> getListGymService(int g_id, int m_number) {
		List<GymOrder> listGymService = null;
		System.out.println("hsServiceImpl getListGymService start...");
		listGymService = gd.getListGymService(g_id, m_number);
		System.out.println("hsServiceImpl getListGymService listGymService.size()-> " + listGymService.size());
		return listGymService;
	}

	// 이용중인 헬스장 예상 환불금액 조회
	@Override
	public GymOrder getRefundData(int g_id, int s_number, int sd_number, int m_number) {
		GymOrder refundData = null;
		System.out.println("hsServiceImpl getRefundPrice start...");
		refundData = gd.getRefundData(g_id, s_number, sd_number, m_number);
		System.out.println("hsServiceImpl getRefundPrice refundData-> " + refundData.getRefund_point()); 
		return refundData;
	}

	// GymOrder에 환불정보 업데이트
	@Override
	public int updateGymOrder(Map<String, Object> params) {
		int updateGymOrderResult = 0;
		System.out.println("hsServiceImpl updateGymOrder start...");
		updateGymOrderResult = gd.updateGymOrder(params);
		System.out.println("hsServiceImpl updateGymOrder updateGymOrderResult-> " + updateGymOrderResult);
		return updateGymOrderResult;
	}

	// GSDetail에 환불정보 업데이트
	@Override
	public int updateGSDetailRefund(GymOrder gymOrder) {
		int updateGSDetailRefundResult = 0;
		System.out.println("hsServiceImpl updateGSDetailRefund start...");
		updateGSDetailRefundResult = gd.updateGSDetailRefund(gymOrder);
		System.out.println("hsServiceImpl updateGSDetailRefund updateGSDetailRefundResult-> " + updateGSDetailRefundResult);
		return updateGSDetailRefundResult;
	}

	// Member 환불포인트 업데이트
	@Override
	public int updatePointRefund(GymOrder gymOrder) {
		int updatePointRefundResult = 0;
		System.out.println("hsServiceImpl updatePointRefund start...");
		updatePointRefundResult = gd.updatePointRefund(gymOrder);
		System.out.println("hsServiceImpl updatePointRefund updatePointRefundResult-> " + updatePointRefundResult);
		return updatePointRefundResult;
	}
 
	

}