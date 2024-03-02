package com.oracle.hellong.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.Member;
import com.oracle.hellong.service.sh.Paging;
import com.oracle.hellong.service.sh.SHService;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
@RequiredArgsConstructor
@Slf4j
public class SHController {
	private final SHService sh;

	@RequestMapping("/login")
	public String login() {
		System.out.println("SHController login start...");
		return "login";

	}

	// 해당로그인 한계정이 있는지 확인...
	@RequestMapping("authenticate")
	public String authenticate(HttpSession session, @RequestParam("member_id") String member_id,

			Model model) {
		System.out.println("SHController authenticate start...");
		boolean same = sh.authenticate(member_id);
		// 해당 로그인 정보가 맞는지 참or거짓 으로 분류
		if (same) {
			session.setAttribute("m_id", member_id);

			// 참일시 해당 로그인 정보를 세션에 저장...
			System.out.println("session.setAttribute start!");
		} else {
			System.out.println("SHController authenticate else...");
			model.addAttribute("loginError", true);
			return "login";
		}

		return "forward:loginAction1";
	}

	@RequestMapping("loginAction1")
	public String loginAction1(HttpSession session, Board board, Model model) {
		System.out.println("SHController loginAction1 start...");
		String member_id = (String) session.getAttribute("m_id");
		// 로그인 세션에서 아이디를 가져옴
		System.out.println("SHController loginAction1  member_id kkk->" + member_id);

		String currentPage = "1";
		int M_NUMBER = sh.changeM_num(member_id);
		System.out.println("SHController Start questionsList... kkk");
		int toalquestions = sh.totalquestions(M_NUMBER);
		// Paging 작업
		System.out.println("SHController loginAction toalquestions->" + toalquestions);
		Paging page = new Paging(toalquestions, currentPage);

		System.out.println("SHController loginAction page->" + page);
		// Parameter board --> Page만 추가 Setting

//m_id를 m_num 번호로 바꿔주는 역할을....

		board.setM_number(M_NUMBER);
		board.setStart(page.getStart());
		board.setEnd(page.getEnd());
//가져올 보드의 정보를 기입...

		List<Board> listBoard = sh.quelist(board);
		Map<Integer, Integer> commentCounts = sh.getCommentCountsForPosts(listBoard);
//입력한 보드 정보를 모델에 넣고 프론트로 전송!
		System.out.println("SHController loginAction1 listBoard size-->" + listBoard.size());

		model.addAttribute("toalquestions", toalquestions);
		model.addAttribute("listBoard", listBoard);
		model.addAttribute("page", page);
		model.addAttribute("commentCounts", commentCounts); // 댓글 수 정보 모델에 추가

		return "questionsList";
	}

	@GetMapping("listque")
	public String listque(HttpSession session, Board board, Model model) {
		System.out.println("SHController listque start...");
		String member_id = (String) session.getAttribute("m_id");
		int M_NUMBER = sh.changeM_num(member_id);
		// 로그인 세션에서 아이디를 가져옴
		System.out.println("SHController quelist member_id->" + member_id);

		System.out.println("SHController Start questionsList...");
		int toalquestions = sh.totalquestions(M_NUMBER);
		
		// Paging 작업
		Paging page = new Paging(toalquestions, board.getCurrentPage());
		// Parameter board --> Page만 추가 Setting

//m_id를 m_num 번호로 바꿔주는 역할을....

		board.setM_number(M_NUMBER);
		board.setStart(page.getStart());
		board.setEnd(page.getEnd());
//가져올 보드의 정보를 기입...
		List<Board> listBoard = sh.quelist(board);
		Map<Integer, Integer> commentCounts = sh.getCommentCountsForPosts(listBoard);
//입력한 보드 정보를 모델에 넣고 프론트로 전송!
		System.out.println("SHController loginAction listBoard size-->" + listBoard.size());
		System.out.println("여기여기!!!!"+commentCounts);
		model.addAttribute("toalquestions", toalquestions);
		model.addAttribute("listBoard", listBoard);
		model.addAttribute("page", page);
		model.addAttribute("commentCounts", commentCounts); // 댓글 수 정보 모델에 추가
		return "questionsList";
	}

	// 작성글 열람
	@RequestMapping("/QuestionContent")
	public String QuestionContent(@RequestParam("B_NUMBER") int B_NUMBER, Model model) {
		System.out.println("SHController QuestionContent start...");
		System.out.println("SHController QuestionContent B_NUMBER" + B_NUMBER);
		Board boardContent = sh.boardContent(B_NUMBER);
		
		
	    System.out.println("SHController QuestionContent  boardContent->"+boardContent);
		
	    //작성글안에 속해있는 댓글들 보냄
		List<Board> boardCommList = sh.getComments(B_NUMBER);
		System.out.println("SHController  boardCommList size-->" + boardCommList.size());
	
	
		// 리스트에서 첫 번째 Board 객체를 모델에 추가
		model.addAttribute("board", boardContent);
		model.addAttribute("boardCommList", boardCommList);
		System.out.println("SHController QuestionContent boardContent ->" + boardContent);
		return "QuestionContent";
	}

//목록보기
	@RequestMapping("qlist")
	public String list(@RequestParam("mId") int M_NUMBER, Board board, Model model) {

		String currentPage = "1";
		int toalquestions = sh.totalquestions(M_NUMBER);
		System.out.println("SHController list toalquestions->" + toalquestions);
		Paging page = new Paging(toalquestions, currentPage);
		board.setM_number(M_NUMBER);
		board.setStart(page.getStart());
		board.setEnd(page.getEnd());
		List<Board> listBoard = sh.quelist(board);
		Map<Integer, Integer> commentCounts = sh.getCommentCountsForPosts(listBoard);

		System.out.println("SHController list listBoard size-->" + listBoard.size());
	

		model.addAttribute("toalquestions", toalquestions);
		model.addAttribute("listBoard", listBoard);
		model.addAttribute("page", page);
		model.addAttribute("commentCounts", commentCounts); // 댓글 수 정보 모델에 추가

		return "questionsList";

	}

//글작성뷰
	@RequestMapping("write_view")
	public String writeView(@RequestParam("M_NUMBER") int M_NUMBER, Board board, Model model) {
		System.out.println("SHController write_view start...");
		board.setM_number(M_NUMBER);
		model.addAttribute("board", board);
		return "write_view";
	}

//글작성 실행
	@PostMapping("write")
	public String write(HttpSession session, HttpServletRequest request, @RequestParam("mId") int M_NUMBER, Board board,
			Model model) {
		System.out.println("SHController write start...");
// 필요한것 - 작성자 번호,글 번호(시퀀스 사용하자!), 카테고리,내용
		String bTitle = (String) request.getParameter("bTitle");
		String bContent = (String) request.getParameter("bContent");
		System.out.println(M_NUMBER);
		System.out.println(bTitle);
		System.out.println(bContent);
		int category = 3;

		board.setM_number(M_NUMBER);
		board.setB_category(category);
		board.setB_title(bTitle);
		board.setB_content(bContent);
		System.out.println("SHController write board" + board);

		sh.addAttribute(board);

		return "redirect:loginAction1";
	}
//글 삭제

	@RequestMapping("delete")
	public String delete_que(@RequestParam("bId") int bId) {
		System.out.println("SHController delete_que start...");
		System.out.println("SHController delete_que @RequestParam bId->" + bId);
		sh.delete_que(bId);

		return "forward:listque";
	}

//댓글입력 과동시에 신규 댓글 단일객체만 등록 Board!+원글댓글 카운터 증가
	@ResponseBody
	@PostMapping("commentInsert")
	public Board commentInsert(@RequestParam("comment_body") String comment, @RequestParam("mId") int M_NUMBER,
			@RequestParam("bId") int B_NUMBER, Board board) {

		System.out.println("SHController commentInsert M_NUMBER" + " => " + M_NUMBER);
		System.out.println("SHController commentInsert B_NUMBER" + " => " + B_NUMBER);
		int category = 5;// 임시 댓글 카테고리
		board.setB_comm_group(B_NUMBER);
		board.setM_number(M_NUMBER);
		board.setB_category(category);
		board.setB_content(comment);

		sh.addComment(board);
		System.out.println(" 1  SHController addComment board()->" + board);

		Board board2 = sh.callComment(board);

		System.out.println("2   SHController callComment board()->" + board2);
		return board2;
	}

//댓글 삭제
@RequestMapping("/deleteComment")
public String deleteComment(@RequestParam("Comm_number") int Comm_number,
							@RequestParam("bId")int bId	) {
	System.out.println("SHController deleteComment start...");
	sh.deleteComment(Comm_number);
	System.out.println("SHController deleteComment succes...");
	
    return "redirect:/QuestionContent?B_NUMBER="+bId;
}
//글수정 뷰이동
@RequestMapping("/modify")
public String modify(@RequestParam("bId")int B_NUMBER,Board board,Model model) {
	System.out.println("SHController modify start...");
	System.out.println("SHController modify B_NUMBER->"+B_NUMBER);
	Board boardContent = sh.boardContent(B_NUMBER);
	model.addAttribute("board",boardContent);
    return "modifyView";
}

//수정 실행
	@PostMapping("modifyaction")
	public String modifyaction(HttpSession session, 
							   HttpServletRequest request, 
							   @RequestParam("bId") int B_NUMBER, 
							   Board board,
							   Model model) {
		System.out.println("SHController write start...");
		String bTitle = (String) request.getParameter("bTitle");
		String bContent = (String) request.getParameter("bContent");
		System.out.println(B_NUMBER);
		System.out.println(bTitle);
		System.out.println(bContent);
		int category = 3;

		board.setB_number(B_NUMBER);
		board.setB_category(category);
		board.setB_title(bTitle);
		board.setB_content(bContent);
		System.out.println("SHController write board" + board);

		sh.updateAttribute(board);

		return "redirect:/QuestionContent?B_NUMBER="+B_NUMBER;
	}


}
