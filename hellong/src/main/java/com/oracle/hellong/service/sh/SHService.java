package com.oracle.hellong.service.sh;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.GS;
import com.oracle.hellong.model.Gym;
import com.oracle.hellong.model.GymBoardFile;
import com.oracle.hellong.model.Member;
import com.oracle.hellong.model.Report;

public interface SHService {

	int totalquestions(int m_num);

	boolean authenticate(String userId);

	List<Board> quelist(Board board);

	int changeM_num(String member_id);

	Board boardContent(int b_NUMBER);

	void addAttribute(Board board);

	void delete_que(int bId);

	void addComment(Board board);

	List<Board> getComments(int b_NUMBER);

	Board callComment(Board board);

	void deleteComment(int b_number);

	void updateAttribute(Board board);

	Map<Integer, Integer> getCommentCountsForPosts(List<Board> listBoard);

	List<Member> getAllMember();

	List<Gym> getAllGym();

	Member getMember(int id);

	void updateMember(int m_number, int admin);

	void deleteMember(int m_number);

	Gym getGym(int g_id);

	String storeFile(MultipartFile imageFile);

	void registerGym(Gym gym);

	void deleteGym(int g_id);

	void updateOpenGym(int g_id, int common_mcd);

	List<Report> getAllReport();

	void delReport(int b_number);

	List<Board> getallQnA();

	void delThisTable(int b_number);

	List<Gym> findAllGyms();

	Gym getNewGym();

	Gym getCheapGym();

	Gym getManyGym();
	
	Gym getStarGym();

	GS getGymPrice(int g_id1);

	GymBoardFile getGymPhoto(int g_id2);


	Board getNotice();

	Board getPopular();

	Board getbodyProfil();

	Gym gymMapDetail(int gId);
	
	List<Board> getPComments(int B_NUMBER);

	List<GymBoardFile> getAllBoardFiles();


	

}