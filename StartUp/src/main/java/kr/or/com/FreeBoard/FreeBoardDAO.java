package kr.or.com.FreeBoard;

import java.util.List;

public interface FreeBoardDAO {
	
	//자유게시판 글 읽기
	public List<FreeBoardDTO> selectFreeBoard();
	
	//자유게시판 글쓰기
	public int FreeBoardWrite(FreeBoardDTO dto);
	
}