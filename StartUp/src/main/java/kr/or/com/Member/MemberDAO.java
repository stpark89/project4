package kr.or.com.Member;

public interface MemberDAO {

	//로그인
	public MemberDTO login(MemberDTO dto);
	
	//회원가입
	public int AddMember(MemberDTO dto);
	
	//회원가입시 아이디 중복확인
	public String checkId(String id);
	
	//관심사
	public MemberDTO selectInterest(String id);
}
