package kr.or.com.FreeBoard;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FreeBoardService {


	@Autowired
	private SqlSession sqlSession;
	
	//자유게시판 리스트 뿌려주는 메서드
	public List<FreeBoardDTO> selectBoard(){
		FreeBoardDAO dao = sqlSession.getMapper(FreeBoardDAO.class);
		List<FreeBoardDTO> list = dao.selectFreeBoard();
		return list;
	}
	
	//자유게시판 글쓰기
	public String writeBoard(FreeBoardDTO dto){
		
		String result = "";
		int insertResult = 0;
		
		System.out.println("서비스 부분 dto : "+dto.toString());
		
		FreeBoardDAO dao = sqlSession.getMapper(FreeBoardDAO.class);
		
		try{
		
			insertResult = dao.FreeBoardWrite(dto);
			if(insertResult > 0){
				result = "성공";
			}else{
				result = "실패";
			}

		}catch(Exception e){
			result = "실패";
			e.printStackTrace();
		}
		return result;
	}
	
	//자유게시판 상세 글보기
	public FreeBoardDTO selectDetail(String bno){
		
		FreeBoardDTO dto = null;
		FreeBoardDAO dao = sqlSession.getMapper(FreeBoardDAO.class);
		
		try{
			dao.updateCnt(bno);
			dto = dao.FreeBoardDetail(bno);
		}catch(Exception e){
			e.printStackTrace();
		}
		return dto;
	}
	
}
