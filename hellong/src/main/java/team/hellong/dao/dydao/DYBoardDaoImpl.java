package team.hellong.dao.dydao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class DYBoardDaoImpl implements DYBoardDao { 
	//이렇게 각자 자신이 쓸 dao 임의로 추가..
		 private final SqlSession session;
	

}

