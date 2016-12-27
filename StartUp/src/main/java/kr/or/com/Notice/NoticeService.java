package kr.or.com.Notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {


	@Autowired
	private SqlSession sqlSession;
	
	//공지사항 처음 클릭시  사용되는 서비스 메서드
	public List<NoticeDTO> selectAllListNotice(){
		
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		
		List<NoticeDTO> list = dao.selectAllNotice_List();
		
		return list;
	}
	
}
