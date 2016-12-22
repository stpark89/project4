package kr.or.com.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class indexController {

	@RequestMapping("/AddMember.do")
	public String index(){
		System.out.println("index 컨트롤러");
		return "member.AddMember";
	}

}
