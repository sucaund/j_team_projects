package com.oracle.hellong.dao.jhdao;

import java.util.List;

import com.oracle.hellong.model.MemberGym;

public interface MemberDao {
	List<MemberGym> memberGymList(MemberGym memberGym);

	int totConCount();


	

}
