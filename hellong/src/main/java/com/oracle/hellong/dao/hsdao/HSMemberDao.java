package com.oracle.hellong.dao.hsdao;

import java.util.List;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.Member;

public interface HSMemberDao {
	
	/* 공통 - 회원정보 받기 */

	Member getMemberData(int m_number);

	/* 임시 로그인 */

	int totalMember();

	List<Member> listMember(Member member);

}
