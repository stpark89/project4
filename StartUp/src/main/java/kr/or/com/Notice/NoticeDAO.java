package kr.or.com.Notice;

import java.util.List;

/*
 * 작성자 : 박성준
 * 작성일 : 2016-12-26
 * 목  적 : 공지사항 관련 인터페이스
 */
public interface NoticeDAO {

	//처음 헤더부분 클릭후 공지사항 페이지 이동시
	public List<NoticeDTO> selectAllNotice_List();
	
}
