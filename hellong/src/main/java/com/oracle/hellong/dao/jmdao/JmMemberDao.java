package com.oracle.hellong.dao.jmdao;

import java.util.List;

import com.oracle.hellong.model.Member;

import jakarta.validation.Valid;

public interface JmMemberDao {

	int jmTotalMember();

	List<Member> jmListMember(Member member);
	
	int jmTotalMemberReal();

	List<Member> jmListMemberReal(Member member);

	Member jmGetMemberFromNumber(int m_number);

	int jmUpdateMember(Member member);

	int jmInsertMember(@Valid Member member);

	Member jmGetMemberFromId(String m_id);

	int jmDeleteMemberReal(int m_number);

	int jmDeleteMemberFake(Member member);

	int jmCheckId(String m_id);

	int jmLogin(String m_id, String m_pw);

	String jmGetIdFromMail(String mail);

	int jmGetM_numberFromIdAndEmail(String m_id, String m_email);

	String jmCheckPwDuple(int m_number, String m_pw);

	int jmResetPw(int m_number, String m_pw);

	int jmCheckMail(String m_email);
	
	


}
