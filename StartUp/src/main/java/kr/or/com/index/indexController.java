package kr.or.com.index;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

@Controller
public class indexController {

	@Autowired
	private View jsonview;

	//메인에서 코멘트 보내는 부분
	@RequestMapping("/indexComment.do")
	public View Comment(String title, String comment, String admin, Model model){
		
		System.out.println("넘어온 데이타 : "+title+"/ 코멘트 : "+comment + " / 관리자 : "+admin);
		model.addAttribute("data", "성공");
		return jsonview;
	}

}
