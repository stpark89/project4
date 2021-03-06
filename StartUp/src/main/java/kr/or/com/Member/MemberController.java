package kr.or.com.Member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	@Autowired
	private View jsonview;
	
	@RequestMapping(value="/Login.do", method=RequestMethod.GET)
	public String login(){
		System.out.println("로그인 컨트롤러");
		return "member.Login";
	}
	
	@RequestMapping(value="/Login.do", method=RequestMethod.POST)
	public String loginResult(MemberDTO dto, HttpServletRequest request){
		//로그인 성공시 - 성공  
		//로그인 실패시 - 실패
		String result = service.Login(dto);
		System.out.println("로그인 결과 : "+result);
		if(result.equals("성공")){
			HttpSession session = request.getSession();
			session.setAttribute("id", dto.getId());
			return "redirect:index.do";	
		}else{
			return "member.Login";
		}
	}
	
    @RequestMapping("/chat.do")
    public String test(HttpServletRequest request, Model model){
    	System.out.println("chat.do=================");
    	HttpSession session = request.getSession();
    	String id =(String)session.getAttribute("id");
    	System.out.println("아이디 : "+id);
    	MemberDTO dto = service.selectInterest(id);
    	String[] interests = dto.getInterest().split(",");
    	
    	List<String> interest = new ArrayList<String>();
    	for(int i=0; i<interests.length; i++){
    		System.out.println(" 관심사:::::::::::"+interests[i]);
    		interest.add(interests[i]);
    	}
    	
    	model.addAttribute("interest", interest);
    	return "member.chat";
    }
	
	@RequestMapping("/LogOut.do")
	public String logOut(Model model, HttpServletRequest request){
		HttpSession session = request.getSession();
		session.invalidate();
		model.addAttribute("url", "index.do");
		return "LogOut";
	}
	
	//회원가입 페이지로 이동
	@RequestMapping(value="/AddMember.do", method=RequestMethod.GET)
	public String index(){
		return "member.AddMember";
	}
	
	//아이디 중복확인
	@RequestMapping("/checkId.do")
	public View checkId(String id, Model model){
		String result = service.checkId(id);
		if(result==null ||result ==""){
			model.addAttribute("msg", "사용가능한 아이디입니다");
		}else{
			model.addAttribute("msg", "이미 존재하는 아이디입니다");
		}
		
		return jsonview;
	}
	
	//회원가입 버튼 클릭시
	@RequestMapping("/addMemberResult.do")
	public String AddMember(MemberDTO dto, Model model){
		String msg =null;
		String url=null;
		System.out.println(" 회원가입 controller 1 :"+dto.toString());
		String[] birtharray = dto.getBirth().split(",");
		if(birtharray[1].length()==1){
			birtharray[1]="0"+birtharray[1];
			if(birtharray[2].length()==1){
				birtharray[2]="0"+birtharray[2];
			}
		}else if(birtharray[2].length()==1){
			birtharray[2]="0"+birtharray[2];
		}
		String birth=birtharray[0]+"-"+birtharray[1]+"-"+birtharray[2];
		System.out.println(" 생년월일 : "+birth);
		dto.setBirth(birth);
		
		
		if(dto.getInterest() == null){
			dto.setInterest("0");
		}
		System.out.println(" 회원가입 controller  2 :"+dto.toString());
		int result = service.AddMember(dto);
		if(result>0){
			msg="회원가입을 축하드립니다";
			url="Login.do";
		}else{
			msg="회원가입을 실패했습니다";
			url="AddMember.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "member.MemberRedirect";
	}
}
