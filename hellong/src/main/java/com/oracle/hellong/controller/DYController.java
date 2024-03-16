package com.oracle.hellong.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.service.dy.DYPaging;
import com.oracle.hellong.service.dy.DYService;
import com.oracle.hellong.service.hs.HSService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class DYController {
	private final DYService dys;

	// 바디프로필 게시글 목록 조회창
	@GetMapping(value = "listBodyProfile")
	public String bodyProfileList(Board board, Model model) {
		System.out.println("DYController Start listBoard...");
		// if (emp.getCurrentPage() == null ) emp.setCurrentPage("1");
		// Emp 전체 Count 15
		int totalBodyProfile = dys.totalBodyProfile();
		System.out.println("DYController Start totalBodyProfile->" + totalBodyProfile);

		// Paging 작업
		DYPaging page = new DYPaging(totalBodyProfile, board.getCurrentPage());
		// Parameter emp --> Page만 추가 Setting
		board.setStart(page.getStart()); // 시작시 1
		board.setEnd(page.getEnd()); // 시작시 10

		List<Board> listBodyProfile = dys.listBodyProfile(board);
		System.out.println("DYController list listBodyProfile.size()=>" + listBodyProfile.size());

		model.addAttribute("totalBodyProfile", totalBodyProfile);
		model.addAttribute("listBodyProfile", listBodyProfile);
		model.addAttribute("page", page);

		return "dy/dyBodyProfile";

	}

	// 클릭한 게시글 조회
	@GetMapping(value = "dySelectBodyProfile")
	public String dySelectBodyProfile(Board board1, Model model) {
		System.out.println("DYController dySelectBodyProfile Start...");
		Board board = dys.selectBodyProfile(board1.getB_number());
		model.addAttribute("board", board);

		return "dy/dySelectBodyProfile";
	}

	// 게시글 수정하기 폼
	@GetMapping(value = "dyUpdateFormBodyProfile")
	public String dyUpdateFormBodyProfile(Board board1, Model model) {
		System.out.println("updateFormBodyProfile Start...");

		Board board = dys.selectBodyProfile(board1.getB_number());
		System.out.println("board.getB_number -> " + board.getB_number());

		String regDate = "";
		if (board.getB_regdate() != null) {
			regDate = board.getB_regdate().substring(0, 10);
			board.setB_regdate(regDate);
		}
		System.out.println("regDate -> " + regDate);
		model.addAttribute("board", board);
		return "dy/dyUpdateFormBodyProfile";

	}

	// 게시글 수정하기
	@PostMapping(value = "dyUpdateBodyProfile")
	public String dyUpdateBodyProfile(Board board, Model model) {
		log.info("dyUpdateBodyProfile Start...");

		int updateCount = dys.dyUpdateBodyProfile(board);
		System.out.println("DYController updateCount -> " + updateCount);

		return "redirect:listBodyProfile";
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
	public String dyWriteBodyProfile(Board board, Model model) {
		System.out.println("DYController dyWriteBodyProfile Start..");

		int insertResult = dys.insertBodyProfile(board);
		System.out.println("DYController insertResult -> " + insertResult);
		if (insertResult > 0)
			return "redirect:/listBodyProfile";
		else {
			model.addAttribute("msg", "입력 실패 확인해 보세요");
			return "forward:/dy/dyWriteFormBodyProfile";
		}
	}

	// 게시글 삭제
	@RequestMapping(value = "dyDeleteBodyProfile")
	public String dyDeleteBodyProfile(Board board, Model model) {
		System.out.println("DYController delete Start...");
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

	// 이미지 업로드
	@RequestMapping(value = "dyUploadForm", method = RequestMethod.POST)
	public String dyUploadForm(HttpServletRequest request, Model model) throws IOException, Exception {

		Part image = request.getPart("b_images");
		InputStream inputStream = image.getInputStream();
		// 파일 확장자 구하기
		String fileName = image.getSubmittedFileName();
		System.out.println("fileName -> " + fileName);

		String[] split = fileName.split("\\.");
		String originalName = split[split.length - 2];
		String suffix = split[split.length - 1];

		System.out.println("originalName -> " + originalName);
		System.out.println("suffix -> " + suffix);

		// Servlet 상속 받지 못했을 때 realPath 불러오는 방법
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
		System.out.println("uploadForm POST Start..");
		String savedName = uploadFile(originalName, inputStream, uploadPath, suffix);

		
		
		
		
		log.info("Return savedName : " + savedName);
		model.addAttribute("savedName", savedName);

		return "dyUploadResult";
	}

	private String uploadFile(String originalName, 
							InputStream inputStream, 
							String uploadPath, 
							String suffix) throws IOException {
		UUID uid = UUID.randomUUID();
		System.out.println("uploadPath -> " + uploadPath);
		
		File fileDirectory = new File(uploadPath);
		if (!fileDirectory.exists()) {
			// 신규폴더(Directory) 생성
			fileDirectory.mkdirs();
			System.out.println("업로드용 폴더 생성 : " + uploadPath);
		}
		
		String savedName = uid.toString() + "_" + originalName + "." + suffix;
		log.info("savedName: " + savedName);
		
		
		File tempFile = new File(uploadPath+savedName);
		File tempFile3 = new File("c:/backup/" + savedName);
		FileOutputStream outputStream3 = new FileOutputStream(tempFile3);
		// 생성된 임시파일에 요청으로 넘어온 file의 inputStream 복사
		try (FileOutputStream outputStream = new FileOutputStream(tempFile)) {
			int read;
			byte[] bytes = new byte[1024];
			while ((read = inputStream.read(bytes)) != -1) {
				outputStream.write(bytes, 0, read);
				outputStream3.write(bytes, 0, read);
			}
		}
		inputStream.close();
		outputStream3.close();
		
		return savedName;
		
	}

}