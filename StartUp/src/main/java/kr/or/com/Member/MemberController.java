package kr.or.com.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {

	@Autowired
	MemberService service;

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
			return "LoginSuccessIndex";	
		}else{
			return "member.Login";
		}
	}
	
	@RequestMapping("/LogOut.do")
	public String logOut(Model model, HttpServletRequest request){
		HttpSession session = request.getSession();
		session.invalidate();
		model.addAttribute("url", "index.jsp");
		return "LogOut";
	}
	
}
