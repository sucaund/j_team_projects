package com.oracle.hellong.repository;

import java.util.List;
import java.util.Optional;

import com.oracle.hellong.domain.MemberJpa;

public interface MemberJpaRepository { 
	//jpa쓸때, jpa를 호출하는 ServiceImpl 위에 @Transactional(jakarta 아닌 springframework) 붙이고 
	//ServiceImpl 안에서 private final Entity Manager em; 선언해 씀
	MemberJpa save(MemberJpa memberJpa);
	List<MemberJpa> findAll();
	Optional<MemberJpa> findById(int m_id);
	void updateByMember(MemberJpa memberJpa);
}

