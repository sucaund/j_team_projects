package com.oracle.hellong.dao.jmdao;

import java.util.List;

import com.oracle.hellong.model.Member;

import jakarta.validation.Valid;

public interface JmMemberDao {

	int jmTotalMember();

	List<Member> jmListMember(Member member);

	Member jmDetailMember(int m_number);

	int jmUpdateMember(Member member);

	List<Member> jmListMember();

	int jmInsertMember(@Valid Member member);

	Member jmGetMemberFromId(String m_id);


}
