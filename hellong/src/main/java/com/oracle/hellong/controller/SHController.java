package com.oracle.hellong.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.Member;
import com.oracle.hellong.service.sh.Paging;
import com.oracle.hellong.service.sh.SHService;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


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
	
	@PostMapping("loginAction")
	public String loginAction (Board board,Model model,@RequestParam("member_id") String member_id) {
		System.out.println("SHController login start...");
		int sameId = sh.sameId(member_id);		
		List<Board> boardlist = null;
		if(sameId != 0) {
			String currentPage = "1";
			System.out.println("SHController Start questionsList..." );
			int toalquestions = sh.totalquestions();
			Paging   page = new Paging(toalquestions, currentPage);
			board.setStart(toalquestions);
			board.setEnd(toalquestions);
			List<Board> listBoard = sh.quelist(member_id);
			model.addAttribute("toalquestions",toalquestions);
			model.addAttribute("listBoard",listBoard);
			model.addAttribute("page",page);
		}
		return "QuestionsList";	
	}
	
	
	/*
	 * @RequestMapping("questionsList") public String QuestionsList(Board
	 * board,Model model) {
	 * 
	 * String currentPage = "1";
	 * System.out.println("SHController Start questionsList..." ); int toalquestions
	 * = sh.totalquestions(); Paging page = new Paging(toalquestions, currentPage);
	 * board.setStart(toalquestions); board.setEnd(toalquestions); List<Board>
	 * listBoard = sh.listBoard(board);
	 * model.addAttribute("toalquestions",toalquestions);
	 * model.addAttribute("listBoard",listBoard); model.addAttribute("page",page);
	 * 
	 * return "QuestionsList"; }
	 */
	
}
