package com.oracle.hellong.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
import jakarta.websocket.Session;
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
	@RequestMapping("authenticate")
	public String authenticate(HttpSession session,
								@RequestParam("member_id") String member_id,
								@RequestParam("member_pw") String member_pw,
								Model model) {
		System.out.println("SHController authenticate start...");
		boolean same = sh.authenticate(member_id, member_pw);
        if(same) {
        	session.setAttribute("m_id", member_id);
        	session.setAttribute("m_pw", member_pw);
    		System.out.println("session.setAttribute start!");
        }else {
    		System.out.println("SHController authenticate else...");
        	model.addAttribute("loginError", true);
            return "login";
		}
        
        return "forward:loginAction";
    }
	
	
	@RequestMapping("loginAction")
	public String loginAction (HttpSession session,Board board,Model model) {
		System.out.println("SHController login start...");
		String member_id = (String) session.getAttribute("m_id");
		System.out.println("SHController loginAction member_id->"+member_id);
		int sameId = sh.sameId(member_id);	
		System.out.println("SHController loginAction sameId"+sameId);
		List<Board> boardlist = null;
		if(sameId != 0) {
			String currentPage = "1";
			System.out.println("SHController Start questionsList..." );
			int toalquestions = sh.totalquestions();
			Paging   page = new Paging(toalquestions, currentPage);
			board.setStart(toalquestions);
			board.setEnd(toalquestions);
			List<Board> listBoard = sh.quelist(member_id);
			System.out.println("SHController listBoard size-->" + listBoard.size());
			model.addAttribute("toalquestions",toalquestions);
			model.addAttribute("listBoard",listBoard);
			model.addAttribute("page",page);
		}
		return "QuestionsList";	
	}
	
	@PostMapping("listque")
	public String quelist (Board board,Model model,HttpSession session) {
		System.out.println("SHController login start...");
		String member_id = (String) session.getAttribute("m_id");
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
			System.out.println("SHController listBoard size-->" + listBoard.size());
			model.addAttribute("toalquestions",toalquestions);
			model.addAttribute("listBoard",listBoard);
			model.addAttribute("page",page);
		}
		return "QuestionsList";	
	}
	
	
	
	
}
