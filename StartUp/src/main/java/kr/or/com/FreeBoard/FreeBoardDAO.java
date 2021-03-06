package kr.or.com.FreeBoard;

import java.util.List;

public interface FreeBoardDAO {
	
	//자유게시판 글 읽기
	public List<FreeBoardDTO> selectFreeBoard();
	
	//자유게시판 글쓰기
	public int FreeBoardWrite(FreeBoardDTO dto);
	
	//자유게시판 상세 글보기
	public FreeBoardDTO FreeBoardDetail(String bno);
	
	//자유게시판 상세보기 클릭시 조회수 증가
	public int updateCnt(String bno);
	
	
}
