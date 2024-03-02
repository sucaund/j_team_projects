package com.oracle.hellong.service.sh;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.oracle.hellong.model.Board;

public interface SHService {

	int totalquestions(int m_num);

	boolean authenticate(String userId);

	List<Board> quelist(Board board);

	int changeM_num(String member_id);

	Board boardContent(int b_NUMBER);

	void addAttribute(Board board);

	void delete_que(int bId);

	void addComment(Board board);

	List<Board> getComments(int b_NUMBER);

	Board callComment(Board board);

	void deleteComment(int b_number);

	void updateAttribute(Board board);

	Map<Integer, Integer> getCommentCountsForPosts(List<Board> listBoard);


	

}
