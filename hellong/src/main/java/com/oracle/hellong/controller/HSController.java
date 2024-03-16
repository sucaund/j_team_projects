package com.oracle.hellong.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.GS;
import com.oracle.hellong.model.GSDetail;
import com.oracle.hellong.model.GymOrder;
import com.oracle.hellong.model.Member;
import com.oracle.hellong.model.PointCharge;
import com.oracle.hellong.service.hs.HSService;
import com.oracle.hellong.service.jm.JmPaging;
import com.oracle.hellong.service.hs.HSPaging;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class HSController { //////
	
	private final HSService hs;

//	 @GetMapping()
//		public void hsHello() { //이름 규칙 권장
//			
//		}

	/* 로그인 임시구현 */

	// 로그인 임시구현
	@RequestMapping(value = "hsListMember")
	public String hsListMember(Member member, Model model) {
		System.out.println("hsController hsListMember start...");
		if (member.getCurrentPage() == null)
			member.setCurrentPage("1");
		System.out.println(member.getCurrentPage());

		int totalMember = hs.totalMember();
		System.out.println("hsController hsListMember totalMember ->" + totalMember);

		HSPaging page = new HSPaging(totalMember, member.getCurrentPage());

		member.setStart(page.getStart());
		member.setEnd(page.getEnd());

		List<Member> listMember = hs.listMember(member);
		System.out.println("hsController hsListMember listMember.size()-> " + listMember.size());

		model.addAttribute("totalMember", totalMember);
		model.addAttribute("listMember", listMember);
		model.addAttribute("page", page);
		return "hs/listMember";
	}

	// 아이디 클릭시 index 이동
	@RequestMapping(value = "hsMemberIndex")
	public String hsIndex(Member member, Model model, HttpSession session) {
		System.out.println("hsController hsMemberIndex start...");
		System.out.println("member.getM_number-> " + member.getM_number());
		System.out.println("session.getM_number-> " + session.getAttribute("m_number"));
		// 로그인 기능 사용시 session.getattribute로 사용
//		 model.addAttribute("m_number", session.getAttribute("m_number"));
		model.addAttribute("m_number", member.getM_number());

		return "hs/memberIndex";
	}

	/* 공지사항 */

	// 공지글 목록
	@RequestMapping(value = "hsListNoticeBoard")
	public String hsListNoticeBoard(Board board, Member member, Model model) {
		System.out.println("hsController hsListNoitceBoard start...");
		System.out.println("list: " + member.getM_number());

		int totalBoard = hs.totalNoticeBoard();
		System.out.println("hsController start totalNoticeBoard->" + totalBoard);

		HSPaging page = new HSPaging(totalBoard, board.getCurrentPage());
		board.setStart(page.getStart());
		board.setEnd(page.getEnd());

		List<Board> listBoard = hs.listNoticeBoard(board);
		System.out.println("hsController list hsListNoticeBoard.size()->" + listBoard.size());

		Member memberData = hs.getMemberData(member.getM_number());
		int common_mcd = memberData.getCommon_mcd();
		System.out.println("hsController hsListNoticeBoard common_mcd-> " + common_mcd);
		model.addAttribute("totalNoticeBoard", totalBoard);
		model.addAttribute("ListNoticeBoard", listBoard);
		model.addAttribute("page", page);
		model.addAttribute("common_mcd", common_mcd);

		model.addAttribute("m_number", member.getM_number());

		return "hs/listNoticeBoard";
	}

	// 공지글 세부내용 + 조회수 증가
	@GetMapping(value = "hsDetailNoticeBoard")
	public String hsDetailNoticeBoard(Board board1, Member member, Model model) {
		System.out.println("hsController hsDetailNoticeBoard start...");
		int result = hs.updateReadCount(board1.getB_number());
		Board board = hs.detailNoticeBoard(board1.getB_number());

		Member memberData = hs.getMemberData(member.getM_number());
		int common_mcd = memberData.getCommon_mcd();
		System.out.println("hsController hsDetailNoticeBoard common_mcd-> " + common_mcd);

		model.addAttribute("noticeBoard", board);
		model.addAttribute("common_mcd", common_mcd);
		model.addAttribute("m_number", member.getM_number());

		return "hs/detailNoticeBoard";
	}

	// 공지글 작성 폼
	@RequestMapping(value = "hsCreateFormNoticeBoard")
	public String hsCreateNoticeBoard(Member member, Model model) {
		System.out.println("hsController hsCreateFormNoticeBoard start...");
		Member memberData = hs.getMemberData(member.getM_number());
		model.addAttribute("member", memberData);

		return "hs/createFormNoticeBoard";
	}

	// 공지글 작성
	@PostMapping(value = "hsCreateNoticeBoard")
	public String hsCreateNoticeBoard(Board board, Member member, Model model) {
		System.out.println("create: " + member.getM_number());
		System.out.println("hsController hsCreateNoticeBoard start...");
		int createResult = hs.createNoticeBoard(board);
		if (createResult > 0) {
			return "redirect:hsListNoticeBoard?m_number=" + member.getM_number();
		} else {
			model.addAttribute("msg", "입력 실패");
			return "forward:hsCreateFormNoticeBoard";
		}
	}

	// 공지글 수정 폼
	@GetMapping(value = "hsUpdateFormNoticeBoard")
	public String hsUpdateFormNoticeBoard(Board board1, Member member, Model model) {
		System.out.println("hsController hsUpdateFormNoticeBoard start...");
		System.out.println("updateForm: " + member.getM_number());
		Board board = hs.detailNoticeBoard(board1.getB_number());
		System.out.println("board.getB_number()->" + board.getB_number());
		System.out.println("board.getB_update()->" + board.getB_update());

		model.addAttribute("noticeBoard", board);
		model.addAttribute("m_number", member.getM_number());
		return "hs/updateFormNoticeBoard";
	}

	// 공지글 수정
	@PostMapping(value = "hsUpdateNoticeBoard")
	public String hsUpdateNoticeBoard(Board board1, Member member, Model model) {
		System.out.println("hsController hsUpdateNoticeBoard start...");
		System.out.println("updateClear: " + member.getM_number());

		int updateCount = hs.updateNoticeBoard(board1);
		System.out.println("hsController hs.updateNoticeBoard updateCount ->" + updateCount);
		return "redirect:hsListNoticeBoard?m_number=" + member.getM_number();
	}

	// 공지글 삭제
	@RequestMapping(value = "hsDeleteNoticeBoard")
	public String hsDeleteNoticeBoard(Board board, Member member, Model model) {
		System.out.println("hsController hsDeleteNoticeBoard start...");
		System.out.println("delete: " + member.getM_number());

		int result = hs.deleteNoticeBoard(board.getB_number());
		return "redirect:hsListNoticeBoard?m_number=" + member.getM_number();
	}

	// 공지글 검색 (제목,내용)
	@RequestMapping(value = "hsSearchNoticeBoard")
	public String hsSearchNoticeBoard(Board board, Member member, Model model) {
		System.out.println("hsController hsSearchNoticeBoard start...");
		int condTotalBoard = hs.condTotalNoticeBoard(board);
		System.out.println("hsController hsSearchNoticeBoard condTotalBoard ->" + condTotalBoard);

		HSPaging page = new HSPaging(condTotalBoard, board.getCurrentPage());

		board.setStart(page.getStart());
		board.setEnd(page.getEnd());

		List<Board> searchBoard = hs.searchNoticeBoard(board);
		System.out.println("hsController hsSearchNoticeBoard searchBoard.size() -> " + searchBoard.size());

		System.out.println(member.getM_number());
		Member memberData = hs.getMemberData(member.getM_number());
		int common_mcd = memberData.getCommon_mcd();

		model.addAttribute("totalNoticeBoard", condTotalBoard);
		model.addAttribute("ListNoticeBoard", searchBoard);
		model.addAttribute("page", page);
		model.addAttribute("m_number", member.getM_number());
		model.addAttribute("common_mcd", common_mcd);

		return "hs/listNoticeBoard";
	}

	/* 포인트 내역 조회 */

	// 포인트 충전내역 
	@RequestMapping(value = "hsListChargePoint")
	public String hsListChargePoint(Member member, Model model) {

		System.out.println("hsController hsListChargePoint start...");

		System.out.println("currentPage: " + member.getCurrentPage());
		System.out.println("m_number: " + member.getM_number());

		// 회원정보 얻기
		Member memberData = hs.getMemberData(member.getM_number());
		System.out.println("hsController hsListPoint memberNumber ->" + memberData.getM_number());

		model.addAttribute("memberData", memberData);

		// 포인트 충전내역 조회
		int totalListPointCharge = hs.totalListPointCharge(member.getM_number());
		System.out.println("hsController hsListPoint totalListPointCharge ->" + totalListPointCharge);

		HSPaging page = new HSPaging(totalListPointCharge, member.getCurrentPage());
		member.setStart(page.getStart());
		member.setEnd(page.getEnd());
		System.out.println("get member ->" + member);

		List<PointCharge> listPointCharge = hs.listPointCharge(member);
		System.out.println("hsController hsListPointCharge listPointCharge.size() ->" + listPointCharge.size());

		model.addAttribute("totalListPoint", totalListPointCharge);
		model.addAttribute("listPoint", listPointCharge);
		model.addAttribute("page", page);
		model.addAttribute("category", "충전");

		return "hs/listChargePoint";
	}
	
	// 포인트 사용내역
	@RequestMapping(value="hsListUsePoint") 
	public String hsListBuyPoint (Member member, Model model) {
		 
		System.out.println("hsController hsListBuyPoint start...");
		 
		Member memberData = hs.getMemberData(member.getM_number());
		System.out.println("hsController hsListPoint memberNumber ->" + memberData.getM_number());
		model.addAttribute("memberData", memberData); 
		 
		int totalListPointDeal = hs.totalListGymOrderDeal(member.getM_number());
		System.out.println("hsController hsListPoint totalListPointDeal ->" + totalListPointDeal);
		 
		HSPaging page = new HSPaging(totalListPointDeal, member.getCurrentPage());
		member.setStart(page.getStart()); 
		member.setEnd(page.getEnd());
		 
		List<GymOrder> listGymOrderDeal = hs.listGymOrderDeal(member);
		System.out.println("hsController hsListPointCharge listPointCharge.size() ->" +listGymOrderDeal.size()); 
		System.out.println("DealTest Controller: " +listGymOrderDeal);
		 
		model.addAttribute("totalListPoint", totalListPointDeal);
		model.addAttribute("listPoint", listGymOrderDeal); 
		model.addAttribute("page", page);
		model.addAttribute("category", "사용");
		 
		return "hs/listUsePoint"; 
	}
	
	// 포인트 환불내역
	@RequestMapping(value="hsListRefundPoint")
	public String hsListRefundPoint (Member member, Model model) {
		 
		System.out.println("hsController hsListRefundPoint start...");
		
		Member memberData = hs.getMemberData(member.getM_number());
		System.out.println("hsController hsListPoint memberNumber ->" + memberData.getM_number());
		model.addAttribute("memberData", memberData);
		 
		int totalListPointRefund = hs.totalListGymOrderRefund(member.getM_number()); 
		System.out.println("hsController hsListPoint totalListPointRefund ->" + totalListPointRefund);
		 
		HSPaging page = new HSPaging(totalListPointRefund, member.getCurrentPage());
		member.setStart(page.getStart());
		member.setEnd(page.getEnd());
		 
		List<GymOrder> listGymOrderRefund = hs.listGymOrderRefund(member);
		System.out.println("hsController hsListPointCharge listPointCharge.size() ->" +listGymOrderRefund.size());
		System.out.println("RefundTest Controller: " +listGymOrderRefund);
		
		model.addAttribute("totalListPoint", totalListPointRefund);
		model.addAttribute("listPoint", listGymOrderRefund);
		model.addAttribute("page", page);
		model.addAttribute("category", "환불");
		 
		return "hs/listRefundPoint"; 
	}
	
// condList로 만든거
//	 // 포인트 조건부 내역
//	 @RequestMapping(value="hsCondListPoint")
//	 public String hsCondListPoint (@RequestParam("select") String action, Member member, Model model) {
//		 
//		 System.out.println("hsController hsCondListPoint start...");
//		 System.out.println("listPoint: " + member.getM_number());
//		 
//		 // 회원정보 얻기
//		 Member memberData = hs.getMemberData(member.getM_number());
//		 System.out.println("hsController hsListPoint memberNumber ->" + memberData.getM_number());
//		 
//		 model.addAttribute("memberData", memberData);
//		 
//		 // 버튼 클릭시 조건에 맞는 내역 조회 (충전,구매,환불) 
//		 // -> 하나의 form을 사용하기 위해 공통으로 받아줄 수 있는 파라미터를 각 model에 생성해줌
//		 //		pl_content, pl_point, pl_date
//		 if ("point_charge".equals(action)) {
//			 int totalListPointCharge = hs.totalListPointCharge(member.getM_number());
//			 System.out.println("hsController hsListPoint totalListPointCharge ->" + totalListPointCharge);
//			 
//			 HSPaging page = new HSPaging(totalListPointCharge, member.getCurrentPage());
//			 member.setStart(page.getStart());
//			 member.setEnd(page.getEnd());
//			 
//			 List<PointCharge> listPointCharge = hs.listPointCharge(member);
//			 System.out.println("hsController hsListPointCharge listPointCharge.size() ->" +listPointCharge.size());
//			 
//			 model.addAttribute("totalListPoint", totalListPointCharge);
//			 model.addAttribute("listPoint", listPointCharge);
//			 model.addAttribute("page", page);
//			 model.addAttribute("category", "충전");
//			 
//		 } else if ("gym_order_deal".equals(action)) {
//			 int totalListPointDeal = hs.totalListGymOrderDeal(member.getM_number()); 
//			 System.out.println("hsController hsListPoint totalListPointDeal ->" + totalListPointDeal);
//			 
//			 HSPaging page = new HSPaging(totalListPointDeal, member.getCurrentPage());
//			 member.setStart(page.getStart());
//			 member.setEnd(page.getEnd());
//			 
//			 List<GymOrder> listGymOrderDeal = hs.listGymOrderDeal(member);
//			 System.out.println("hsController hsListPointCharge listPointCharge.size() ->" +listGymOrderDeal.size());
//			 System.out.println("DealTest Controller: " +listGymOrderDeal);
//			 
//			 model.addAttribute("totalListPoint", totalListPointDeal);
//			 model.addAttribute("listPoint", listGymOrderDeal);
//			 model.addAttribute("page", page);
//			 model.addAttribute("category", "사용");
//			 
//		 } else if ("gym_order_refund".equals(action)) {
//			 int totalListPointRefund = hs.totalListGymOrderRefund(member.getM_number()); 
//			 System.out.println("hsController hsListPoint totalListPointRefund ->" + totalListPointRefund);
//			 
//			 HSPaging page = new HSPaging(totalListPointRefund, member.getCurrentPage());
//			 member.setStart(page.getStart());
//			 member.setEnd(page.getEnd());
//			 
//			 List<GymOrder> listGymOrderRefund = hs.listGymOrderRefund(member);
//			 System.out.println("hsController hsListPointCharge listPointCharge.size() ->" +listGymOrderRefund.size());
//			 System.out.println("RefundTest Controller: " +listGymOrderRefund);
//			 model.addAttribute("totalListPoint", totalListPointRefund);
//			 model.addAttribute("listPoint", listGymOrderRefund);
//			 model.addAttribute("page", page);
//			 model.addAttribute("category", "환불");
//		 }
//		 
//		 return "hs/listPoint";
//	 }
//	  

	/* 포인트 충전 */

	@RequestMapping(value = "hsChargeFormPoint")
	public String hsChargeFormPoint(Member member, Model model) {
		
		System.out.println("hsController hsChargeFormPoint start...");
		Member memberData = hs.getMemberData(member.getM_number());

		model.addAttribute("memberData", memberData);
		
		return "hs/chargeFormPoint";
	}

	@GetMapping(value = "hsChargePoint")
	public String hsChargePoint(PointCharge pointCharge, Model model) {
		System.out.println("charge check: " + pointCharge.getM_number() + " " +  pointCharge.getCharge_point());
		return "redirect:hsMemberIndex?m_number=" + pointCharge.getM_number();
	}

	/* 헬스장 이용내역 조회 */

	@RequestMapping(value = "hsDetailUsingGym")
	public String hsDetailUsingGym(Member member, Model model) {

		// 팀원분들 data 참고
		System.out.println("hsController hsDetailUsingGym start...");

		int totalGym = hs.totalUsingGym(member.getM_number());
		System.out.println("hsController hsDetailUsingGym totalGym ->" + totalGym);

		HSPaging page = new HSPaging(totalGym, member.getCurrentPage());
		member.setStart(page.getStart());
		member.setEnd(page.getEnd());

		List<GymOrder> listUsingGym = hs.listDetailUsingGym(member);
		System.out.println("hsController hsDetailUsingGym listUsingGym.size()-> " + listUsingGym.size());
		model.addAttribute("m_number", member.getM_number());
		model.addAttribute("listUsingGym", listUsingGym);
		model.addAttribute("page", page);

		return "hs/detailUsingGym";
	}

	/* 헬스장 회원권 구매 */
	
	// 지훈님 버튼 클릭시 data 받는 메소드
	@RequestMapping(value="hsGetGSDetailData")
	public String hsGetGSDetailData(GSDetail gsDetail, Model model) {
		System.out.println("hsController hsGetGymOrderData start...");
		
		Member memberData = hs.getMemberData(gsDetail.getM_number());
		GSDetail gsDetailData = hs.getGSDetailData(gsDetail);
		
		model.addAttribute("memberData", memberData);
		model.addAttribute("gsDetailData", gsDetailData);
		
		return "hs/buyFormGymMembership";
	}

	// 결제 버튼 클릭 시 g_id, s_number, m_number 제공받아 시작
	@PostMapping(value = "hsBuyGymMembership")
	public String hsBuyGymMembership(GSDetail gsDetail, Member member, Model model) {

		System.out.println("hsController hsBuyGymMembership start...");
		
		// 1. GSDetail 조회 (s_period, sd_price 값 받기 - join)
		System.out.println("1. GSDetail 조회 - s_period, sd_price 값 받기");
		GSDetail gsDetailData = hs.getGSDetailDataBuy(gsDetail);
		
		// 2. GymOrder insert
		System.out.println("2. GymOrder insert");
				
		GSDetail insertAndGetGymOrder = hs.insertAndGetGymOrder(gsDetailData);
		System.out.println("hsController hsBuyGymMembership insertAndGetGymOrder.getGo_number-> " + insertAndGetGymOrder.getGo_number());
		
		// 3. GymOrder 업데이트 (go_enddate)
		System.out.println("3. GymOrder 업데이트 - go_enddate");
		int updateGymOrderBuyReuslt = hs.updateGymOrderBuy(insertAndGetGymOrder);
		
		
		// 4. member 정보 업데이트
		System.out.println("3. Member 포인트 업데이트");
		int updatePointBuyResult = hs.updatePointBuy(insertAndGetGymOrder);
		System.out.println("hsController hsBuyGymMembership");
		
		/*
		// 1. GSDetail에 구매정보 insert + 키값 받기
		// -> gs_detail table에 insert하면서 sd_number(gs_detail의 키값) 받아오기
		System.out.println("1. insertAndGetGSDetailData start...");

		GS gsDetailData = hs.insertAndGetGSDetailData(gs);
		System.out.println("hsController hsBuyGymMembership insertAndGetGSDetailData->" + gsDetailData.getS_number());

		// 2. GymOrder에 구매정보 insert
		System.out.println("2. insertGymOrder start...");
		int insertGymOrderResult = hs.insertGymOrder(gsDetailData, member.getM_number());
		System.out.println("hsController hsBuyGymMembership insertGymOrderResult-> " + insertGymOrderResult);

		// 3. insert한 GymOrder 정보 조회
		// -> getGymorder은 구매, 환불할 때 같이 사용
		System.out.println("3. getGymOrder start...");

		Map<String, Object> params = new HashMap<>();
		params.put("g_id", gsDetailData.getG_id());
		params.put("s_number", gsDetailData.getS_number());
		params.put("sd_number", gsDetailData.getSd_number());
		params.put("m_number", member.getM_number());

		GymOrder gymOrder = hs.getGymOrder(params);
		System.out.println("hsController hsBuyGymMembership getGymOrder-> " + gymOrder);

		// 4. insert한 GSDetail 정보 업데이트 (
		// -> gymOrder 생성 후 deal_date 값으로 startdate, enddate 업데이트
		// 출석을 한 날부터 startdate가 기록되기 하기 위해 따로 분리 (출석 시스템을 구현하지 않았기 때문에 완벽한 구현은 x)
		System.out.println("4. updateGSDetailBuy start...");
		int updateGSDetailBuyResult = hs.updateGSDetailBuy(gymOrder);
		System.out.println("hsController hsBuyGymMembership updateGSDetailBuyResult-> " + updateGSDetailBuyResult);

		// 5. Member 구매포인트 업데이트
		System.out.println("5. updatePointBuy start...");
		int updatePointBuyResult = hs.updatePointBuy(gymOrder);
		System.out.println("hsController hsBuyGymMembership updatePointBuyResult-> " + updatePointBuyResult);
		*/
		
		
		return "redirect:hsMemberIndex?m_number=" + member.getM_number();
	}

	/* 헬스장 회원권 환불 */

	// 헬스장 회원권 환불 폼 생성
	@GetMapping(value = "hsRefundFormUsingGym")
	public String hsRefundFormUsingGym(Member member, Model model) {
		System.out.println("hsController hsRefundFormUsingGym start...");

		Member memberData = hs.getMemberData(member.getM_number());

		// 환불 폼에서 이용중인 헬스장 이름 조회
		List<GymOrder> listGymName = hs.getListGymName(member.getM_number());

		System.out.println("hsController hsRefundFormUsingGym listGymName.size()-> " + listGymName.size());
		model.addAttribute("listGymName", listGymName);
		model.addAttribute("memberData", memberData);

		return "hs/refundFormUsingGym";
	}

	// 환불 폼에서 이용중인 헬스장 서비스 조회 (ajax)
	@ResponseBody
	@GetMapping(value = "hsGetServicesByGymId")
	public List<GymOrder> hsGetServicesByGymId(@RequestParam("g_id") int g_id, @RequestParam("m_number") int m_number) {
		System.out.println("getService: " + g_id + " & " + m_number);
		List<GymOrder> listGymService = hs.getListGymService(g_id, m_number);
		return listGymService;
	}

	// 처음에 헬스장이름 선택 시 클릭안해도 바로 환불금액 조회 (sub ajax)
	@ResponseBody
	@GetMapping(value = "hsGetFirstRefundData")
	public GymOrder hsGetFirstRefundData(@RequestParam("g_id") int g_id, @RequestParam("s_number") int s_number, 
										 @RequestParam("sd_number") int sd_number, @RequestParam("m_number") int m_number, 
										 @RequestParam("go_number") int go_number) {
		
		GymOrder firstRefundData = hs.getRefundData(g_id, s_number, sd_number, m_number, go_number);
		return firstRefundData;
	}

	// 환불 폼에서 이용중인 헬스장 예상 환불금액 조회 (ajax)
	@ResponseBody
	@GetMapping(value = "hsGetRefundData")
	public GymOrder hsGetRefundData(@RequestParam("g_id") int g_id, @RequestParam("s_number") int s_number, 
									@RequestParam("sd_number") int sd_number, @RequestParam("m_number") int m_number,
									@RequestParam("go_number") int go_number) {
		System.out.println("getRefund: " + g_id + " & " + s_number + " & " + sd_number + " & " + m_number);
		GymOrder refundData = hs.getRefundData(g_id, s_number, sd_number, m_number, go_number);
		return refundData;
	}

	// 환불버튼 클릭 시 환불진행
	@ResponseBody
	@RequestMapping(value = "hsRefundUsingGym")
	public String hsRefundUsingGym(@RequestParam("g_id") int g_id, @RequestParam("s_number") int s_number,
								   @RequestParam("sd_number") int sd_number, @RequestParam("m_number") int m_number, 
								   @RequestParam("go_number") int go_number, @RequestParam("refund_point") int refund_point) {

		System.out.println("hsController hsRefundUsingGym start...");
		System.out.println("check value: " + g_id + " & " + s_number + " & " 
											+ sd_number + " & " + m_number + " & " + go_number + " & " + refund_point);

		// 1. GymOrder에 환불정보 업데이트
		// -> 조회한 예상환불금액으로 변경
		System.out.println("1. updateGymOrder start...");

		Map<String, Object> params = new HashMap<>();
		params.put("g_id", g_id);
		params.put("s_number", s_number);
		params.put("sd_number", sd_number);
		params.put("m_number", m_number);
		params.put("go_number", go_number);
		params.put("refund_point", refund_point);

		int updateGymOrderRefundResult = hs.updateGymOrderRefund(params);

		// 2. Member 환불포인트 업데이트
		System.out.println("2. updatePointRefund start...");
		int updatePointRefundResult = hs.updatePointRefund(params);

		return "hs/memberIndex?m_number=" + m_number;
	}

}
