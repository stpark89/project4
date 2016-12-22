package kr.or.com.FreeBoard;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FreeBoardService {


	@Autowired
	private SqlSession sqlSession;
	
	public String writeBoard(FreeBoardDTO dto){
		
		String result = "";
		
		System.out.println("서비스 부분 dto : "+dto.toString());
		
		
		return result;
	}
}
