package com.oracle.hellong.service.jm;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.hellong.dao.jmdao.JmMemberDao;
import com.oracle.hellong.model.Member;

import jakarta.validation.Valid;

//import com.oracle.hellong.model.Emp;
//import com.oracle.hellong.model.EmpDept;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional // jpa에서 사용
public class JMServiceImpl implements JMService {

	private final JmMemberDao jmmd;

	@Override
	public int jmTotalMember() { // 전체수 구하기
		System.out.println("JmServiceImpl Start jmTotalMember...");
		int totalMemberCount = jmmd.jmTotalMember();
		System.out.println("JmServiceImpl totalMember totMemCnt->" + totalMemberCount);
		return totalMemberCount;
	}

	@Override
	public List<Member> jmListMember(Member member) {
		List<Member> memberList = null; //리스트 뿌려주기
		System.out.println("JmServiceImpl jmListMember Start...");
		memberList = jmmd.jmListMember(member);
		System.out.println("JmServiceImpl jmListMember memberList.size()->" + memberList.size());
		return memberList;
	}

	@Override
	public Member jmDetailMember(int m_number) {
		//유저이름 클릭시 상세정보 보여줌 -> 마이페이지, 회원정보 수정에 활용가능할듯
		System.out.println("JmServiceImpl jmDetailMember...");
		Member member = null;
		member = jmmd.jmDetailMember(m_number);
		return member;
	}

	@Override
	public int jmUpdateMember(Member member) {
		//회원정보 수정
		System.out.println("JmServiceImpl jmUpdateMember ...");
		int updateCount = 0;
		updateCount = jmmd.jmUpdateMember(member);
		return updateCount;
	}
	
	public List<Member> jmListMember() {
		List<Member> memberList = null;
		System.out.println("JMServiceImpl jmlistMember() Start..." );
		memberList =  jmmd.jmListMember();  
		System.out.println("JMServiceImpl jmlistMember() memberList.size()->" +memberList.size());
		return memberList;
	}

	@Override
	public int insertMember(@Valid Member member) {
		int result = 0;
		System.out.println("jmServiceImpl insert Start..." );
		result = jmmd.insertMember(member);
		return result;
	}

}
