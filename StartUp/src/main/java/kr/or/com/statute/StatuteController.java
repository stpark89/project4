package kr.or.com.statute;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StatuteController {

	@RequestMapping("/statute.do")
	public String statute(){
		System.out.println("법률");
		return "statute.statute";
	}
	
}
