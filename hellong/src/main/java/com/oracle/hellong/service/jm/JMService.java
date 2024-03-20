package com.oracle.hellong.service.jm;

import java.util.List;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.Gym;
import com.oracle.hellong.model.GymOrder;
import com.oracle.hellong.model.Member;

import jakarta.validation.Valid;

public interface JMService {
	
	int jmTotalMember();

	List<Member> jmListMember(Member member);
	
	int jmTotalMemberReal();

	List<Member> jmListMemberReal(Member member);

	Member jmGetMemberFromNumber(int m_number);

	int jmUpdateMember(Member member);

	int jmInsertMember(@Valid Member member);

	Member jmGetMemberFromId(String m_id);

	int jmDeleteMemberReal(int m_number);

	int jmDeleteMemberFake(Member member1);

	int checkId(String m_id);

	int sendMail(String mail);

	int jmLogin(String m_id, String m_pw);

	String jmGetIdFromMail(String mail);

	int jmGetM_numberFromIdAndEmail(String m_id, String m_email);

	String checkPwDuple(int m_number, String m_pw);

	int jmResetPw(int m_number, String m_pw);

	int checkMail(String m_email);

	int jmGetGymOrderGID(int m_number);

	Gym jmGetGymFromGID(int g_id);

	GymOrder jmGetGymOrder(int g_id, int m_number);

	String jmGetS_name(int g_id, int s_number);

	List<Board> jmMyPageBoardList(Board board);





	



}
