package com.oracle.hellong.dao.jhdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.oracle.hellong.model.GS;
import com.oracle.hellong.model.Gym;
import com.oracle.hellong.model.GymBoard;
import com.oracle.hellong.model.GymBoardFile;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class GymBoardDaoimpl implements GymBoardDao {
	
	private final SqlSession session;

	
	//**체육관 홍보 게시판 id 조회***********************************************************************************************************
	@Override
	public int gymForm(Gym g_id) {
		int gymCount = 0;
		System.out.println("GymBoardDaoimpl Start gymCount..." );
		try {
			gymCount = session.selectOne("jhgymCount",g_id);
		} catch (Exception e) {
			System.out.println("GymBoardDaoimpl gymCount Exception->"+e.getMessage());
		}
		return gymCount;	
	}
	
	// 헬스장 홍보글 수정 폼에 이전 글 불러오기 
	@Override
	public List<GymBoard> gymBoardDetail(Gym g_id) {
		List<GymBoard> gymBoardDetail = null;
		System.out.println("GymBoardDaoimpl Start gymBoardDetail..." );
		try {
			gymBoardDetail = session.selectList("jhgymDetail",g_id);
			System.out.println("GymBoardDaoimpl Start gymBoardDetail.size()->"+gymBoardDetail.size() );
		} catch (Exception e) {
			System.out.println("GymBoardDaoimpl gymBoardDetail Exception->"+e.getMessage());
		}
		return gymBoardDetail;
	}
	
	//글 최초 등록
	@Override
	public int saveGymPost(GymBoard gymboard) {
		int gymboardWrite = 0; 
		try {
			System.out.println("GymBoardDaoimpl saveGymPost gymboard->"+gymboard);
			gymboardWrite = session.insert("gymboardWrite",gymboard);
			System.out.println("GymBoardDaoimpl Start saveGymPost->"+gymboardWrite);
		} catch (Exception e) {
			System.out.println("GymBoardDaoimpl saveGymPost Exception->"+e.getMessage());
		}
		return gymboardWrite;	
	}
	
	//글 수정
	@Override
	public int updateGymPost(GymBoard gymboard) {
		int updateGymPost = 0; 
		try {
			updateGymPost = session.update("updateGymPost",gymboard);
			System.out.println("GymBoardDaoimpl Start updateGymPost->"+updateGymPost);
		} catch (Exception e) {
			System.out.println("GymBoardDaoimpl updateGymPost Exception->"+e.getMessage());
		}
		return updateGymPost;	
	}
	//글 삭제
	@Override
	public void deleteGymPost(int g_id) {
		int deleteGymPost = 0; 
		try {
			deleteGymPost = session.update("deleteGymPost",g_id);
			System.out.println("GymBoardDaoimpl Start updateGymPost->"+deleteGymPost);
		} catch (Exception e) {
			System.out.println("GymBoardDaoimpl updateGymPost Exception->"+e.getMessage());
		}
	}

	// 지점 찾기 - 지점 글 전체 불러오기
	@Override
	public List<GymBoard> gymBoardList() {
		List<GymBoard> gymBoardList = null;
		try {
			gymBoardList = session.selectList("gymBoardList");
			System.out.println("GymBoardDaoimpl Start gymBoardList.size()->"+gymBoardList.size() );
		} catch (Exception e) {
			System.out.println("GymBoardDaoimpl gymBoardDetail Exception->"+e.getMessage());
		}
		return gymBoardList;
	}




}



	
	

