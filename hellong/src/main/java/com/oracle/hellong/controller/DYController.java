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

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.BoardFile;
import com.oracle.hellong.model.Gym;
import com.oracle.hellong.model.GymBoard;
import com.oracle.hellong.model.GymReview;
import com.oracle.hellong.model.Member;
import com.oracle.hellong.model.SearchResults;
import com.oracle.hellong.service.dy.DYPaging;
import com.oracle.hellong.service.dy.DYService;
import com.oracle.hellong.service.hs.HSService;

import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class DYController {
	private final DYService dys;

	@GetMapping(value = "listBodyProfile")
	public String bodyProfileList(Board board, BoardFile boardFile, Model model) {
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
		System.out.println("미안해 얘들아!!!!!");

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

		return "dy/dyBodyProfile";
	}

	// 클릭한 게시글 조회
	@GetMapping(value = "dySelectBodyProfile")
	public String dySelectBodyProfile(Board board1, BoardFile boardFile1, Model model) {
		System.out.println("DYController dySelectBodyProfile Start...");
		Board board = dys.selectBodyProfile(board1.getB_number());
		List<BoardFile> boardFile = dys.selectBodyProfileFileList(boardFile1.getB_number());
		model.addAttribute("board", board);
		model.addAttribute("boardFile", boardFile);

		return "dy/dySelectBodyProfile";
	}

	// 게시글 수정하기 폼
	@GetMapping(value = "dyUpdateFormBodyProfile")
	public String dyUpdateFormBodyProfile(Board board1, Model model) {
		System.out.println("updateFormBodyProfile Start...");

		Board board = dys.selectBodyProfile(board1.getB_number());
		System.out.println("board.getB_number -> " + board.getB_number());
		List<BoardFile> boardFiles = dys.selectBodyProfileFileList(board1.getB_number());

		String regDate = "";
		if (board.getB_regdate() != null) {
			regDate = board.getB_regdate().substring(0, 10);
			board.setB_regdate(regDate);
		}
		System.out.println("regDate -> " + regDate);
		model.addAttribute("board", board);
		model.addAttribute("boardFile", boardFiles);
		return "dy/dyUpdateFormBodyProfile";

	}

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
	public String dyWriteFormBodyProfile(Model model) {
		System.out.println("DYController dyWriteFormBodyProfile Start..");
		List<Board> boardList = dys.listManager();
		System.out.println("DYController WriteForm boardList.size -> " + boardList.size());
		model.addAttribute("boardMngList", boardList);

		return "dy/dyWriteFormBodyProfile";
	}

	// 게시글쓰기
	@PostMapping(value = "dyWriteBodyProfile")
	public String dyWriteBodyProfile(Board board, BoardFile boardFile) throws IOException {

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
	public String dyDeleteBodyProfile(Board board, Model model) {
		System.out.println("DYController delete Start...");
		List<BoardFile> files = dys.selectBodyProfileFileList(board.getB_number());
		for (BoardFile file : files) {
			File f = new File(file.getImagePath());
			if (f.exists()) {
				f.delete();
			}
			dys.deleteFileById(file.getBf_id());
		}
		int result = dys.deleteBodyProfile(board.getB_number());
		return "redirect:/listBodyProfile";
	}

	// 게시판 내 검색
	@RequestMapping(value = "dyBoardSearch")
	public String dyBoardSearch(Board board, Model model) {
		System.out.println("DYController BoardSearch Start...");
		System.out.println("DYController BoardSearch board1->" + board);

		int totalBodyProfile = dys.condTotalBodyProfile(board);
		System.out.println("DYController BoardSearch Start...");
		// paging
		DYPaging page = new DYPaging(totalBodyProfile, board.getCurrentPage());
		board.setStart(page.getStart());
		board.setEnd(page.getEnd());

		System.out.println("DYController BoardSearch board2->" + board);

		List<Board> listSearchBoard = dys.listSearchBoard(board);
		System.out.println("DYController BoardSearch listSearchBoard.size() -> " + listSearchBoard.size());

		model.addAttribute("totalBodyProfile", totalBodyProfile);
		model.addAttribute("listBodyProfile", listSearchBoard);
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

}