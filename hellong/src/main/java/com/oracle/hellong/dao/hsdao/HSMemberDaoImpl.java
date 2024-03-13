package com.oracle.hellong.dao.hsdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.Board;
import com.oracle.hellong.model.Member;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class HSMemberDaoImpl implements HSMemberDao {
	
	private final SqlSession session;
	
		/* 공통 - 회원정보 받기 */
		
	@Override
	public Member getMemberData(int m_number) {
		Member memberData = null;
		System.out.println("MemberDaoImpl getMemberData start...");
		
		try {
			memberData = session.selectOne("hsGetMemberData", m_number);
			System.out.println("MemberDaoImpl getMemberData memberNumber-> " + memberData.getM_number());
		} catch (Exception e) {
			System.out.println("MemberDaoImpl getMemberData Exception-> " + e.getMessage());
		}
		return memberData;
	}
	
		/* 임시 로그인 */
	
	@Override
	public int totalMember() {
		int totalMemberCnt = 0;
		System.out.println("MemberDaoImpl totalMember start...");
		
		try {
			totalMemberCnt = session.selectOne("com.oracle.hellong.MemberMapper.hsTotalMemberCnt");
			System.out.println("MemberDaoImpl totalMember totalMemberCnt->" + totalMemberCnt);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl totalMember Exception->" + e.getMessage());
		}
		return totalMemberCnt;
	}

	@Override
	public List<Member> listMember(Member member) {
		List<Member> listMember = null;
		System.out.println("MemberDaoImpl listMember start...");
		
		try {
			listMember = session.selectList("hsListMember", member);
			System.out.println("MemberDaoImpl listMember listMember.size()->" + listMember.size());
		} catch (Exception e) {
			System.out.println("MemberDaoImpl listMember Exception ->" + e.getMessage());
		}
		return listMember;
	}
	
 
}