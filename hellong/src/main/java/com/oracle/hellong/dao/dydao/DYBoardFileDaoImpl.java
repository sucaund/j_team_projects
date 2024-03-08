package com.oracle.hellong.dao.dydao;

import java.util.List;

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

//	@Override
//	public List<BoardFile> listFileBodyProfile(BoardFile boardFile) {
//		List<BoardFile> bodyProfileFileList = null;
//		System.out.println("DYBoardFileDaoImpl FileList Start...");
//		bodyProfileFileList = session.selectList("dyBodyProfileFileListAll", boardFile);
//		
//		return bodyProfileFileList;
//	}
	
}
