package kr.or.com.Member;

public interface MemberDAO {

	//로그인
	public MemberDTO login(MemberDTO dto);
	
	//회원가입
	public int AddMember(MemberDTO dto);
	
}
