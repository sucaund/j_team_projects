package com.oracle.hellong.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.naming.directory.SearchResult;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.BoardFile;
import com.oracle.hellong.model.Common;
import com.oracle.hellong.model.Gym;
import com.oracle.hellong.model.GymBoard;
import com.oracle.hellong.model.GymReview;
import com.oracle.hellong.model.Member;
import com.oracle.hellong.model.RecommCheck;
import com.oracle.hellong.model.Report;
import com.oracle.hellong.model.SearchResults;
import com.oracle.hellong.service.dy.DYPaging;
import com.oracle.hellong.service.dy.DYService;
import com.oracle.hellong.service.hs.HSService;
import com.oracle.hellong.service.sh.SHService;

import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class DYController {
	private final DYService dys;
	private final SHService sh;

	// 게시글리스트
	@GetMapping(value = "listBodyProfile")
	public String bodyProfileList(Board board, Member member, BoardFile boardFile, Model model) {
		System.out.println("DYController Start listBoard...");
		int totalBodyProfile = dys.totalBodyProfile();
		System.out.println("DYController Start totalBodyProfile->" + totalBodyProfile);

		DYPaging page = new DYPaging(totalBodyProfile, board.getCurrentPage());
		board.setStart(page.getStart());
		board.setEnd(page.getEnd());

		List<Board> listBodyProfile = dys.listBodyProfile(board);
		List<BoardFile> listFileBodyProfile = dys.listFileBodyProfile(boardFile);
		System.out.println("ListBodyProfile size: " + listBodyProfile.size());
		for (Board boardItem : listBodyProfile) {
			System.out.println("Board B_number: " + boardItem.getB_number());
		}
		System.out.println("ListFileBodyProfile size: " + listFileBodyProfile.size());
		for (BoardFile file : listFileBodyProfile) {
			System.out.println("File B_number: " + file.getB_number());
		}

		Map<Integer, String> firstImageMap = new HashMap<>();
		for (Board boardItem : listBodyProfile) {
			BoardFile queryParam = new BoardFile();
			queryParam.setB_number(boardItem.getB_number());
			List<BoardFile> files = dys.listFileBodyProfile(queryParam);
			if (!files.isEmpty()) {
				firstImageMap.put(boardItem.getB_number(), files.get(0).getBf_savedName());
			}
		}

		model.addAttribute("totalBodyProfile", totalBodyProfile);
		model.addAttribute("listBodyProfile", listBodyProfile);
		model.addAttribute("listFileBodyProfile", listFileBodyProfile);
		model.addAttribute("firstImageMap", firstImageMap);
		model.addAttribute("page", page);
		model.addAttribute("member", member);

		return "dy/dyBodyProfile";
	}

	// 클릭한 게시글 조회
	@GetMapping(value = "dySelectBodyProfile")
	public String dySelectBodyProfile(Board board1, BoardFile boardFile1, Common common, Model model, Member member,
			HttpSession session) {
		System.out.println("DYController dySelectBodyProfile Start...");
		// 조회수 증가
		int b_number = board1.getB_number();
		dys.increaseReadCount(b_number);

		String m_id = (String) session.getAttribute("m_id"); // 댓글
		System.out.println("DYController detailBoard m_id->" + " " + m_id);
		// 댓글
		int M_NUMBER = sh.changeM_num(m_id); // 댓글

		// 게시글 및 파일 조회
		Board board = dys.selectBodyProfile(board1.getB_number());
		List<BoardFile> boardFile = dys.selectBodyProfileFileList(boardFile1.getB_number());
		List<Common> commonList = dys.commonList(common);
		List<Board> boardCommList = dys.getPComments(b_number); // 댓글
		System.out.println("DYController detailBoard boardCommList->" + boardCommList); // 댓글

		System.out.println("*********** " + commonList);

		model.addAttribute("board", board);
		model.addAttribute("boardFile", boardFile);
		model.addAttribute("reportTypes", commonList);
		model.addAttribute("boardCommList", boardCommList); // 댓글
		model.addAttribute("M_NUMBER", M_NUMBER); // 댓글

		return "dy/dySelectBodyProfile";
	}

	// 댓글입력 , 댓글 카운터 증가
	@ResponseBody
	@PostMapping("commentInsert2")
	public Board commentInsert2(@RequestParam("comment_body") String comment, @RequestParam("cmId") int M_NUMBER,
			@RequestParam("bId") int B_NUMBER, Board board) {

		System.out.println("SHController commentInsert M_NUMBER" + " => " + M_NUMBER);
		System.out.println("SHController commentInsert B_NUMBER" + " => " + B_NUMBER);
		int Common_bcd = 200;
		int Common_mcd = 111;

		board.setB_comm_group(B_NUMBER);
		board.setM_number(M_NUMBER);
		board.setCommon_bcd(Common_bcd);
		board.setCommon_mcd(Common_mcd);
		board.setB_content(comment);

		sh.addComment(board);
		System.out.println(" 1  SHController addComment board()->" + board);

		Board board2 = dys.callComment(board);

		System.out.println("2   SHController callComment board()->" + board2);
		return board2;
	}

	// 댓글 삭제
	@RequestMapping("deleteComment2")
	public String deleteComment(@RequestParam("Comm_number") int Comm_number, @RequestParam("bId") int bId) {
		System.out.println("SHController deleteComment start...");
		sh.deleteComment(Comm_number);
		System.out.println("SHController deleteComment succes...");

		return "redirect:dySelectBodyProfile?b_number=" + bId;
	}

	// 게시글 추천
	@PostMapping("/recommend")
	@ResponseBody
	public ResponseEntity<?> recommend(@RequestParam("b_number") int b_number, HttpSession session) {

		if (session.getAttribute("m_number") == null) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body("로그인이 필요한 기능입니다.");
		} else {
			String result = dys.recommendBoard(b_number, (int) session.getAttribute("m_number"));
			return ResponseEntity.ok(result);
		}
	}

	// 게시글 신고
	@RequestMapping(value = "dyReported")
	public String dyReported(Board board) {
		System.out.println("dyController dyReported Start...");
		System.out.println("dyController dyReported board->" + board);

		int result = dys.dyReported(board);

		// 신고 처리 후, 조회 페이지로 리디렉션
		return "redirect:listBodyProfile";
	}

	// 게시글 업데이트 폼
	@GetMapping(value = "dyUpdateFormBodyProfile")
	public String dyUpdateFormBodyProfile(Board board1, Model model, HttpSession session) {
		if (session.getAttribute("m_number") != null) { // 로그인 되어있음
			Board board = dys.selectBodyProfile(board1.getB_number());

			if ((int) session.getAttribute("m_number") == board.getM_number()) { // 로그인했는데 당사자가 맞을때
				// 로직 처리
				return "dy/dyUpdateFormBodyProfile";
			} else { // 로그인했으나 당사자가 아닐 때
				return "dy/listBodyProfile";
			}

		} else { // 로그인 안됨
			return "forward:jmLoginForm";
		}
	}

	// 게시글 업데이트
	@PostMapping(value = "dyUpdateBodyProfile")
	public String dyUpdateBodyProfile(Board board, @RequestParam("files") MultipartFile[] newFiles, Model model) {
		log.info("dyUpdateBodyProfile Start...");

		// 1. 기존 파일 정보 조회
		List<BoardFile> existingFiles = dys.selectBodyProfileFileList(board.getB_number());

		// 2. 기존 파일 시스템에서 파일 삭제 및 데이터베이스에서 파일 정보 삭제
		for (BoardFile file : existingFiles) {
			File f = new File(file.getImagePath());
			if (f.exists()) {
				f.delete(); // 파일 시스템에서 파일 삭제
			}
			dys.deleteFileById(file.getBf_id()); // 데이터베이스에서 파일 정보 삭제
		}

		// 3. 새 파일 업로드 및 데이터베이스에 파일 정보 저장
		for (MultipartFile file : newFiles) {
			if (!file.isEmpty()) {
				String fileName = file.getOriginalFilename();
				UUID uid = UUID.randomUUID();
				String storedFileName = uid + "-" + fileName;

				BoardFile newBoardFile = new BoardFile();
				newBoardFile.setB_number(board.getB_number());
				newBoardFile.setBf_originalName(fileName);
				newBoardFile.setBf_savedName(storedFileName);

				// 파일 시스템에 저장
				try {
					String folderName = "C:/backup/";
					String savePath = folderName + storedFileName;
					file.transferTo(new File(savePath));
				} catch (IOException e) {
					e.printStackTrace();
				}

				// 데이터베이스에 파일 정보 저장
				dys.insertFileBodyProfile(newBoardFile);
			}
		}

		// 4. 게시글 정보 업데이트 (필요한 경우)
		dys.dyUpdateBodyProfile(board);

		return "redirect:/listBodyProfile";
	}

	// 게시글쓰기 폼
	@RequestMapping(value = "dyWriteFormBodyProfile")
	public String dyWriteFormBodyProfile(HttpSession session, Model model) {
		System.out.println("DYController dyWriteFormBodyProfile Start..");
		if (session.getAttribute("m_number") != null) { // 세션에 등록되어있을때=로그인했을때
			List<Board> boardList = dys.listManager();
			System.out.println("DYController WriteForm boardList.size -> " + boardList.size());
			model.addAttribute("boardMngList", boardList);

			return "dy/dyWriteFormBodyProfile";
		} else {
			return "forward:jmLoginForm";
		}
	}

	// 게시글쓰기
	@PostMapping(value = "dyWriteBodyProfile")
	public String dyWriteBodyProfile(Board board, BoardFile boardFile, HttpSession session) throws IOException {
		board.setM_number((int) session.getAttribute("m_number"));
		System.out.println("dyWriteBodyProfile*************************" + board);
		int insertResult = dys.insertBodyProfile(board);

		// service insert메서드
		System.out.println("dyWriteBodyProfile*************************" + board.getB_images());

		for (MultipartFile b_images : board.getB_images()) {
			String fileName = b_images.getOriginalFilename();
			UUID uid = UUID.randomUUID();
			String storedFileName = uid + "-" + fileName;

			boardFile.setB_number(board.getB_number());
			boardFile.setBf_originalName(fileName);
			boardFile.setBf_savedName(storedFileName);

			String folderName = "C:/backup/";
			File backupFolderName = new File(folderName);
			if (!backupFolderName.exists()) {
				try {
					Files.createDirectories(Paths.get(folderName));
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("Error message: " + e.getMessage());
					return "forward:/dy/dyWriteFormBodyProfile";
				}
			}

			String savePath = folderName + storedFileName;
			b_images.transferTo(new File(savePath));
			int insertFileResult = dys.insertFileBodyProfile(boardFile);
		}
		// boardFile 서비스 메서드

		System.out.println("DYController insertResult -> " + insertResult);
		if (insertResult > 0)
			return "redirect:/listBodyProfile";
		else {
			return "forward:/dy/dyWriteFormBodyProfile";
		}
	}

	// 게시글 삭제
	@RequestMapping(value = "dyDeleteBodyProfile")
	public String dyDeleteBodyProfile(Board board, Model model,Report report,RecommCheck recommCheck, HttpSession session) {
		System.out.println("DYController delete Start...");
		List<BoardFile> files = dys.selectBodyProfileFileList(board.getB_number());
		for (BoardFile file : files) {
			File f = new File(file.getImagePath());
			if (f.exists()) {
				f.delete();
			}
			dys.deleteFileById(file.getBf_id());
		}
		int result1 = dys.deleteReported(report.getB_number());
		int result2 = dys.deleteRecomm(recommCheck.getB_number());
		int result3 = dys.deleteBodyProfile(board.getB_number());
		return "redirect:/listBodyProfile";
	}

	// 게시판 내 검색
	@RequestMapping(value = "dyBoardSearch")
	public String dyBoardSearch(Board board, BoardFile boardFile, Model model) {
		System.out.println("DYController BoardSearch Start...");
		int totalBodyProfile = dys.condTotalBodyProfile(board);
		DYPaging page = new DYPaging(totalBodyProfile, board.getCurrentPage());
		board.setStart(page.getStart());
		board.setEnd(page.getEnd());

		List<Board> listSearchBoard = dys.listSearchBoard(board);
		Map<Integer, String> firstImageMap = new HashMap<>();

		for (Board b : listSearchBoard) {
			List<BoardFile> files = dys.listSearchBoardFileByBoardId(b.getB_number()); // 이 메서드는 각 게시글 ID에 해당하는 첫 번째 파일
																						// 정보만 조회해야 함
			if (!files.isEmpty()) {
				firstImageMap.put(b.getB_number(), files.get(0).getBf_savedName()); // 예시에서는 파일 경로를 저장
			}
		}

		model.addAttribute("totalBodyProfile", totalBodyProfile);
		model.addAttribute("listBodyProfile", listSearchBoard);
		model.addAttribute("firstImageMap", firstImageMap);
		model.addAttribute("page", page);

		return "dy/dyBodyProfile";
	}

	// 헤더 통합검색
	@GetMapping(value = "dyTotalSearch")
	public String dyTotalSearch(Board board, Gym gym, GymBoard gymBoard, GymReview gymReview, Model model) {
		System.out.println("DYController dyTotalSearch Start..");
		SearchResults results = dys.totalSearch(board, gym, gymBoard, gymReview);
		model.addAttribute("results", results);

		return "dy/dyTotalSearchResult";
	}

	// 회원 작성글 보기
	@GetMapping(value = "dyMyPagelist")
	public String dyMyPagelist(HttpSession session, Model model) {
		System.out.println("DYController dyMyPagelist Start...");

		Integer mNumber = (Integer) session.getAttribute("m_number");

		if (mNumber != null) {
			// mNumber를 사용해 Board 객체 생성 및 설정
			Board board = new Board();
			board.setM_number(mNumber);

			List<Board> myPageBoardList = dys.myPageBoardList(board);
			model.addAttribute("myPageBoardList", myPageBoardList);

			return "dy/dyMyPageList";
		} else {
			// m_number가 세션에 없다면 로그인 페이지로 리다이렉트
			return "redirect:/jmLoginForm"; // 또는 필요에 따라 적절한 경로 설정
		}
	}
}