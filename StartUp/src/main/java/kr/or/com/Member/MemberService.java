package kr.or.com.Member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	private SqlSession sqlSession;
	
	//로그인 시 사용
	public String Login(MemberDTO dto){
		System.out.println("서비스 : "+dto.toString());
		String resultDB = "";
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		MemberDTO result = dao.login(dto);
		
		try{
			if(result.getId() == null || result.getId().equals("")){
				resultDB = "실패";
			}else{
				resultDB = "성공";
			}	
		}catch(Exception e){
			resultDB = "실패";
		}finally{
			return resultDB;
		}
	}
	
	
	
}
