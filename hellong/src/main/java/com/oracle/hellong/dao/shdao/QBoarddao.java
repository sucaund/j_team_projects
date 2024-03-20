package com.oracle.hellong.dao.shdao;

import java.util.List;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.GS;
import com.oracle.hellong.model.Gym;
import com.oracle.hellong.model.GymBoardFile;
import com.oracle.hellong.model.Member;
import com.oracle.hellong.model.Report;

public interface QBoarddao {

	int               totalQue(int m_num);


	List<Board> quelist(Board board);


	int changeNum(String member_id);


	Board ContentBoard(int b_NUMBER);


	void addAttribute(Board board);


	void delete_que(int bId);


	void addComment(Board board);


	List<Board> getComments(int board);


	Board callComment(Board board);


	void deleteComment(int b_number);


	void updateAttribute(Board board);


	int countCommentsByBNumber(int bNumber);


	List<Member> getAllMember();


	List<Gym> getAllGym();


	Member getMember(int id);


	void updateMember(int m_number, int m_number2);


	void deleteMember(int m_number);


	Gym getGym(int g_id);


	void registerGym(Gym gym);


	void deleteGym(int g_id);


	void updateOpenGym(int g_id, int common_mcd);


	List<Report> getAllReport();


	void delReport(int b_number);


	List<Board> getallQnA();


	void delThisTable(int b_number);


	Gym getNewGym();


	Gym getCheapGym();


	Gym getManyGym();


	Gym getStarGym();


	GS getGymPrice(int g_id1);


	GymBoardFile getGymPhoto(int g_id2);


	Board getNotice();


	Board getPopular();


	Board getbodyProfile();


	List<Board> getPComments(int b_number);





}