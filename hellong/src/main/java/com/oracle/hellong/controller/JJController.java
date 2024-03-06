package com.oracle.hellong.controller;

import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import org.springframework.format.datetime.standard.DateTimeFormatterRegistrar;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.Member;
import com.oracle.hellong.service.jj.JJPaging;
import com.oracle.hellong.service.jj.JJService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class JJController {
	private final JJService js;
	
	// 게시판 메인페이지
	@RequestMapping(value = "communityBoard")
	public String communityBoard(Board board, Member member, Model model) {
		System.out.println("JJController Start communityBoard...");
		int totalBoard = js.totalBoard();
		System.out.println("JJController Start totalBoard->"+totalBoard);
		
		JJPaging page = new JJPaging(totalBoard, board.getCurrentPage());
		board.setStart(page.getStart());
		board.setEnd(page.getEnd());
		
		List<Board> listBoard = js.listBoard(board);
		System.out.println("JJController list listBoard.size()=>"+listBoard.size());
		
		model.addAttribute("totalBoard", totalBoard);
		model.addAttribute("listBoard", listBoard);
		model.addAttribute("page", page);
		
		return "jj/communityBoard";
		
	}
	
	// 게시판 > 게시글 상세페이지
	@GetMapping(value = "detailBoard")
	public String detailBoard(Board pboard, Model model) {
		System.out.println("JJController detailBoard Start...");
		Board board = js.detailBoard(pboard.getB_number());
		System.out.println("JJController detailBoard board->"+board);
		model.addAttribute("board", board);
		return "jj/detailBoard";
	}
	
	// 게시글 수정페이지
	@GetMapping(value = "updateFormBoard")
	public String updateFormBoard(Board pboard, Model model) {
		System.out.println("JJController updateFormBoard Start...");
		
		Board board = js.detailBoard(pboard.getB_number());
		System.out.println("board.getB_title()--->" + board.getB_title());
		System.out.println("board.getB_regdate()--->" + board.getB_regdate());
		
		String b_regdate = "";
		if (board.getB_regdate() != null) {
			b_regdate = board.getB_regdate().substring(0, 10);
			board.setB_regdate(b_regdate);
		}
		System.out.println("b_regdate->"+b_regdate);
		
		model.addAttribute("board", board);
		return "jj/updateFormBoard";
	}
	
	// 게시글 수정 적용
	@PostMapping(value = "updateBoard")
	public String updateBoard(Board board, Model model) {
		log.info("updateBoard Start...");
		System.out.println("JJController js.updateBoard board->"+board);
		int updateCount = js.updateBoard(board);
		System.out.println("JJController js.updateBoard updateCount--->" + updateCount);
		model.addAttribute("uptCnt",updateCount);
		
		return "redirect:jj/communityBoard";
	}
	
	// 글쓰기 페이지
	@RequestMapping(value = "writeFormBoard")
	public String writeFormBoard(Model model) {
		System.out.println("JJController writeFormBoard Start...");
		
		List<Board> boardList = js.listManager();
		System.out.println("JJController writeFormBoard boardList.size--->" + boardList.size());
		model.addAttribute("boardList", boardList);
		
		return "jj/writeFormBoard";
	}
	
	// 글쓰기 입력 적용
	@PostMapping(value = "writeBoard")
	public String writeBoard(Board board, Model model) {
		System.out.println("JJController writeBoard Start...");
		
		int insertResult = js.insertBoard(board);
		if (insertResult > 0) return "redirect:communityBoard";
		else {
			model.addAttribute("msg", "입력 실패, 확인해 보세요");
			return "foward:jj/writeFormBoard";
		}	
	}
	
	// 게시글 삭제 적용
	@RequestMapping(value = "deleteBoard")
	public String deleteBoard(Board board, Model model) {
		System.out.println("JJController deleteBoard Start...");
		int result = js.deleteBoard(board.getB_number());
		return "redirect:jj/communityBoard";
	}
	
	// 게시글 추천수 카운트
	@RequestMapping(value = "hitCnt")
	public String HitCnt(Board board, Model model) {
		System.out.println("JJController HitCnt Start...");
		int result = js.HitCnt(board.getB_number());
		return "redirect:jj/communityBoard";
	}
	
	// 게시판 내 검색
	@RequestMapping(value = "jjBoardSearch")
	public String jjBoardSearch(Board board, Model model) {
		System.out.println("JJController jjBoardSearch Start...");
		List<Board> listSearchBoard = js.listSearchBoard(board);
		System.out.println("JJController jjBoardSearch listSearchBoard.size()->" + listSearchBoard.size());
		
		model.addAttribute("listSearchBoard", listSearchBoard);
		return "jj/communityBoard";
	}

}
