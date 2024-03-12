package com.oracle.hellong.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.hellong.model.Board;
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
	 @RequestMapping(value="hsListMember")
	 public String hsListMember (Member member, Model model) {
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
		 System.out.println("hsController hsListMember listMember.size()-> " +listMember.size());
		 
		 model.addAttribute("totalMember", totalMember);
		 model.addAttribute("listMember", listMember);
		 model.addAttribute("page", page);
		 return "hs/listMember";
	 }
	 
	 // 아이디 클릭시 index 이동
	 @RequestMapping(value="hsMemberIndex")
	 public String hsIndex (Member member, Model model, HttpSession session) {
		 System.out.println("hsController hsMemberIndex start...");
		 System.out.println("member.getM_number-> " +member.getM_number());
		 System.out.println("session.getM_number-> " +session.getAttribute("m_number"));
		 // 로그인 기능 사용시 session.getattribute로 사용
//		 model.addAttribute("m_number", session.getAttribute("m_number"));
		 model.addAttribute("m_number", member.getM_number());
		 
		 return "hs/memberIndex";
	 }
	 
	 
	 /* 공지사항 */
	 
	 // 공지사항 목록 
	 //  -> page 기능 이상해서 수정해야됨
	 @RequestMapping(value="hsListNoticeBoard")
	 public String hsListNoticeBoard (Board board, Member member, Model model) {
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
	 
	 // 공지 제목 눌렀을 때 상세내용 제공
	 @GetMapping(value="hsDetailNoticeBoard")
	 public String hsDetailNoticeBoard(Board board1, Member member, Model model) {
		 System.out.println("hsController hsDetailNoticeBoard start...");
		 int result = hs.updateReadCount(board1.getB_number());
		 Board board = hs.detailNoticeBoard(board1.getB_number());
		 
		 Member memberData = hs.getMemberData(member.getM_number());
		 int common_mcd = memberData.getCommon_mcd();
		 System.out.println("hsController hsDetailNoticeBoard common_mcd-> " + common_mcd);
		 
		 model.addAttribute("noticeBoard",board);
		 model.addAttribute("common_mcd", common_mcd);
		 model.addAttribute("m_number", member.getM_number());
		 
		 return "hs/detailNoticeBoard";
	 }
	 
	 // 글 작성 폼
	 @RequestMapping(value="hsCreateFormNoticeBoard")
	 public String hsCreateNoticeBoard(Member member, Model model) {
		 System.out.println("hsController hsCreateFormNoticeBoard start...");
		 Member memberData = hs.getMemberData(member.getM_number());
		 model.addAttribute("member", memberData);
		 
		 return "hs/createFormNoticeBoard";
	 }
	 
	 // 글 작성
	 @PostMapping(value="hsCreateNoticeBoard")
	 public String hsCreateNoticeBoard(Board board, Member member, Model model) {
		 System.out.println("create: "+member.getM_number());
		 System.out.println("hsController hsCreateNoticeBoard start...");
		 int createResult = hs.createNoticeBoard(board);
		 if (createResult > 0) {
			 return "redirect:hsListNoticeBoard?m_number="+member.getM_number();
		 }
		 else {
			 model.addAttribute("msg", "입력 실패");
			 return "forward:hsCreateFormNoticeBoard";
		 }
	 }
	 
	 // 글 수정폼
	 @GetMapping(value="hsUpdateFormNoticeBoard")
	 public String hsUpdateFormNoticeBoard(Board board1, Member member, Model model) {
		 System.out.println("hsController hsUpdateFormNoticeBoard start...");
		 System.out.println("updateForm: " + member.getM_number());
		 Board board = hs.detailNoticeBoard(board1.getB_number());
		 System.out.println("board.getB_number()->" + board.getB_number());
		 System.out.println("board.getB_update()->" + board.getB_update());
		 
		 // board의 b_update를 string으로 해야되는거아닌가?
/*		 String updateDate = "";
		 if (board.getB_update() != null) {
			 updateDate = board.getB_update().toString().substring(0,10);
			 board.setB_update(updateDate);
		 }
		 System.out.println("board.getB_update()->" + board.getB_update());*/
		 model.addAttribute("noticeBoard", board);
		 model.addAttribute("m_number", member.getM_number());
		 return "hs/updateFormNoticeBoard";
	 }
	 
	 // 글 수정
	 @PostMapping(value="hsUpdateNoticeBoard")
	 public String hsUpdateNoticeBoard (Board board1, Member member, Model model) {
		 System.out.println("hsController hsUpdateNoticeBoard start...");
		 System.out.println("updateClear: " + member.getM_number());
		 
		 int updateCount = hs.updateNoticeBoard(board1);
		 System.out.println("hsController hs.updateNoticeBoard updateCount ->" + updateCount);
		 return "redirect:hsListNoticeBoard?m_number="+member.getM_number();
	 }
	 
	 // 글 삭제버튼
	 @RequestMapping(value="hsDeleteNoticeBoard")
	 public String hsDeleteNoticeBoard (Board board, Member member, Model model) {
		 System.out.println("hsController hsDeleteNoticeBoard start...");
		 System.out.println("delete: " + member.getM_number());
		 
		 int result = hs.deleteNoticeBoard(board.getB_number());
		 return "redirect:hsListNoticeBoard?m_number="+member.getM_number();
	 }
	 
	 // 검색기능 
	 // -> (페이지기능 이상해서 수정해야됨)
	 @RequestMapping(value="hsSearchNoticeBoard")
	 public String hsSearchNoticeBoard (Board board, Member member, Model model) {
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
	 
	 
	 /* 포인트 내역 */
	 
	 
	 // 포인트내역 폼 (충전내역으로 시작)
	 @RequestMapping(value="hsListPoint")
	 public String hsListPoint (Member member, Model model) {
		 
		 System.out.println("hsController hsListPoint start...");
		 
//		 if (pointCharge.getCurrentPage() == null)
//			 pointCharge.setCurrentPage("1");
		 System.out.println("currentPage: " + member.getCurrentPage());
		 System.out.println("m_number: " +member.getM_number());
		
		 // 회원이름, 회원보유포인트 데이터 얻기
		 Member memberData = hs.getMemberData(member.getM_number());
		 System.out.println("hsController hsListPoint memberNumber ->" + memberData.getM_number());
		 
		 model.addAttribute("memberData", memberData);
		 
		 int totalListPointCharge = hs.totalListPointCharge(member.getM_number());
		 System.out.println("hsController hsListPoint totalListPointCharge ->" + totalListPointCharge);
		 
		 HSPaging page = new HSPaging(totalListPointCharge, member.getCurrentPage());
		 member.setStart(page.getStart());
		 member.setEnd(page.getEnd());
		 System.out.println("get member ->" + member);
		 
		 List<PointCharge> listPointCharge = hs.listPointCharge(member);
		 System.out.println("hsController hsListPointCharge listPointCharge.size() ->" +listPointCharge.size());
		 

		 
		 model.addAttribute("totalListPoint", totalListPointCharge);
		 model.addAttribute("listPoint", listPointCharge);
		 model.addAttribute("page", page);
		 model.addAttribute("category", "충전");
		 
		 return "hs/listPoint";
	 }
	 
	 @RequestMapping(value="hsCondListPoint")
	 public String hsCondListPoint (@RequestParam("select") String action, Member member, Model model) {
		 
		 System.out.println("hsController hsCondListPoint start...");
		 System.out.println("listPoint: " + member.getM_number());
		 
		 // 회원이름, 회원보유포인트 데이터 얻기
		 Member memberData = hs.getMemberData(member.getM_number());
		 System.out.println("hsController hsListPoint memberNumber ->" + memberData.getM_number());
		 
		 model.addAttribute("memberData", memberData);
		 
		 // 버튼 클릭시 조건에 맞는 데이터 반환
		 if ("point_charge".equals(action)) {
			 int totalListPointCharge = hs.totalListPointCharge(member.getM_number());
			 System.out.println("hsController hsListPoint totalListPointCharge ->" + totalListPointCharge);
			 
			 HSPaging page = new HSPaging(totalListPointCharge, member.getCurrentPage());
			 member.setStart(page.getStart());
			 member.setEnd(page.getEnd());
			 
			 List<PointCharge> listPointCharge = hs.listPointCharge(member);
			 System.out.println("hsController hsListPointCharge listPointCharge.size() ->" +listPointCharge.size());
			 
			 model.addAttribute("totalListPoint", totalListPointCharge);
			 model.addAttribute("listPoint", listPointCharge);
			 model.addAttribute("page", page);
			 model.addAttribute("category", "충전");
			 
		 } else if ("gym_order_deal".equals(action)) {
			 int totalListPointDeal = hs.totalListGymOrderDeal(member.getM_number()); 
			 System.out.println("hsController hsListPoint totalListPointDeal ->" + totalListPointDeal);
			 
			 HSPaging page = new HSPaging(totalListPointDeal, member.getCurrentPage());
			 member.setStart(page.getStart());
			 member.setEnd(page.getEnd());
			 
			 List<GymOrder> listGymOrderDeal = hs.listGymOrderDeal(member);
			 System.out.println("hsController hsListPointCharge listPointCharge.size() ->" +listGymOrderDeal.size());
			 
			 model.addAttribute("totalListPoint", totalListPointDeal);
			 model.addAttribute("listPoint", listGymOrderDeal);
			 model.addAttribute("page", page);
			 model.addAttribute("category", "사용");
			 
		 } else if ("gym_order_refund".equals(action)) {
			 int totalListPointRefund = hs.totalListGymOrderRefund(member.getM_number()); 
			 System.out.println("hsController hsListPoint totalListPointRefund ->" + totalListPointRefund);
			 
			 HSPaging page = new HSPaging(totalListPointRefund, member.getCurrentPage());
			 member.setStart(page.getStart());
			 member.setEnd(page.getEnd());
			 
			 List<GymOrder> listGymOrderRefund = hs.listGymOrderRefund(member);
			 System.out.println("hsController hsListPointCharge listPointCharge.size() ->" +listGymOrderRefund.size());
			 
			 model.addAttribute("totalListPoint", totalListPointRefund);
			 model.addAttribute("listPoint", listGymOrderRefund);
			 model.addAttribute("page", page);
			 model.addAttribute("category", "환불");
		 }
		 
		 return "hs/condListPoint";
	 }
	  
	 /* 포인트 충전 */
	 
	 @RequestMapping(value="hsChargeFormPoint")
	 public String hsChargeFormPoint (Member member, Model model) {
		 // api 사용
		 
		 return "hs/chargeFormPoint";
	 }
	 
	 @PostMapping(value="hsChargePoint")
	 public String hsChargePoint (Member member, Model model) {
		 
		 return null;
	 }
	 
	 /* 헬스장 이용내역 */
	 
	 @RequestMapping(value="hsDetailUsingGym")
	 public String hsDetailUsingGym (Member member, Model model) {
		 
		 // 팀원분들 data 참고
		 
		 System.out.println("hsController hsDetailUsingGym start...");
		 int totalGym = hs.totalUsingGym(member.getM_number());
		 System.out.println("hsController hsDetailUsingGym totalGym ->" + totalGym);
		 
		 HSPaging page = new HSPaging(totalGym, member.getCurrentPage());
		 member.setStart(page.getStart());
		 member.setEnd(page.getEnd());
		 
		 List<GymOrder> listUsingGym = hs.listUsingGym(member);
		 System.out.println("hsController hsDetailUsingGym listGSDetail.size()-> " + listGSDetail.size());
		 
		 model.addAttribute("m_number", member.getM_number());
		 model.addAttribute("listUsingGym", listUsingGym);
		 model.addAttribute("page", page);
		 
		 return "hs/detailUsingGym";
	 }
	 
	 
	 /* 포인트 환불 */
	 
	 @GetMapping(value="hsRefundFormUsingGym")
	 public String hsRefundFormUsingGym (Member member, Model model ) {
		 System.out.println("hsController hsRefundFormUsingGym start...");
		 
		 Member memberData = hs.getMemberData(member.getM_number());
		 List<GymOrder> listGymName = hs.getListGymName(member.getM_number());
		 
		 System.out.println("hsController hsRefundFormUsingGym listGymName.size()-> " + listGymName.size());
		 model.addAttribute("listGymName", listGymName);
		 model.addAttribute("memberData", memberData);
		 
		 return "hs/refundFormUsingGym";
	 }
	 
	 @ResponseBody 
	 @GetMapping(value="hsGetServicesByGymId")
	 public List<GymOrder> hsGetServicesByGymId (@RequestParam("gymId") int gymId, @RequestParam("m_number") int m_number) {
		 System.out.println("getService: " + gymId + " & " + m_number);
		 List<GymOrder> listGymService = hs.getListGymService(gymId, m_number);
		 return listGymService;
		 
	 } 
	 
	 @ResponseBody
	 @GetMapping(value="hsGetRefundPrice")
	 public GymOrder hsGetRefundPrice (@RequestParam("gymId") int gymId, @RequestParam("s_number") int s_number, 
             						@RequestParam("s_detail") int s_detail, @RequestParam("m_number") int m_number) {
		 System.out.println("getRefund: " + gymId + " & " + s_number + " & " + s_detail + " & " + m_number);
		 GymOrder refundPrice = hs.getRefundPrice(gymId, s_number, s_detail, m_number);
		 
		 return refundPrice;
	 }
	 
	 
	 @PostMapping(value="hsRefundListUsingGym")
	 public String hsRefundListUsingGym (@RequestParam("selectedGym") int selectedGymId, Member member, Model model) {
		 System.out.println("hsController hsRefundUsingGym start...");
		 System.out.println("refundservice selectedGymID: " + selectedGymId);
		 System.out.println("refundservice m_number: " + member.getM_number());
		 //List<GymOrder> listGymOrder = hs.getListGymOrder(member.getM_number(), selectedGymId);
		 
		 //System.out.println("hsController hsRefundUsingGym listGymOrder.size() ->" + listGymOrder.size());
		 
		 //model.addAttribute("listGymOrder", listGymOrder);
		 
		 // int result = hs.refundUsingGym() -> service_id를 받아서 delete 쿼리 수행하기
		 
		return "hs/refundFormUsingGym";
		 
	 }
	 
}
