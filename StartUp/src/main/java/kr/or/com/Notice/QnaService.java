package kr.or.com.Notice;
/*
 * 작성일 : 2016-12-27
 * 작성자 : 하재현
 * 목 적 : QnA 관련 service
 * 
 * */
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaService {
 
	@Autowired
	private SqlSession sqlSession;
	
	public List<QnaDTO> qnaList(){
     
		QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
		List<QnaDTO> list =dao.qnaList();
		return list;
	}
}
