package com.oracle.hellong.dao.dydao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.BoardFile;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class DYBoardFileDaoImpl implements DYBoardFileDao {

	private final SqlSession session;
	
	@Override
	public int insertFileBodyProfile(BoardFile boardFile) {
		int result = 0;
		System.out.println("DYBoardFileDaoImpl Insert Start..." + boardFile);
		try {
			result = session.insert("dyInsertFileBodyProfile", boardFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
