package com.oracle.hellong.dao.jhdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.MemberGym;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberDaoImpl implements MemberDao {
    private final SqlSession session;
    
	@Override
	public List<MemberGym> memberGymList(MemberGym memberGym) {
		List<MemberGym> memberGymList = null;
		System.out.println("MemberDaoImpl memberGymList Start ..." );
		try {                      
			memberGymList = session.selectList("memberGymList", memberGym);
		} catch (Exception e) {
			System.out.println("memberGymList memberGymList e.getMessage()->"+e.getMessage());
		}
		return memberGymList;
	}

	@Override
	public int totConCount() {
		int totConCount = 0;
		System.out.println("MemberDaoImpl Start totConCount..." );

		try {
			totConCount = session.selectOne("com.oracle.hellong.MemberGymMapper.totConCount");
		} catch (Exception e) {
			System.out.println("EmpDaoImpl totalEmp Exception->"+e.getMessage());
		}
		return totConCount;	
	}

}
