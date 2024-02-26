package com.oracle.hellong.dao.jmdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.Member;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class JmMemberDaoImpl implements JmMemberDao {

	// mybatis db 연동
	private final SqlSession session;

	@Override
	public int jmTotalMember() { //총 멤버수
		int totalMemberCount = 0;
		System.out.println("JmMemberDaoImpl Start jmTotalMember...");

		try { // 매퍼 사용. yml -> mappers/Emp->네임스페이스.select id
			totalMemberCount = session.selectOne("com.oracle.hellong.MemberMapper.jmMemberTotal");
			//null이 아니라 0으로 찾긴 찾았는데.. -> 데이터 넣고 커밋을 안해서 
			System.out.println("JmMemberDaoImpl jmTotalMember totMemberCount->" + totalMemberCount);
		} catch (Exception e) {
			System.out.println("JmMemberDaoImpl jmTotalMember Exception->" + e.getMessage());
		}
		return totalMemberCount;
	}

	@Override
	public List<Member> jmListMember(Member member) { //멤버 리스트로 뽑아 출력용
		List<Member> memberList = null;
		System.out.println("JmMemberDaoImpl jmListMember Start ...");
		try { // Map Id : member.xml에서의 id
			// parameter=그냥 이 메서드의 인자
			memberList = session.selectList("jmMemberListAll", member); //리스트 멤버
			System.out.println("JmMemberDaoImpl jmListMember memberList.size()->" + memberList.size());
		} catch (Exception e) {
			System.out.println("JmMemberDaoImpl jmListMember e.getMessage()->" + e.getMessage());
		}
		return memberList;
	}

	@Override
	public Member jmDetailMember(int m_number) { //멤버 상세정보 detail 보는 목적
		System.out.println("JmMemberDaoImpl jmDetailMember start..");
		// Emp emp = null;
		Member member = new Member();
		try {
			// mapper ID , Parameter
			member = session.selectOne("jmMemberSelectOne", m_number);
			System.out.println("EmpDaoImpl detail getEname->" + member.getM_number());
		} catch (Exception e) {
			System.out.println("EmpDaoImpl detail Exception->" + e.getMessage());
		}
		return member;
	}

	@Override
	public int jmUpdateMember(Member member) {
		System.out.println("JmMemberDaoImpl jmUpdateMember start..");
		int updateCount= 0;
		try {
			updateCount = session.update("jmMemberUpdate",member);
		} catch (Exception e) {
			System.out.println("JmMemberDaoImpl jmUpdateMember Exception->"+e.getMessage());
		}
		return updateCount;
	}
	
	@Override
	public List<Member> jmListMember() {
		List<Member> empList = null;
		System.out.println("jmMemberDaoImpl jmListMember() Start ..." );
		try {
			// emp 관리자만 Select           Naming Rule 
			empList = session.selectList("tkSelectManager");
		} catch (Exception e) {
			System.out.println("EmpDaoImpl listManager Exception->"+e.getMessage());
		}
		return empList;	
	}

	@Override
	public int insertMember(@Valid Member member) {
		int result = 0;
		System.out.println("jmMemberDaoImpl insertMember Start..." );
		try {
			result = session.insert("insertMember",member);
		} catch (Exception e) {
			System.out.println("jmMemberDaoImpl insertMember Exception->"+e.getMessage());
		}
		return result;
	}

}
