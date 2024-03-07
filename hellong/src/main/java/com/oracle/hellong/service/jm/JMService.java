package com.oracle.hellong.service.jm;

import java.util.List;

import com.oracle.hellong.model.Member;

import jakarta.validation.Valid;

public interface JMService {
	
	int jmTotalMember();

	List<Member> jmListMember(Member member);
	
	int jmTotalMemberReal();

	List<Member> jmListMemberReal(Member member);

	Member jmDetailMember(int m_number);

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





	



}
