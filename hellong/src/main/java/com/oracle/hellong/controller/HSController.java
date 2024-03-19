package com.oracle.hellong.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.transaction.PlatformTransactionManager;
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
import com.oracle.hellong.service.jm.JMService;
import com.oracle.hellong.service.jm.JmPaging;
import com.oracle.hellong.service.hs.HSPaging;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class HSController { //////
	
	private final JMService jm;
	private final HSService hs;
	
	@Autowired
	private PlatformTransactionManager transactionManager;

//	 @GetMapping()
//		public void hsHello() { //이름 규칙 권장
//			
//		}

	/* 로그인 임시구현 */

	// 로그인 임시구현
	@RequestMapping(value = "hsListMember")
	public String hsListMember(Member member, Model model) {
		System.out.println("hsController hsListMember start...");
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
	public String hsIndex(Model model, HttpSession session) {
		
		if (session.getAttribute("m_number") != null) { // 로그인되어있을때
			Member member = new Member();
			member = jm.jmGetMemberFromNumber((int) session.getAttribute("m_number"));
			
			System.out.println("체크체크: " +member.getM_number());
			model.addAttribute("m_number", member.getM_number());

			return "hs/memberIndex";
		}	
		else {
			return "jm/jmLoginForm";
		}

	}

	/* 공지사항 */

	// 공지글 목록
	@RequestMapping(value = "hsListNoticeBoard")
	public String hsListNoticeBoard(Board board, Model model, HttpSession session) {
		if (session.getAttribute("m_number") != null) { // 로그인되어있을때
			Member member = new Member();
			member = jm.jmGetMemberFromNumber((int) session.getAttribute("m_number"));
			
			System.out.println("hsController hsListNoitceBoard start...");
			System.out.println("체크체크: " +member.getM_number());

			// 공지글 total수 조회
			int totalBoard = hs.totalNoticeBoard();
			System.out.println("hsController start totalNoticeBoard->" + totalBoard);

			// paging
			HSPaging page = new HSPaging(totalBoard, board.getCurrentPage());
			board.setStart(page.getStart());
			board.setEnd(page.getEnd());

			// 공지글 list 가져오기
			List<Board> listBoard = hs.listNoticeBoard(board);
			System.out.println("hsController list hsListNoticeBoard.size()->" + listBoard.size());

	        
			model.addAttribute("totalNoticeBoard", totalBoard);
			model.addAttribute("ListNoticeBoard", listBoard);
			model.addAttribute("page", page);
			model.addAttribute("common_mcd", member.getCommon_mcd());
			model.addAttribute("m_number", member.getM_number());

			return "hs/listNoticeBoard";
		}	
		else {
			return "jm/jmLoginForm";
		}
	}

	// 공지글 세부내용 + 조회수 증가
	@GetMapping(value = "hsDetailNoticeBoard")
	public String hsDetailNoticeBoard(Board board1,  Model model, HttpSession session) {
		
		System.out.println("hsController hsDetailNoticeBoard start...");
		
		if (session.getAttribute("m_number") != null) { // 로그인되어있을때
			Member member = new Member();
			member = jm.jmGetMemberFromNumber((int) session.getAttribute("m_number"));
			
			System.out.println("체크체크: " +member.getM_number());

			int result = hs.updateReadCount(board1.getB_number());
			Board board = hs.detailNoticeBoard(board1.getB_number());

			int common_mcd = member.getCommon_mcd();
			System.out.println("hsController hsDetailNoticeBoard common_mcd-> " + common_mcd);

			model.addAttribute("noticeBoard", board);
			model.addAttribute("common_mcd", common_mcd);
			model.addAttribute("m_number", member.getM_number());

			return "hs/detailNoticeBoard";
		}	
		else {
			return "jm/jmLoginForm";
		}
	}

	// 공지글 작성 폼
	@RequestMapping(value = "hsCreateFormNoticeBoard")
	public String hsCreateNoticeBoard(Model model, HttpSession session) {
		System.out.println("hsController hsCreateFormNoticeBoard start...");
		
		if (session.getAttribute("m_number") != null) { // 로그인되어있을때
			Member member = new Member();
			member = jm.jmGetMemberFromNumber((int) session.getAttribute("m_number"));
			
			System.out.println("체크체크: " +member.getM_number());

			model.addAttribute("member", member);

			return "hs/createFormNoticeBoard";
		}	
		else {
			return "jm/jmLoginForm";
		}

	}

	// 공지글 작성
	@PostMapping(value = "hsCreateNoticeBoard")
	public String hsCreateNoticeBoard(Board board, Model model, HttpSession session) {
		System.out.println("hsController hsCreateNoticeBoard start...");
		
		if (session.getAttribute("m_number") != null) { // 로그인되어있을때
			Member member = new Member();
			member = jm.jmGetMemberFromNumber((int) session.getAttribute("m_number"));
			
			System.out.println("체크체크: " +member.getM_number());
			
			int createResult = hs.createNoticeBoard(board);
			if (createResult > 0) {
				return "redirect:hsListNoticeBoard?m_number=" + member.getM_number();
			} else {
				model.addAttribute("msg", "입력 실패");
				return "forward:hsCreateFormNoticeBoard";
			}
		}	
		else {
			return "jm/jmLoginForm";
		}
		
	}

	// 공지글 수정 폼
	@GetMapping(value = "hsUpdateFormNoticeBoard")
	public String hsUpdateFormNoticeBoard(Board board1, Model model, HttpSession session) {
		System.out.println("hsController hsUpdateFormNoticeBoard start...");
		
		if (session.getAttribute("m_number") != null) { // 로그인되어있을때
			Member member = new Member();
			member = jm.jmGetMemberFromNumber((int) session.getAttribute("m_number"));
			
			System.out.println("체크체크: " +member.getM_number());
			
			Board board = hs.detailNoticeBoard(board1.getB_number());
			System.out.println("board.getB_number()->" + board.getB_number());
			System.out.println("board.getB_update()->" + board.getB_update());

			model.addAttribute("noticeBoard", board);
			model.addAttribute("m_number", member.getM_number());
			return "hs/updateFormNoticeBoard";
		}	
		else {
			return "jm/jmLoginForm";
		}
	}

	// 공지글 수정
	@PostMapping(value = "hsUpdateNoticeBoard")
	public String hsUpdateNoticeBoard(Board board1, Model model, HttpSession session) {
		System.out.println("hsController hsUpdateNoticeBoard start...");
		
		if (session.getAttribute("m_number") != null) { // 로그인되어있을때
			Member member = new Member();
			member = jm.jmGetMemberFromNumber((int) session.getAttribute("m_number"));
			
			System.out.println("체크체크: " +member.getM_number());
			
			int updateCount = hs.updateNoticeBoard(board1);
			
			System.out.println("hsController hs.updateNoticeBoard updateCount ->" + updateCount);
			return "redirect:hsListNoticeBoard?m_number=" + member.getM_number();
		}	
		else {
			return "jm/jmLoginForm";
		}
		
	}

	// 공지글 삭제
	@RequestMapping(value = "hsDeleteNoticeBoard")
	public String hsDeleteNoticeBoard(Board board, Model model, HttpSession session) {
		System.out.println("hsController hsDeleteNoticeBoard start...");
		if (session.getAttribute("m_number") != null) { // 로그인되어있을때
			Member member = new Member();
			member = jm.jmGetMemberFromNumber((int) session.getAttribute("m_number"));
			
			System.out.println("체크체크: " +member.getM_number());

			int result = hs.deleteNoticeBoard(board.getB_number());
			return "redirect:hsListNoticeBoard?m_number=" + member.getM_number();
		}	
		else {
			return "jm/jmLoginForm";
		}
	}

	// 공지글 검색 (제목,내용)
	@RequestMapping(value = "hsSearchNoticeBoard")
	public String hsSearchNoticeBoard(Board board1, Model model, HttpSession session) {
		System.out.println("hsController hsSearchNoticeBoard start...");
		
		if (session.getAttribute("m_number") != null) { // 로그인되어있을때
			Member member = new Member();
			member = jm.jmGetMemberFromNumber((int) session.getAttribute("m_number"));
			
			System.out.println("체크체크: " +member.getM_number());

			int condTotalBoard = hs.condTotalNoticeBoard(board1);
			System.out.println("hsController hsSearchNoticeBoard condTotalBoard ->" + condTotalBoard);

			HSPaging page = new HSPaging(condTotalBoard, board1.getCurrentPage());

			board1.setStart(page.getStart());
			board1.setEnd(page.getEnd());

			List<Board> searchBoard = hs.searchNoticeBoard(board1);
			System.out.println("hsController hsSearchNoticeBoard searchBoard.size() -> " + searchBoard.size());

			model.addAttribute("totalNoticeBoard", condTotalBoard);
			model.addAttribute("ListNoticeBoard", searchBoard);
			model.addAttribute("page", page);
			model.addAttribute("m_number", member.getM_number());
			model.addAttribute("common_mcd", member.getCommon_mcd());

			return "hs/listCondNoticeBoard";
		}	
		else {
			return "jm/jmLoginForm";
		}
	}

	/* 포인트 내역 조회 */

	// 포인트 충전내역 
	@RequestMapping(value = "hsListChargePoint")
	public String hsListChargePoint(Member member1, Model model, HttpSession session) {

		System.out.println("hsController hsListChargePoint start...");

		if (session.getAttribute("m_number") != null) { // 로그인되어있을때
			Member member = new Member();
			member = jm.jmGetMemberFromNumber((int) session.getAttribute("m_number"));
			
			System.out.println("체크체크: " +member.getM_number());
			System.out.println("체크체크2: " +member1.getM_number());
			
			Member memberData = hs.getMemberData(member1.getM_number());
			
			// 포인트 충전내역 조회
			int totalListPointCharge = hs.totalListPointCharge(member1.getM_number());
			System.out.println("hsController hsListChargePoint totalListPointCharge ->" + totalListPointCharge);

			HSPaging page = new HSPaging(totalListPointCharge, member1.getCurrentPage());
			member1.setStart(page.getStart());
			member1.setEnd(page.getEnd());
			System.out.println("get member ->" + memberData);

			List<PointCharge> listPointCharge = hs.listPointCharge(member1);
			System.out.println("hsController hsListPointCharge listPointCharge.size() ->" + listPointCharge.size());

			model.addAttribute("memberData", member);
			model.addAttribute("totalListPoint", totalListPointCharge);
			model.addAttribute("listPoint", listPointCharge);
			model.addAttribute("page", page);
			model.addAttribute("category", "충전");

			return "hs/listChargePoint";
		}	
		else {
			return "jm/jmLoginForm";
		}
	}
	
	// 포인트 사용내역
	@RequestMapping(value="hsListUsePoint") 
	public String hsListBuyPoint (Member member1, Model model, HttpSession session) {
		 
		System.out.println("hsController hsListBuyPoint start...");
		
		if (session.getAttribute("m_number") != null) { // 로그인되어있을때
			Member member = new Member();
			member = jm.jmGetMemberFromNumber((int) session.getAttribute("m_number"));
			
			System.out.println("체크체크: " +member.getM_number());
			System.out.println("체크체크2: " +member1.getM_number());
			
		
			Member memberData = hs.getMemberData(member1.getM_number());
			
			int totalListPointDeal = hs.totalListGymOrderDeal(member1.getM_number());
			System.out.println("hsController hsListPoint totalListPointDeal ->" + totalListPointDeal);
			 
			HSPaging page = new HSPaging(totalListPointDeal, member1.getCurrentPage());
			member1.setStart(page.getStart()); 
			member1.setEnd(page.getEnd());
			 
			List<GymOrder> listGymOrderDeal = hs.listGymOrderDeal(member1);
			System.out.println("hsController hsListPointCharge listPointCharge.size() ->" +listGymOrderDeal.size()); 
			System.out.println("DealTest Controller: " +listGymOrderDeal);
			
			model.addAttribute("memberData", memberData); 
			model.addAttribute("totalListPoint", totalListPointDeal);
			model.addAttribute("listPoint", listGymOrderDeal); 
			model.addAttribute("page", page);
			model.addAttribute("category", "사용");
			 
			return "hs/listUsePoint"; 
		}	
		else {
			return "jm/jmLoginForm";
		}
		 
	}
	
	// 포인트 환불내역
	@RequestMapping(value="hsListRefundPoint")
	public String hsListRefundPoint (Member memebr1, Model model, HttpSession session) {
		 
		System.out.println("hsController hsListRefundPoint start...");
		
		if (session.getAttribute("m_number") != null) { // 로그인되어있을때
			Member member = new Member();
			member = jm.jmGetMemberFromNumber((int) session.getAttribute("m_number"));
			
			System.out.println("체크체크: " +member.getM_number());

			System.out.println("hsController hsListPoint memberNumber ->" + member.getM_number());
			model.addAttribute("memberData", member);
			 
			int totalListPointRefund = hs.totalListGymOrderRefund(memebr1.getM_number()); 
			System.out.println("hsController hsListPoint totalListPointRefund ->" + totalListPointRefund);
			 
			HSPaging page = new HSPaging(totalListPointRefund, memebr1.getCurrentPage());
			memebr1.setStart(page.getStart());
			memebr1.setEnd(page.getEnd());
			 
			List<GymOrder> listGymOrderRefund = hs.listGymOrderRefund(memebr1);
			System.out.println("hsController hsListPointCharge listPointCharge.size() ->" +listGymOrderRefund.size());
			System.out.println("RefundTest Controller: " +listGymOrderRefund);
			
			model.addAttribute("totalListPoint", totalListPointRefund);
			model.addAttribute("listPoint", listGymOrderRefund);
			model.addAttribute("page", page);
			model.addAttribute("category", "환불");
			 
			return "hs/listRefundPoint"; 
		}	
		else {
			return "jm/jmLoginForm";
		}
		
	}

	/* 포인트 충전 */

	@RequestMapping(value = "hsChargeFormPoint")
	public String hsChargeFormPoint(Model model, HttpSession session) {
		
		System.out.println("hsController hsChargeFormPoint start...");
		if (session.getAttribute("m_number") != null) { // 로그인되어있을때
			Member member = new Member();
			member = jm.jmGetMemberFromNumber((int) session.getAttribute("m_number"));
			
			System.out.println("체크체크: " +member.getM_number());
			model.addAttribute("memberData", member);
			
			return "hs/chargeFormPoint";
		}	
		else {
			return "jm/jmLoginForm";
		}

	}

	@GetMapping(value = "hsChargePoint")
	public ResponseEntity<Map<String, Object>> hsChargePoint(PointCharge pointCharge, Model model, HttpSession session) {
		System.out.println("hsController hsChargePoint start...");
		
		if (session.getAttribute("m_number") != null) { // 로그인되어있을때
			Member member = new Member();
			member = jm.jmGetMemberFromNumber((int) session.getAttribute("m_number"));
			
			System.out.println("체크체크: " +member.getM_number());
			
			Map<String, Object> responseData = new HashMap<>();
		    responseData.put("memberData", member);
		    responseData.put("charge_point", pointCharge.getCharge_point());
		    
			return ResponseEntity.ok(responseData);
		}	
		else {
			// string으로 반환이 안되서 해당 status로 로그인이 필요하다는 것을 얄려줌 (근데 실행안되느듯?)
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).header("Location", "/jm/jmLoginForm").build();
		}
		
	}
	
	@ResponseBody
	@GetMapping(value="hsInsertChargePoint")
	public String hsInsertChargePoint(@RequestParam("m_number") int m_number, @RequestParam("charge_point") int charge_point,
										@RequestParam("merchant_uid") String merchant_uid, @RequestParam("pg") String pg, HttpSession session) {
		if (session.getAttribute("m_number") != null) { // 로그인되어있을때
			Member member = new Member();
			member = jm.jmGetMemberFromNumber((int) session.getAttribute("m_number"));
			
			System.out.println("체크체크: " +member.getM_number());
			System.out.println(m_number);
			System.out.println(charge_point);
			System.out.println(merchant_uid);
			System.out.println(pg);

			Map<String, Object> chargeData = new HashMap<>();
			chargeData.put("m_number", member.getM_number());
			chargeData.put("charge_point", charge_point);
			chargeData.put("merchant_uid", merchant_uid);
			chargeData.put("charge_type", pg);
			
			// PointCharge 정보 추가
			int insertPointChargeResult = hs.insertPointCharge(chargeData);
			
			// 회원 포인트 업데이트
			int updatePointChargeResult = hs.updatePointCharge(chargeData);
			
			return null;
		}	
		else {
			return "jm/jmLoginForm";
		}
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
	
	// 결제 버튼 클릭 시 g_id, s_number, m_number 제공받아 시작
	@ResponseBody
	@RequestMapping(value = "hsBuyGymMembership")
	public String hsBuyGymMembership(@RequestParam("m_number") int m_number, @RequestParam("g_id") int g_id, 
										@RequestParam("s_number") int s_number, @RequestParam("sd_number") int sd_number,  
									   @RequestParam("sd_price") int sd_price, HttpSession session) {

		System.out.println("hsController hsBuyGymMembership start...");
		
		if (session.getAttribute("m_number") != null) { // 로그인되어있을때
			Member member = new Member();
			member = jm.jmGetMemberFromNumber((int) session.getAttribute("m_number"));
			
			System.out.println("체크체크: " +member.getM_number());

			TransactionStatus status = transactionManager.getTransaction(new DefaultTransactionDefinition());
			
			try {
				Map<String,Object> params = new HashMap<>();
				params.put("g_id", g_id);
				params.put("s_number", s_number);
				params.put("sd_number", sd_number);
				params.put("m_number", member.getM_number());
				params.put("sd_price", sd_price);
				
				// 1. params 값 GSDetail에 입력
				System.out.println("1. GSDetail select");
				GSDetail gsDetailData = hs.getGSDetailDataBuy(params);
				gsDetailData.setM_number(member.getM_number());
				
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
				
				transactionManager.commit(status);
				System.out.println("transaction success");
				
		    } catch (Exception e) {
		    	transactionManager.rollback(status);
		    	System.out.println("transaction fail");
		    }
			return "redirect:hsMemberIndex?m_number=" + member.getM_number();
		}	
		else {
			return "jm/jmLoginForm";
		}
		
	}
	
	/* 헬스장 회원권 환불 */

	// 헬스장 회원권 환불 폼 생성
	@GetMapping(value = "hsRefundFormUsingGym")
	public String hsRefundFormUsingGym(Model model, HttpSession session) {
		System.out.println("hsController hsRefundFormUsingGym start...");
		
		if (session.getAttribute("m_number") != null) { // 로그인되어있을때
			Member member = new Member();
			member = jm.jmGetMemberFromNumber((int) session.getAttribute("m_number"));
			
			System.out.println("체크체크: " +member.getM_number());

			// 환불 폼에서 이용중인 헬스장 이름 조회
			List<GymOrder> listGymName = hs.getListGymName(member.getM_number());

			System.out.println("hsController hsRefundFormUsingGym listGymName.size()-> " + listGymName.size());
			model.addAttribute("listGymName", listGymName);
			model.addAttribute("memberData", member);

			return "hs/refundFormUsingGym";
		}	
		else {
			return "jm/jmLoginForm";
		}
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
								   @RequestParam("go_number") int go_number, @RequestParam("refund_point") int refund_point, 
								   HttpSession session) {

		System.out.println("hsController hsRefundUsingGym start...");
		
		if (session.getAttribute("m_number") != null) { // 로그인되어있을때
			Member member = new Member();
			member = jm.jmGetMemberFromNumber((int) session.getAttribute("m_number"));
			
			System.out.println("체크체크: " +member.getM_number());

			TransactionStatus status = transactionManager.getTransaction(new DefaultTransactionDefinition());
		    
		    try {
		    	// 1. GymOrder에 환불정보 업데이트
				// -> 조회한 예상환불금액으로 변경
				System.out.println("1. updateGymOrder start...");

				Map<String, Object> params = new HashMap<>();
				params.put("g_id", g_id);
				params.put("s_number", s_number);
				params.put("sd_number", sd_number);
				params.put("m_number", member.getM_number());
				params.put("go_number", go_number);
				params.put("refund_point", refund_point);

				int updateGymOrderRefundResult = hs.updateGymOrderRefund(params);

				// 2. Member 환불포인트 업데이트
				System.out.println("2. updatePointRefund start...");
				int updatePointRefundResult = hs.updatePointRefund(params);
				
				transactionManager.commit(status);
				System.out.println("transaction success");
				
		    } catch (Exception e) {
		    	transactionManager.rollback(status);
		    	System.out.println("transaction fail");
		    }
		    
		    return "hs/memberIndex?m_number=" + m_number;
			
		}	
		else {
			return "jm/jmLoginForm";
		}
	    
	}

}