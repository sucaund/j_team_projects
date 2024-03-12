package com.oracle.hellong.dao.hsdao;

import java.util.List;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.Member;

public interface HSMemberDao {

	int totalMember(Member member);

	List<Member> listMember(Member member);
	
	Member getMemberData(int m_number);

}
