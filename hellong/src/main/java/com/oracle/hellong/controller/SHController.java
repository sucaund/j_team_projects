package com.oracle.hellong.controller;

import static org.hamcrest.CoreMatchers.nullValue;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.GS;
import com.oracle.hellong.model.Gym;
import com.oracle.hellong.model.GymBoardFile;
import com.oracle.hellong.model.Member;
import com.oracle.hellong.model.Report;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
@RequiredArgsConstructor
@Slf4j
public class SHController {
	private final SHService sh;

	@RequestMapping("/login")
	public String login() {
		System.out.println("SHController login start...");
		return "redirect:/authenticate";

	}

	

	// 해당로그인 한계정이 있는지 확인...
	@RequestMapping("authenticate")
	public String authenticate(HttpSession session,Model model) {
		System.out.println("SHController authenticate start...");
		String member_id =  (String) session.getAttribute("m_id");
		boolean same = sh.authenticate(member_id);
		// 해당 로그인 정보가 맞는지 참or거짓 으로 분류
		if (same) {
			session.setAttribute("m_id", member_id);// 참일시 해당 로그인 정보를 세션에 저장...
			System.out.println("session.setAttribute start!");
		} else {
			System.out.println("SHController authenticate else...");
			model.addAttribute("loginError", true); // 거짓일시 로그인페이지로 재이동
			return "jm/jmLoginForm";
		}

		return "forward:loginAction1";
	}

	@RequestMapping("loginAction1")
	public String loginAction1(HttpSession session, Board board, Model model) {
		System.out.println("SHController loginAction1 start...");
		String member_id = (String) session.getAttribute("m_id");// 로그인 세션에서 아이디를 가져옴
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

		return "SH-Views/questionsList";
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
		return "SH-Views/questionsList";
	}

	// 작성글 열람
	@RequestMapping("/QuestionContent")
	public String QuestionContent(HttpSession session,@RequestParam("B_NUMBER") int B_NUMBER,Member member ,Model model) {
		System.out.println("SHController QuestionContent start...");
		System.out.println("SHController QuestionContent B_NUMBER" + B_NUMBER);
		Board boardContent = sh.boardContent(B_NUMBER);
		
		String m_id = (String) session.getAttribute("m_id");//03-13
		int M_NUMBER = sh.changeM_num(m_id);//03-13

	    System.out.println("SHController QuestionContent  boardContent->"+boardContent);
		//댓글 작성자 정보 입력 03-13
	    //member.setM_number(M_NUMBER);
	    //작성글안에 속해있는 댓글들 보냄
		List<Board> boardCommList = sh.getComments(B_NUMBER);
		System.out.println("SHController  boardCommList size-->" + boardCommList.size());
	
	
		// 리스트에서 첫 번째 Board 객체를 모델에 추가
		model.addAttribute("board", boardContent);
		model.addAttribute("boardCommList", boardCommList);
		model.addAttribute("M_NUMBER", M_NUMBER);
		System.out.println("SHController QuestionContent boardContent ->" + boardContent);
		return "SH-Views/QuestionContent";
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

		return "SH-Views/questionsList";

	}

//글작성뷰
	@RequestMapping("write_view")
	public String writeView(@RequestParam("M_NUMBER") int M_NUMBER, Board board, Model model) {
		System.out.println("SHController write_view start...");
		board.setM_number(M_NUMBER);
		model.addAttribute("board", board);
		return "SH-Views/write_view";
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
		int Common_bcd = 200;
		int Common_mcd = 120;
		int B_ISRECOMM =1;

		board.setM_number(M_NUMBER);
		board.setCommon_bcd(Common_bcd);
		board.setCommon_mcd(Common_mcd);
		board.setB_title(bTitle);
		board.setB_content(bContent);
		//board.setB_isrecomm(B_ISRECOMM);
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
	public Board commentInsert(@RequestParam("comment_body") String comment, @RequestParam("cmId") int M_NUMBER,
			@RequestParam("bId") int B_NUMBER, Board board) {

		System.out.println("SHController commentInsert M_NUMBER" + " => " + M_NUMBER);
		System.out.println("SHController commentInsert B_NUMBER" + " => " + B_NUMBER);
		int Common_bcd = 200;
		int Common_mcd = 121;

		board.setB_comm_group(B_NUMBER);
		board.setM_number(M_NUMBER);
		board.setCommon_bcd(Common_bcd);
		board.setCommon_mcd(Common_mcd);
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
	
	//SHController.java 자유댓글 삭제 03-19
	@RequestMapping("/PdeleteComment")
	public String PdeleteComment(@RequestParam("Comm_number") int Comm_number,
			@RequestParam("bId")int bId	) {
		System.out.println("SHController deleteComment start...");
		sh.deleteComment(Comm_number);
		System.out.println("SHController deleteComment succes...");
	
		return "redirect:/detailBoard?b_number="+bId;
	}


//글수정 뷰이동
@RequestMapping("/modify")
public String modify(@RequestParam("bId")int B_NUMBER,Board board,Model model) {
	System.out.println("SHController modify start...");
	System.out.println("SHController modify B_NUMBER->"+B_NUMBER);
	Board boardContent = sh.boardContent(B_NUMBER);
	model.addAttribute("board",boardContent);
    return "SH-Views/modifyView";
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
		int Common_bcd = 200;
		int Common_mcd = 120;


		board.setB_number(B_NUMBER);
		board.setCommon_bcd(Common_bcd);
		board.setCommon_mcd(Common_mcd);
		board.setB_title(bTitle);
		board.setB_content(bContent);
		System.out.println("SHController write board" + board);

		sh.updateAttribute(board);

		return "redirect:/QuestionContent?B_NUMBER="+B_NUMBER;
	}

//=================================================관리자 폼===========================================
	
	
	
//메인 인덱스에서 관리자 창으로 넘어가기
	@RequestMapping("/manager")
	public String manger(Model model) {
		System.out.println("SHController manger start...");
		List<Member> allMember =sh.getAllMember();//모든멤버
		List<Gym> allGym =sh.getAllGym();//모든 헬스장
		List<Report> allReport = sh.getAllReport();//신고글
		System.out.println("SHController manger allReport"+"  "+allReport);
		System.out.println("SHController manger getAllGym"+" "+allGym);

		List<Board> allQnA = sh.getallQnA();//문의글
		System.out.println("SHController manger allQnA"+"  "+allQnA);

		Map<Integer, Integer> commentCounts = sh.getCommentCountsForPosts(allQnA);

		model.addAttribute("allMember", allMember);
		model.addAttribute("allGym", allGym);
		model.addAttribute("allReport", allReport);
		model.addAttribute("allQnA", allQnA);
		model.addAttribute("commentCounts", commentCounts);
		return "SH-Views/manger";
	}
//문의글 에 필요한 객체들을 저장해놓은  private 메소드
	
	
//모달에 회원정보저장
	@ResponseBody
	@RequestMapping("getMemberDetails")
	public Member requestMethodName(@RequestParam("id") int id) {
		System.out.println("SHController requestMethodName start...");
		System.out.println("SHController requestMethodName id"+id);

		Member member = sh.getMember(id);//멤버 객체의 모든 정보를 담아놓는다
		
		
		return member;
	}
//모달에서 회원 삭제
	
	@RequestMapping("deleteMember")
	public String deleteMember(@RequestParam("m_number") int m_number) {
		System.out.println("SHController deleteMember start...");
		System.out.println("SHController deleteMember m_number"+m_number);
		sh.deleteMember(m_number);
		return "SH-Views/manger";
	}
//회원 등급변경
	@ResponseBody
	@PostMapping("updateMemberAdmin")
	public void updateMemberAdmin(@RequestParam("m_number") int m_number, @RequestParam("admin")int admin) {
		System.out.println("SHController updateMemberAdmin start...");
		System.out.println("SHController updateMemberAdmin m_number"+m_number);
		System.out.println("SHController updateMemberAdmin admin"+admin);
		
		sh.updateMember(m_number,admin);//멤버 객체의 모든 정보를 담아놓는다
	}
//헬스장 오픈 변경
	@ResponseBody
	@PostMapping("updateOpenGym")
	public void updateOpenGym(@RequestParam("g_id") int g_id, @RequestParam("common_mcd")int common_mcd) {
		System.out.println("SHController updateMemberAdmin start...");
		System.out.println("SHController updateOpenGym m_number"+g_id);
		System.out.println("SHController updateOpenGym common_mcd"+common_mcd);
		
		sh.updateOpenGym(g_id,common_mcd);//멤버 객체의 모든 정보를 담아놓는다
	}
	
//모달에서 헬스장 삭제
	@RequestMapping("deleteGym")
	public String deleteGym(@RequestParam("g_id") int g_id) {
		System.out.println("SHController deleteGym start...");
		System.out.println("SHController deleteGym g_id"+g_id);
		sh.deleteGym(g_id);
		return "SH-Views/manger";
	}
	
	
	
//모달에서 헬스장 페이지 등록

	
	@ResponseBody
	@PostMapping("/registerGym")
	public String registerGym3(
			@RequestParam("m_number") int m_number,
			@RequestParam("g_name") String g_name,
			@RequestParam("g_address") String g_address,
			@RequestParam("g_tel") String g_tel,
	        @RequestParam("g_companynumber") int g_companynumber,
	        @RequestParam("image") MultipartFile imageFile,
	        Gym gym){
		System.out.println("SHController registerGym start...");

		gym.setM_number(m_number);
		gym.setG_name(g_name);
		gym.setG_address(g_address);
		gym.setG_tel(g_tel);
		gym.setG_companynumber(g_companynumber);
		//파일저장및 경로추출
		String g_document = sh.storeFile(imageFile);
		gym.setG_document(g_document);
		System.out.println("SHController registerGym gym"+"   "+gym);

		
		sh.registerGym(gym);
			return "1";
		
		
	}
//헬스장 페이지 정보
	
	
	@ResponseBody
	@RequestMapping("getGymDetails")
	public Gym getGymDetails(@RequestParam("id") int g_id) {
		System.out.println("SHController getGymDetails start...");
		System.out.println("SHController getGymDetails id"+"   "+g_id);

		Gym gym= sh.getGym(g_id);//멤버 객체의 모든 정보를 담아놓는다
		
		
		return gym;
	}
//신고글 삭제	
	@RequestMapping("/delReport")
	public String delReport(@RequestParam("b_number") int b_number) {
		System.out.println("SHController delReport start...");
		
		sh.delReport(b_number);
		System.out.println("SHController delReport END...");

		
		return "redirect:manager";
	}
	
	
	//문의글 목록에서 삭제
	
	@RequestMapping("/delThisTable")
	public String delThisTable(@RequestParam("b_number") int b_number) {
		System.out.println("SHController delReport start...");
		
		sh.delThisTable(b_number);
		System.out.println("SHController delReport END...");
		
		
		return "redirect:manager";
	}
	
	//===============================맵 검색=================================
	
	
	
	@RequestMapping("/gymMap")
	public String gymMap() {
		System.out.println("SHController gymMap start...");
		return "SH-Views/gymMap";

	}
	@ResponseBody
	@RequestMapping("/gymMapDetail")
	public Gym gymMapDetail(@RequestParam("g_id") int gId) {
		Gym gymMapDetail =sh.gymMapDetail(gId);
		System.out.println("SHController gymMapDetail start...");
		System.out.println("SHController gymMapDetail gymMapDetail->"+""+ gymMapDetail.getG_address());
		
		return gymMapDetail;
	}
	
	@ResponseBody
	@GetMapping("/gyms")
	public List<Map<String, Object>> getAllGyms() {
	    List<Gym> gyms = sh.getAllGym(); // 모든 체육관 정보를 가져옴
	    List<GymBoardFile> boardFiles = sh.getAllBoardFiles(); // 모든 체육관 게시판 파일 정보를 가져옴

	    List<Map<String, Object>> resultList = new ArrayList<>();

	    for (Gym gym : gyms) {
	        Map<String, Object> gymInfo = new HashMap<>();
	        gymInfo.put("gym", gym);

	        // 헬스장에 해당하는 BoardFiles만 필터링하는 로직
	        // Gym 모델의 g_id 필드에 접근하기 위해 getG_id() 메서드 사용
	        List<GymBoardFile> filteredBoardFiles = boardFiles.stream()
	                .filter(file -> file.getG_id() == gym.getG_id()) // 필터링 조건 수정
	                .collect(Collectors.toList());

	        gymInfo.put("boardFiles", filteredBoardFiles); // 필터링된 파일 정보를 맵에 추가
	        resultList.add(gymInfo); // 결과 리스트에 추가
	    }
	    System.out.println("SHController getAllGyms resultList-->"+resultList);
	    System.out.println("SHController getAllGyms boardFiles-->"+boardFiles);

	    return resultList; // 결과 반환
	}
	/*
	 * @ResponseBody
	 * 
	 * @GetMapping("/gyms") public List<Gym> getAllGyms() { List<Gym> gyms =
	 * sh.getAllGym(); System.out.println(gyms); return gyms; }
	 */
//===========================메인페이지=============================	

	//index에서 클릭시 메인이동
	 @GetMapping("/")
	    public String index() {
	        return "redirect:Default"; // JSP 파일 이름 (확장자 제외)
	    }
	
	//페이지에 필요정보를 전달한다.
	@RequestMapping("/Default")
	public String Default(Model model) {
		System.out.println("SHController Default start...");
		
		Gym newGym = sh.getNewGym();//신규헬스장 id
		int g_id1 = newGym.getG_id();
		GS newGymPrice = sh.getGymPrice(g_id1);//신규헬스장가격
		System.out.println("SHController Default newGymPrice"+newGymPrice);
		GymBoardFile newGymPhoto = sh.getGymPhoto(g_id1);//신규헬스장 대표사진


		Gym cheapGym = sh.getCheapGym();//최저가헬스장 id
		int g_id2 = cheapGym.getG_id();
		GS cheapGymPrice = sh.getGymPrice(g_id2);//최저가헬스장가격
		GymBoardFile cheapGymPhoto = sh.getGymPhoto(g_id2);//최저가헬스장사진
		
		Gym manyGym = sh.getManyGym();//최대인원 id
		int g_id3 = manyGym.getG_id();
		GS manyGymPrice = sh.getGymPrice(g_id3);//최대인원가격
		GymBoardFile manyGymPhoto = sh.getGymPhoto(g_id3);//최대인원사진
		
		Gym starGym = sh.getStarGym();//높은별점 id
		int g_id4 = starGym.getG_id();
		GS starGymPrice = sh.getGymPrice(g_id4);//높은별점가격
		GymBoardFile starGymPhoto = sh.getGymPhoto(g_id4);//높은별점사진
		
		
		Board Notice =sh.getNotice();//최신공지사항
		Board Popular =sh.getPopular();//인기자유글
		Board bodyProfile =sh.getbodyProfil();//인기바디프로필
		
		//model 보내기
		model.addAttribute("newGym", newGym);
		model.addAttribute("newGymPrice", newGymPrice);
		model.addAttribute("newGymPhoto", newGymPhoto);

		model.addAttribute("cheapGym", cheapGym);
		model.addAttribute("cheapGymPrice", cheapGymPrice);
		model.addAttribute("cheapGymPhoto", cheapGymPhoto);
		
		model.addAttribute("manyGym", manyGym);
		model.addAttribute("manyGymPrice", manyGymPrice);
		model.addAttribute("manyGymPhoto", manyGymPhoto);
		
		model.addAttribute("starGym", starGym);
		model.addAttribute("starGymPrice", starGymPrice);
		model.addAttribute("starGymPhoto", starGymPhoto);

		model.addAttribute("Notice", Notice);
		model.addAttribute("Popular", Popular);
		model.addAttribute("bodyProfile", bodyProfile);

		return "SH-Views/Default";
	}

	
	
	
	

	
}