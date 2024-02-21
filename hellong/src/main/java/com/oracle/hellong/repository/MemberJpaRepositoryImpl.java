package com.oracle.hellong.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Repository;

import com.oracle.hellong.domain.MemberJpa;

import jakarta.persistence.EntityManager;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberJpaRepositoryImpl implements MemberJpaRepository {

	private final EntityManager em; //jpa에 사용
	
	@Override
	public MemberJpa save(MemberJpa memberJpa) {
		System.out.println("MemberJpaRepositoryImpl save start...");
		em.persist(memberJpa);
		return memberJpa;
	}

	@Override
	public List<MemberJpa> findAll() {
		System.out.println("MemberJpaRepositoryImpl findAll start...");
		List<MemberJpa> memberList = em.createQuery("select m from Member m", MemberJpa.class)
				.getResultList();
		return memberList;
	}

	@Override
	public Optional<MemberJpa> findById(int m_id) {
		MemberJpa memberJpa=em.find(MemberJpa.class, m_id); //null값도 될 수 있는데
		return Optional.ofNullable(memberJpa); //null값도 넘어감. 그걸 위해 optional을 사용
	}

	@Override
	public void updateByMember(MemberJpa memberJpa) {
		System.out.println("MemberJpaRepositoryImpl findAll member->"+memberJpa);
		//em.merge(member); //현재 세팅된 것만 수정하고, 나머지는 null값으로 한다
//		MemberJpa memberJpa2=em.find(MemberJpa.class,memberJpa.getM_id()); //그래서 null쓰지말고
//		memberJpa2.setM_id(memberJpa.getM_id()); //find로 가져와서 세팅하는게 나음
//		memberJpa2.setM_name(memberJpa.getM_name());
		return;

	}

}
