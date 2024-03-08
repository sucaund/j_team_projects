package com.oracle.hellong.dao.jhdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.Gym;
import com.oracle.hellong.model.GymBoardFile;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class GymBoardFileDaoImpl implements GymBoardFileDao {
	private final SqlSession session;

	@Override
	public List<GymBoardFile> gbf_idList(Gym g_id) {
		List <GymBoardFile> gbf_idList = null;
		try {
			gbf_idList = session.selectList("gbf_idList",g_id);
		}catch(Exception e) {
			System.out.println("GymBoardFileDaoImpl gbf_idList Exception -> "+e.getMessage());
		}		
		return gbf_idList;
	}
	
	
	@Override
	public void saveGymFile(GymBoardFile gymBoardFile) {
		System.out.println("GymBoardFileDaoImpl saveGymFile"+gymBoardFile.getG_id());
		int saveGymFile =0;
		try {
			saveGymFile = session.insert("saveGymFile",gymBoardFile);
		}catch(Exception e) {
			System.out.println("GymBoardFileDaoImpl gymId Exception -> "+e.getMessage());
		}
		
	}
	// 시존 파일 불러오기
	@Override
	public List<GymBoardFile> getFilesByGymId(int g_id) {
		List <GymBoardFile> getFilesByGymId = null;
		System.out.println(g_id);
		try {
			getFilesByGymId = session.selectList("getFilesByGymId",g_id);
		}catch(Exception e) {
			System.out.println("GymBoardFileDaoImpl getFilesByGymId Exception -> "+e.getMessage());
		}		
		return getFilesByGymId;
	}

	//사진 파일 삭제
	@Override
	public void deleteGymFile(int g_id) {
		int deleteGymFile =0;
		try {
			deleteGymFile = session.delete("deleteGymFile",g_id);
		}catch(Exception e) {
			System.out.println("GymBoardFileDaoImpl deleteGymFile Exception -> "+e.getMessage());
		}
		
	}

	//사진 리스트
	@Override
	public List<GymBoardFile> gymBoardFileList() {
		List <GymBoardFile> gymBoardFileList = null;
		try {
			gymBoardFileList = session.selectList("JHgymBoardFileList");
		}catch(Exception e) {
			System.out.println("GymBoardFileDaoImpl gymBoardFileList Exception -> "+e.getMessage());
		}		
		return gymBoardFileList;
	}

	//글 상세 사진
	@Override
	public List<GymBoardFile> gymBoardFileListRead(int g_id) {
		List <GymBoardFile> gymBoardFileListRead = null;
		try {
			gymBoardFileListRead = session.selectList("gymBoardFileListRead",g_id);
			System.out.println("gymBoardFileListRead.size() => "+gymBoardFileListRead.size());
		}catch(Exception e) {
			System.out.println("GymDaoImpl gymBoardFileListRead Exception -> "+e.getMessage());
		}		
		return gymBoardFileListRead;
	}


	

}
