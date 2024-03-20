package com.oracle.hellong.service.sh;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.sql.DataSource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.hellong.dao.shdao.QBoarddao;
import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.GS;
import com.oracle.hellong.model.Gym;
import com.oracle.hellong.model.GymBoardFile;
import com.oracle.hellong.model.Member;
import com.oracle.hellong.model.Report;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SHServiceImpl implements SHService {

	private final QBoarddao qd;
	private final DataSource dataSource;
	private String uploadDir = "uploads/";
	@Override
	public int totalquestions(int M_NUMBER) {
		System.out.println("SHServiceImpl Start totalquestions...");
		int totQueCnt = qd.totalQue(M_NUMBER);
		System.out.println("SHServiceImpl totalquestions totEmpCnt->" + totQueCnt);
		return totQueCnt;
	}

	// 해당로그인 한계정이 있는지 확인...
	@Override
	public boolean authenticate(String userId) {
		String sql = "SELECT COUNT(*) FROM member WHERE M_ID=?";
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, userId);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return rs.getInt(1) > 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace(); // 실제 애플리케이션에서는 적절한 로깅 및 예외 처리를 해야 합니다.
		}
		return false;
	}

//질문글 리스트
	@Override
	public List<Board> quelist(Board board) {
		System.out.println("SHServiceImpl Start quelist...");
		List<Board> boardList = null;
		boardList = qd.quelist(board);
		System.out.println("SHServiceImpl boardList size-->" + boardList.size());
		return boardList;
	}

//아이디를 회원번호로 바꾸어주는 메서드
	@Override
	public int changeM_num(String member_id) {
		System.out.println("SHServiceImpl Start changeM_num...");
		int m_num = 0;
		m_num = qd.changeNum(member_id);
		System.out.println("SHServiceImpl changeM_num m_num" + m_num);
		return m_num;
	}

//해당 B_NUMBER글 가져오기
	@Override
	public Board boardContent(int b_NUMBER) {
		System.out.println("SHServiceImpl Start boardContent...");
		Board boardContent = null;
		boardContent = qd.ContentBoard(b_NUMBER);
		System.out.println("SHServiceImpl boardContent.size()->" + boardContent);
		return boardContent;
	}

//글추가
	@Override
	public void addAttribute(Board board) {
		System.out.println("SHServiceImpl Start addAttribute...");
		qd.addAttribute(board);

	}

//글삭제!
	@Override
	public void delete_que(int bId) {
		System.out.println("SHServiceImpl Start delete_que...");
		qd.delete_que(bId);

	}

//댓글 입력+댓글 카운터 증가
	@Transactional
	@Override
	public void addComment(Board board) {
		System.out.println("SHServiceImpl Start addComment...");
		System.out.println("SHServiceImpl addComment board->>" + board);
		qd.addComment(board);

	}
//입력하자마자 입력한댓글 출력
	@Override
	public Board callComment(Board board) {
		System.out.println("SHServiceImpl Start callComment...");

		Board board2 = qd.callComment(board);
		System.out.println(
				"@SHServiceImpl callComment board2()->" + board2);
		return board2;
	}

// 댓글가져오는...
	@Override
	public List<Board> getComments(int B_NUMBER) {
		System.out.println("SHServiceImpl getComments Start...");
		System.out.println("SHServiceImpl getComments board->>" + B_NUMBER);
		List<Board> boardlist = qd.getComments(B_NUMBER);
		return boardlist;
	}
	// SHServiceImpl 자유댓글가져오는... 03-19
		@Override
		public List<Board> getPComments(int B_NUMBER) {
			System.out.println("SHServiceImpl getPComments Start...");
			System.out.println("SHServiceImpl getPComments board->>" + B_NUMBER);
			List<Board> boardlist = qd.getPComments(B_NUMBER);
			return boardlist;
		}
//댓글삭제
	@Override
	public void deleteComment(int b_number) {
		System.out.println("SHServiceImpl deleteComment Start...");
		qd.deleteComment(b_number);
	}
//글수정
	@Override
	public void updateAttribute(Board board) {
		System.out.println("SHServiceImpl updateAttribute Start...");
		System.out.println("SHServiceImpl updateAttribute board->" + board);
		qd.updateAttribute(board);
	}
//댓글수 확인
	@Override
	public Map<Integer, Integer> getCommentCountsForPosts(List<Board> listBoard) {
		System.out.println("SHServiceImpl getCommentCountsForPosts Start...");
		System.out.println("SHServiceImpl getCommentCountsForPosts listBoard->"+listBoard);

		Map<Integer, Integer> commentCounts = new HashMap<>();
		    for (Board board : listBoard) {
		        int bNumber = board.getB_number();
		        int count = qd.countCommentsByBNumber(bNumber);
		        commentCounts.put(bNumber, count);
		    }
		    return commentCounts;
	}
//관리자 페이지=======================================
	//모든멤버 가져오기
	@Override
	public List<Member> getAllMember() {
		List<Member> getAllMember = qd.getAllMember();
		return getAllMember;
	}
	//모든헬스장 가져오기
	@Override
	public List<Gym> getAllGym() {
		List<Gym> getAllGym= qd.getAllGym();
		return getAllGym;
	}
	// 신고 정보 가져오기
	
	@Override
	public List<Report> getAllReport() {
		List<Report> AllReport = qd.getAllReport();
		return AllReport;
	}
	
	
//모달에 멤버 정보를 추가
	@Override
	public Member getMember(int id) {
		Member member =qd.getMember(id);
		return member;
	}
//멤버 등급변경
	@Override
	public void updateMember(int m_number, int admin) {
		System.out.println("SHServiceImpl updateMember  m_number->"+m_number);
		System.out.println("SHServiceImpl updateMember  admin->"+admin);
		qd.updateMember(m_number,admin);
		
	}
//멤저제거
	@Override
	public void deleteMember(int m_number) {
		System.out.println("SHServiceImpl deleteMember  m_number->"+m_number);
		qd.deleteMember(m_number);
	}
	
//헬스장 제거
	
	@Override
	public void deleteGym(int g_id) {
		System.out.println("SHServiceImpl deleteGym  g_id->"+g_id);
		qd.deleteGym(g_id);

	}
	
	//모달에 체육관 정보를 추가
	@Override
	public Gym getGym(int g_id) {
		System.out.println("SHServiceImpl getGym  g_id->"+g_id);
		Gym gym = qd.getGym(g_id);
		return gym;
	}
//체육관 등록
	@Override
	public void registerGym(Gym gym) {
		System.out.println("SHServiceImpl registerGym  gym->"+gym);
		qd.registerGym(gym);
		
	}
	
	//체육관에 저장한사진 이미파일 저장및 경로 추출
	@Override
	public String storeFile(MultipartFile imageFile) {
		System.out.println("SHServiceImpl storeFile  imageFile->"+imageFile);
		String uuid = UUID.randomUUID().toString().substring(0, 8); // UUID의 첫 8자리 사용
		String originalFileName = imageFile.getOriginalFilename();
		String fileExtension  = "";
	    if (originalFileName != null && originalFileName.contains(".")) {
	        fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
	    }
	    String fileName = uuid + fileExtension;
        try {
        	Path targetLocation = Paths.get(uploadDir).toAbsolutePath().normalize();
        	if (Files.notExists(targetLocation)) {
                Files.createDirectories(targetLocation);
                System.out.println("파일경로 생성!");
            }
        	Path filePath = targetLocation.resolve(fileName);
        	// 파일을 저장하는 로직
            Files.copy(imageFile.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
            System.out.println("파일 저장 경로: " + filePath.toAbsolutePath().toString());
		} catch (Exception e) {
			// TODO: handle exception
		}
		return fileName;
	}

//헬스장 등급 변경
	@Override
	public void updateOpenGym(int g_id, int common_mcd) {
		System.out.println("SHServiceImpl updateOpenGym m_number"+g_id);
		System.out.println("SHServiceImpl updateOpenGym common_mcd"+common_mcd);
		qd.updateOpenGym(g_id,common_mcd);
		
	}
//신고글 삭제
	@Override
	public void delReport(int b_number) {
		System.out.println("SHServiceImpl delReport b_number"+b_number);
		qd.delReport(b_number);
	}
//모든 문의글 가져오기
	@Override
	public List<Board> getallQnA() {
		System.out.println("SHServiceImpl getallQnA start...");
		List<Board> boardList = null;
		boardList = qd.getallQnA();
		System.out.println("SHServiceImpl boardList size-->" + boardList.size());
		return boardList;
	}

//문의글 테이블에서만 삭제
	@Override
	public void delThisTable(int b_number) {
		System.out.println("SHServiceImpl delThisTable b_number"+b_number);
		qd.delThisTable(b_number);
		
	}

	@Override
	public List<Gym> findAllGyms() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Gym getNewGym() { // 신규헬스장
	    Gym newGym = qd.getNewGym();
	    return newGym;
	}

	@Override
	public Gym getCheapGym() { // 최저가헬스장
	    Gym cheapGym = qd.getCheapGym();
	    return cheapGym;
	}

	@Override
	public Gym getManyGym() { // 최대인원헬스장
	    Gym manyGym = qd.getManyGym();
	    return manyGym;
	}

	@Override
	public Gym getStarGym() { // 높은별점헬스장
	    Gym starGym = qd.getStarGym();
	    return starGym;
	}
	
	//헬스장 가격
	@Override
	public GS getGymPrice(int g_id1) {
		GS GymPrice = qd.getGymPrice(g_id1);
		return GymPrice;
	}
	//헬스장 대표 사진
	@Override
	public GymBoardFile getGymPhoto(int g_id2) {
		GymBoardFile GymPhoto = qd.getGymPhoto(g_id2);
		return GymPhoto;
	}

	
	
	@Override
	public Board getNotice() { // 최신공지사항
	    Board notice = qd.getNotice();
	    return notice;
	}

	@Override
	public Board getPopular() { // 인기자유글
	    Board popular = qd.getPopular();
	    return popular;
	}

	@Override
	public Board getbodyProfil() { // 인기바디프로필
	    Board bodyProfile = qd.getbodyProfile();
	    return bodyProfile;
	}

	@Override
	public Gym gymMapDetail(int gId) {
		Gym gym = qd.gymMapDetail(gId);
		return gym;
	}
	
	@Override
	public List<GymBoardFile> getAllBoardFiles() { //03-19 맵에 대표이미지 가져오기실험
		List<GymBoardFile> boardFiles = qd.getAllBoardFiles();
		System.out.println("SHServiceImpl getAllBoardFiles boardFiles->"+boardFiles);

		return boardFiles;
	}

	

}