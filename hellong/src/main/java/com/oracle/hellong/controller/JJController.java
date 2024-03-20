package com.oracle.hellong.controller;

import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.format.datetime.standard.DateTimeFormatterRegistrar;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.Common;
import com.oracle.hellong.model.Member;
import com.oracle.hellong.service.jj.JJPaging;
import com.oracle.hellong.service.jj.JJService;
import com.oracle.hellong.service.sh.SHService;

import jakarta.servlet.http.HttpSession;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class JJController {
	private final JJService js;
	private final SHService sh;
	
	// 게시판 메인페이지
	@RequestMapping(value = "communityBoard")
	public String communityBoard(Board board, Member member, Model model) {
		System.out.println("JJController Start communityBoard...");
		int totalBoard = js.totalBoard();
		System.out.println("JJController Start totalBoard->"+totalBoard);
		
		// paging
		JJPaging page = new JJPaging(totalBoard, board.getCurrentPage());
		board.setStart(page.getStart());
		board.setEnd(page.getEnd());
		
		// list
		List<Board> listBoard = js.listBoard(board);
		System.out.println("JJController list listBoard.size()=>"+listBoard.size());
		
		model.addAttribute("totalBoard", totalBoard);
		model.addAttribute("listBoard", listBoard);
		model.addAttribute("page", page);
		
		return "jj/communityBoard";
		
	}
	
	
	// 게시판 > 게시글 상세페이지
	@GetMapping(value = "detailBoard")
	public String detailBoard(Board pboard, Common common, Member member, Model model, HttpSession session) {
		System.out.println("JJController detailBoard Start...");
		System.out.println("JJController detailBoard pboard->"+pboard);
		System.out.println("session--->"+(Integer)session.getAttribute("m_number"));
		
		int b_number = pboard.getB_number(); // 댓글
		String member_id = (String) session.getAttribute("m_id"); // 댓글
		System.out.println("JJController detailBoard m_id->"+" "+member_id);
		// int M_NUMBER = sh.changeM_num(member_id); // 댓글
		int M_NUMBER = js.jschangeM_num(member_id); // 댓글
		Board board = js.detailBoard(pboard.getB_number());
		System.out.println("JJController detailBoard board->"+board);
		
		List<Common> commonList = js.commonList(common);
		System.out.println("JJController detailBoard commonList->"+commonList);
		List<Board> boardCommList = js.getPComments(b_number); // 댓글
		System.out.println("JJController detailBoard boardCommList->"+boardCommList); // 댓글
		
		model.addAttribute("board", board);
		model.addAttribute("reportTypes", commonList);
		model.addAttribute("boardCommList", boardCommList); // 댓글
		model.addAttribute("M_NUMBER", M_NUMBER); // 댓글
		
		return "jj/detailBoard";
	}
	
	
	//댓글입력 과동시에 신규 댓글 단일객체만 등록 Board!+원글댓글 카운터 증가(wkdb 게시판용)
    @ResponseBody
    @PostMapping("commentInsert1")
	public Board commentInsert1(@RequestParam("comment_body") String comment, @RequestParam("cmId") int m_number,
			@RequestParam("bId") int b_number, Board board) {
		
		System.out.println("JJController commentInsert1 M_NUMBER-> " + m_number);
		System.out.println("JJController commentInsert1 B_NUMBER-> " + b_number);
		int Common_bcd = 200;
		int Common_mcd = 101;

		board.setB_comm_group(b_number);
		board.setM_number(m_number);
		board.setCommon_bcd(Common_bcd);
		board.setCommon_mcd(Common_mcd);
		board.setB_content(comment);

		js.jjAddComment(board);
		
		Board board2 = js.jsCallComment(board);
		System.out.println("JJController after jsCallComment board2->" + board2);

		return board2;
	}
    
    //댓글 삭제
    @RequestMapping("deleteComment1")
    public String deleteComment(@RequestParam("Comm_number") int Comm_number,
    							@RequestParam("bId")int bId	) {
    	System.out.println("SHController deleteComment start...");
    	// sh.deleteComment(Comm_number);
    	js.jsDeleteComment(Comm_number);
    	System.out.println("SHController deleteComment succes...");
    	
        return "redirect:detailBoard?b_number="+bId;
    }
	
	
	// 게시글 수정페이지
	@GetMapping(value = "updateFormBoard")
	public String updateFormBoard(Board pboard, Model model, HttpSession session) {
		System.out.println("JJController updateFormBoard Start..."); 
		Board board = js.detailBoard(pboard.getB_number());
		
//		System.out.println("JJController updateFormBoard 1 .board--->" + board);
//		System.out.println("JJController updateFormBoard (Integer)session.getAttribute(m_number)--->" + (Integer)session.getAttribute("m_number"));
//		System.out.println("JJController updateFormBoard 2 .board--->" + board);

//		if(session.getAttribute("m_number")==null) { //로그인 x
//			System.out.println("JJController updateFormBoard 비회원..");
//			return "jm/jmLoginForm";
//		} else { //로그인  o 
//			Integer sessionMNumber = (Integer) session.getAttribute("m_number");
//			Integer boardMNumber = board.getM_number();
			
//			if(sessionMNumber != null && sessionMNumber.equals(boardMNumber)) { //글을 쓴 본인이면 수정 가능
				System.out.println("board.getB_title()--->" + board.getB_title());
				System.out.println("board.getB_regdate()--->" + board.getB_regdate());
				String b_regdate = "";
					if (board.getB_regdate() != null) {
					b_regdate = board.getB_regdate().substring(0, 10);
					board.setB_regdate(b_regdate);
					}
				System.out.println("b_regdate->"+b_regdate);
				System.out.println("JJController updateFormBoard updateFormBoard Before..");
				
				model.addAttribute("board", board);
				return "jj/updateFormBoard";
//			} else {
//				session.setAttribute("errorMessage", "본인 외에는 수정할 수 없습니다.");
//				return "forward:communityBoard";
			}
			
//		} 
//	}
	
	// 게시글 수정 적용
	@PostMapping(value = "updateBoard")
	public String updateBoard(Board board, Model model) {
		log.info("updateBoard Start...");
		System.out.println("JJController js.updateBoard board->"+board);
		int updateCount = js.updateBoard(board);
		System.out.println("JJController js.updateBoard updateCount--->" + updateCount);
		model.addAttribute("uptCnt",updateCount);
		
		return "forward:communityBoard";
	}
	
	// 글쓰기 페이지
	@RequestMapping(value = "writeFormBoard")
	public String writeFormBoard(Model model, HttpSession session) {
		if(session.getAttribute("m_number")!=null) { //로그인이 된 상태
		System.out.println("JJController writeFormBoard Start...");
		
		List<Board> boardList = js.listManager();
		System.out.println("JJController writeFormBoard boardList.size--->" + boardList.size());
		System.out.println("JJController writeFormBoard boardList--->" + boardList);
		model.addAttribute("boardList", boardList);
		
		return "jj/writeFormBoard";
		} else { //로그인이 안된상태
			return "forward:jmLoginForm";
		}
	}
	
	// 글쓰기 입력 적용
	@PostMapping(value = "writeBoard")
	public String writeBoard(Board board, HttpSession session , Model model) {
		System.out.println("JJController writeBoard Start...");
		if(session.getAttribute("m_number")!=null) { //세션에 등록되어있을때=로그인했을때
		board.setM_number((int)session.getAttribute("m_number"));
		int insertResult = js.insertBoard(board);
		System.out.println("JJController writeBoard board->"+board);
		System.out.println("JJController writeBoard insertResult->"+insertResult);
		if (insertResult > 0) return "redirect:communityBoard";
		else {
			model.addAttribute("msg", "입력 실패, 확인해 보세요");
			return "foward:writeFormBoard";
		}
		} else { //로그인이 안 됐을때 로그인화면으로 이동시킴
			return "jmLoginForm";}
	}
	
	// 게시글 삭제 적용
	@RequestMapping(value = "deleteBoard")
	public String deleteBoard(Board board) {
		System.out.println("JJController deleteBoard Start...");
		int result = js.deleteBoard(board.getB_number());
		return "forward:communityBoard";
	}
	
	// 게시글 추천
	@PostMapping(value = "recommends")
	@ResponseBody
	public ResponseEntity<?> recommend(@RequestBody Board board,  HttpSession session) {
		
		CreateRecommandResponse createRecommandResponse = new CreateRecommandResponse();
		
		System.out.println("JJController recommends board->"+board);

		if (session.getAttribute("m_number") == null) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body("로그인이 필요한 기능입니다.");
		} else {
			String result = js.recommendBoard(board.getB_number(), (int) session.getAttribute("m_number"));
			// 추천수 조회 
			int recommandCount = js.recommandCount(board.getB_number());
			
			
			createRecommandResponse.setResult(result);
			createRecommandResponse.setRecommandCount(recommandCount);
			System.out.println("JJController recommend result->"+result);
			System.out.println("JJController recommend recommandCount->"+recommandCount);
			return ResponseEntity.ok(createRecommandResponse);
		}
	}
	
	@Data
 	static class CreateRecommandResponse {
 		private String result;
 		private int    recommandCount;
 	}
	

/*	
	// 게시글 추천
	@PostMapping(value = "recommends3")
	@ResponseBody
	public ResponseEntity<?> recommend3(@RequestBody Board board,  HttpSession session) {
		
		// int b_number = Integer.parseInt(str_b_number);
		
		System.out.println("JJController recommends board->"+board);

		if (session.getAttribute("m_number") == null) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body("로그인이 필요한 기능입니다.");
		} else {
			String result = js.recommendBoard(board.getB_number(), (int) session.getAttribute("m_number"));
			// 추천수 조회 
			int recommandCount = 0;
			
			
			System.out.println("JJController recommend result->"+result);
			return ResponseEntity.ok(result);
		}
	}
*/
	
	// 게시글 신고
	@RequestMapping(value = "jjReported")
	public String jjReported(Board board) {
		System.out.println("JJController jjReported Start...");
		System.out.println("JJController jjReported board->"+board);

		int result = js.jjReported(board);
		
		return "forward:communityBoard";
	}
	
	// 게시글의 카테고리+검색어로 글을 조회
	@RequestMapping(value = "jjCategorySearch")
	public String jjThCategory(Board board, Model model) {
		System.out.println("JJController jjThCategory Start...");
		System.out.println("JJController jjThCategory board1->" + board);
		
		//total cate count
		int totalCategorySearchCnt = js.totalCategorySearchCnt(board);
		System.out.println("JJController totalCategorySearchCnt->"+totalCategorySearchCnt);
		
		//paging
		JJPaging page = new JJPaging(totalCategorySearchCnt, board.getCurrentPage());
		System.out.println("JJController totalCategorySearchCnt page->"+page);
		
		board.setStart(page.getStart());
		board.setEnd(page.getEnd());
		System.out.println("JJController JJPaging board2->" + board);
		
		List<Board> listCategorySearchBoard = js.listCategorySearchBoard(board);
		System.out.println("JJController listCateBoard listCategorySearchBoard.size()->" + listCategorySearchBoard.size());
		
		model.addAttribute("totalBoard", totalCategorySearchCnt);
		model.addAttribute("listBoard", listCategorySearchBoard);
		model.addAttribute("page", page);
		model.addAttribute("board", board);
		return "jj/communityBoard";
	}
	
//	@RequestMapping("/home")
//	public String home() {
//		return "jj/home";
//	}

	
}