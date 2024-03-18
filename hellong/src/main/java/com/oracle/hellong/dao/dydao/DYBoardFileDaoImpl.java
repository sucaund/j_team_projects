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

	// 게시판 업로드파일 조회
	@Override
	public List<BoardFile> selectBodyProfileFileList(int b_number) {
		System.out.println("DYBoardFileDaoImpl select start...");
		List<BoardFile> boardFileList = null;
		boardFileList = session.selectList("dyBodyProfileFileList", b_number);
		return boardFileList;
	}
	
	// 게시판 파일 업로드
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
	
	// 게시판 파일 삭제
	@Override
	public void deleteFileById(int bf_id) {
		session.delete("dyDeleteFileById", bf_id);
		
	}
	// 게시판 파일 업데이트(삭제)
	@Override
	public void updateDeleteFileById(int b_number) {
		session.delete("dyUpdateDeleteFileById", b_number);
		
	}
	// 게시판 파일 리스트(목록)
	@Override
	public List<BoardFile> listFileBodyProfile(BoardFile boardFile) {
		List<BoardFile> bodyProfileFileList = null;
		bodyProfileFileList = session.selectList("dyBodyProfileFileListAll", boardFile);
		// System.out.println("***bodyProfileFileList -> " + bodyProfileFileList);
		return bodyProfileFileList;
		
	}
	
	// 게시판 내 파일 검색
	@Override
	public List<BoardFile> listSearchBoardFileByBoardId(int b_number) {
		List<BoardFile> listSearchBoardFileByBoardId = null;
		listSearchBoardFileByBoardId = session.selectList("dyListSearchBoardFileByBoardId", b_number);
		return listSearchBoardFileByBoardId;
	}

	
	
	
	
}