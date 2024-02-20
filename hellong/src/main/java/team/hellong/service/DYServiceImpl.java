package team.hellong.service;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import team.hellong.dao.dydao.DYBoardDao;

@Service
@RequiredArgsConstructor
public class DYServiceImpl implements DYService {
	private final DYBoardDao dybd;
	//각자 자신 dao 쓰기
	
	//메서드 네이밍룰로 겹치지 않게..
}
