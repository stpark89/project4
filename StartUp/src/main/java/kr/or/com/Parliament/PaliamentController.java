package kr.or.com.Parliament;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PaliamentController {

	@RequestMapping("/Member_Parliament.do")
	public String Parliament_List(){
		System.out.println("의원검색");
		return "parliament.ParliamentList";
	}
	
}
